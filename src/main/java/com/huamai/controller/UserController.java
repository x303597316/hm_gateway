package com.huamai.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.constant.SysConstant;
import com.huamai.entity.Role;
import com.huamai.entity.User;
import com.huamai.service.RoleService;
import com.huamai.service.UserService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.CommonUtils;
import com.huamai.util.DateUtils;
import com.huamai.util.MD5Util;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private HttpSession session;
	
	/**
	 * 用户首页
	 * @return
	 */
	@RequestMapping("/userIndex")
	public ModelAndView userIndex()
	{
		ModelAndView model = new ModelAndView("backstage/user/userIndex");
		
		List<Role> list = roleService.selectAll(null);
		model.addObject("list", list);
		
		return model;
	}
	
	/**
	 * 查看用户资料页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/userEdit")
	public ModelAndView userEdit(Integer id) throws Exception
	{
		ModelAndView model = new ModelAndView("backstage/user/userEdit");
		List<Role> list = roleService.selectAll(null);
		model.addObject("list", list);
		model.addObject("entity", null);
		if(id!=null){
			User user = userService.selectById(id);
			user.setPassword(null);
			model.addObject("entity", user);
		}
		
		return model;
	}
	
	/**
	 * 编辑用户页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/userInfo")
	public ModelAndView userInfo() throws Exception
	{
		ModelAndView model = new ModelAndView("backstage/user/userInfo");
		User user = (User) session.getAttribute(SysConstant.UserSession);
		User temp = userService.selectById(user.getId());
		temp.setRoleName(user.getRoleName());
		model.addObject("entity", temp);
		
		return model;
	}
	
	
	/**
	 * 修改用户密码页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/userPassword")
	public ModelAndView userPassword() throws Exception
	{
		ModelAndView model = new ModelAndView("backstage/user/userPassword");
		
		return model;
	}
	
	/**
	 * 用户修改信息
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateUser")
	public ModelAndView update(@ModelAttribute("entity") User entity) throws Exception
	{
		ModelAndView model = new ModelAndView("backstage/user/info");
		String returnCode = "0";
		String returnMsg = "修改成功，请关闭当前页面！";
		if(entity!=null&&entity.getId()!=null&&CommonUtils.isNotEmpty(entity.getRealName())
				&&CommonUtils.isNotEmpty(entity.getPhone())&&CommonUtils.isNotEmpty(entity.getEmail())&&entity.getSex()!=null){
			User user = new User();
			user.setId(entity.getId());
			user.setRealName(entity.getRealName());
			user.setSex(entity.getSex());
			user.setPhone(entity.getPhone());
			user.setEmail(entity.getEmail());
			userService.update(user);
			returnCode="1";
		}else{
			returnMsg = "修改失败，请与管理员联系！";
		}
		model.addObject("returnCode",returnCode);
		model.addObject("returnMsg",returnMsg);
		return model;
	}
	
	/**
	 * 用户修改信息
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updatePassword")
	public ModelAndView updatePassword(String oldPassword,String newPassword,String repassword) throws Exception
	{
		ModelAndView model = new ModelAndView("backstage/user/info");
		String returnCode = "0";
		String returnMsg = "修改成功，请关闭当前页面！";
		if(CommonUtils.isNotEmpty(oldPassword)&&CommonUtils.isNotEmpty(newPassword)){
			User user = (User) session.getAttribute(SysConstant.UserSession);
			if(newPassword.equals(oldPassword)){
				model.addObject("returnCode",returnCode);
				returnMsg = "修改失败，不能与原密码相同！";
				model.addObject("returnMsg",returnMsg);
				return model;
			}
			if(!newPassword.equals(repassword)){
				model.addObject("returnCode",returnCode);
				returnMsg = "修改失败，两次密码不一致！";
				model.addObject("returnMsg",returnMsg);
				return model;
			}
			if(!user.getPassword().equals(MD5Util.getMD5(oldPassword))){
				model.addObject("returnCode",returnCode);
				returnMsg = "修改失败，原密码错误！";
				model.addObject("returnMsg",returnMsg);
				return model;
			}
			if(!isLetterDigit(newPassword)){
				model.addObject("returnCode",returnCode);
				returnMsg = "修改失败，密必须为6到12个字母和数字的组合！";
				model.addObject("returnMsg",returnMsg);
				return model;
			}
			User temp = new User();
			temp.setId(user.getId());
			temp.setPassword(MD5Util.getMD5(newPassword));
			userService.update(temp);
			returnCode="1";
		}else{
			returnMsg = "修改失败，请与管理员联系！";
		}
		model.addObject("returnCode",returnCode);
		model.addObject("returnMsg",returnMsg);
		return model;
	}
	
	/**
	 * 保存或更新用户信息
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveOrUpdate")
	@ResponseBody
	public BasePageResult saveOrUpdate(@ModelAttribute("entity") User entity) throws Exception
	{
		if (!CommonUtils.isNotEmpty(entity.getUserName()))
        {
            return BasePageResultUtil.failResult(-1, "用户名不可以为空");
        }
       
        if (!CommonUtils.isNotEmpty(entity.getRealName()))
        {
            return BasePageResultUtil.failResult(-1, "真实姓名不可以为空");
        }
        if (!CommonUtils.isNotEmpty(entity.getPhone()))
        {
            return BasePageResultUtil.failResult(-1, "用户手机号不可以为空");
        }
        
        
        if(entity.getId()==null){//新增用户用户信息
        	User user = userService.selectByName(entity.getUserName());
            if (user != null)
            {
                return BasePageResultUtil.failResult(-1, "用户名已存在,请重新输入");
            }
            String sys_password=CommonUtils.readProperties("sys_password");
            entity.setPassword(CommonUtils.md5(sys_password));
            entity.setCreateTime(DateUtils.getNowTime());
            
            User user1 = (User) session.getAttribute("User");
        	entity.setCreateUser(user1.getId().toString());
        	
            userService.save(entity);
        }else{//更新用户信息
        	User user1 = userService.selectById(entity.getId());
        	User user2 = userService.selectByName(entity.getUserName());
        	if(user1==null){
        		return BasePageResultUtil.failResult(-1, "系统错误");
        	}
        	if(user2==null){
        		userService.update(entity);
        	}else if(user1.getId()==user2.getId()){
        		userService.update(entity);
        	}else{
        		return BasePageResultUtil.failResult(-1, "用户名已存在,请重新输入");
        	}
        }
        
        return BasePageResultUtil.success();
	}
	
	/**
     * 遍历除超级管理员之外的所有用户(分页)
     * @return
	 * @throws Exception
     */
    @RequestMapping("/selectAll")
    @ResponseBody
    public BasePageResult selectAll(@RequestParam Map<String, Object> param) throws Exception
    {
        BasePageResult basePage =userService.selectByTerm(param);
        return basePage;
    }
    
    /**
     * 更新删除
     * @param array
     * @return
     */
    @RequestMapping("/drop")
    @ResponseBody
    public BasePageResult drop(@RequestBody String[] array){
    	
    	userService.dropUpdate(array);
    	return BasePageResultUtil.success();
    }
    
    /**
	 * 包含大小写字母及数字且在6-12位
	 * 是否包含
	 *
	 * @param str
	 * @return
	 */
    public static boolean isLetterDigit(String str) {
	    boolean isDigit = false;//定义一个boolean值，用来表示是否包含数字
	    boolean isLetter = false;//定义一个boolean值，用来表示是否包含字母
	    for (int i = 0; i < str.length(); i++) {
	        if (Character.isDigit(str.charAt(i))) {   //用char包装类中的判断数字的方法判断每一个字符
	            isDigit = true;
	        } else if (Character.isLetter(str.charAt(i))) {  //用char包装类中的判断字母的方法判断每一个字符
	            isLetter = true;
	        }
	    }
	    String regex = "^[a-zA-Z0-9]{6,12}$";
	    boolean isRight = isDigit && isLetter && str.matches(regex);
	    return isRight;
	}

    
}
