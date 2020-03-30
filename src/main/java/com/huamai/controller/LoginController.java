package com.huamai.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.huamai.constant.SysConstant;
import com.huamai.dto.TreeNodeS;
import com.huamai.entity.Role;
import com.huamai.entity.User;
import com.huamai.service.MenuService;
import com.huamai.service.RoleService;
import com.huamai.service.UserService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.CommonUtils;
import com.huamai.util.MD5Util;



@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private RoleService roleService;
	
	
	@RequestMapping("/vLogin")
    public ModelAndView vLogin()
    {
        return new ModelAndView("backstage/index/login");
    }

	@RequestMapping("/vIndex")
	public ModelAndView vIndex(HttpSession session)
    {
        ModelAndView model = new ModelAndView("backstage/index/index");
        
        User user = (User) session.getAttribute(SysConstant.UserSession);
        
        List<TreeNodeS> list = menuService.getMenuTreeByRole(Integer.parseInt(user.getRole()),false);
        
        List<TreeNodeS> menuList = getTreeMenu(list,"0");
        model.addObject("menuList", menuList);
        return model;
    }
	
	@RequestMapping("/vMain")
	public ModelAndView vMain()
    {
        ModelAndView model = new ModelAndView("backstage/index/main");
        
        return model;
    }
	
	
	/**
     * 用户登录
     * @param entity
     * @param session
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView login(@ModelAttribute("entity") User entity, HttpSession session, HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView();
        User user = userService.selectByName(entity.getUserName());
        session.removeAttribute("errorMsg");
        
        if (user == null)
        {
            model.setViewName("backstage/index/login");
            session.setAttribute("errorMsg", "用户不存在");
            return model;
        }
        String pass = MD5Util.getMD5(entity.getPassword());
        if (!pass.equals(user.getPassword()))
        {
            model.setViewName("backstage/index/login");
            session.setAttribute("errorMsg", "用户密码不正确");
            return model;
        }
        session.removeAttribute("errorMsg");
        Role role = roleService.selectById(Integer.parseInt(user.getRole()));
        user.setRoleName(role.getRoleName());
        session.setAttribute(SysConstant.UserSession, user);
        model = new ModelAndView(new RedirectView(request.getContextPath() + "/vIndex.do"));
        String imgPath = CommonUtils.readProperties("imgPath");		//图片上传地址
    	session.setAttribute("imgPath",imgPath);	
        return model;
    }
    
    /**
     * 用户登录
     * @param entity
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session, HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView();
        session.invalidate();
        model = new ModelAndView(new RedirectView(request.getContextPath() + "/vIndex.do"));
        return model;
    }
	
	/**
	 * 验证安全口令，用于确认系统敏感操作
	 * @param password
	 * @return
	 */
	@RequestMapping("/confirmPassword")
	@ResponseBody
	public BasePageResult confirmPassword(@RequestParam(required=false) String password)
    {
		if(CommonUtils.isNotEmpty(password)){
			String securityPassword = CommonUtils.readProperties("sys_securityPassword");
			if(securityPassword.equals(password)){
				return BasePageResultUtil.success();
			}
		}
		return BasePageResultUtil.failResult(-1, "口令错误");
    }
	

	private List<TreeNodeS> getTreeMenu(List<TreeNodeS> list, String parentId)
    {
		List<TreeNodeS> tree = new ArrayList<TreeNodeS>();
        for (TreeNodeS po : list)
        {
            if (po != null && po.getpId().equals(parentId) )
            {
            	List<TreeNodeS> temp = getChildMenu(po, list);
            	if(temp!=null&&temp.size()>0){
            		po.setChildTreeNodeS(temp);
            	}else{
            		po.setChildTreeNodeS(null);
            	}
            	tree.add(po);
            }
            
        }
        return tree;
    }


    private List<TreeNodeS> getChildMenu(TreeNodeS body, List<TreeNodeS> list)
    {
    	List<TreeNodeS> tree = new ArrayList<TreeNodeS>();
    	for (TreeNodeS po : list)
        {
            if (po != null && po.getpId().equals(body.getId()) )
            {
            	List<TreeNodeS> temp = getChildMenu(po, list);
            	if(temp!=null&&temp.size()>0){
            		po.setChildTreeNodeS(temp);
            	}else{
            		po.setChildTreeNodeS(null);
            	}
            	tree.add(po);
            }
        }
        return tree;
    }
}
