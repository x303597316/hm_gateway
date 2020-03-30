package com.huamai.controller;

import java.util.HashMap;
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

import com.huamai.entity.Role;
import com.huamai.entity.User;
import com.huamai.service.RoleMenuService;
import com.huamai.service.RoleService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.CommonUtils;
import com.huamai.util.DateUtils;



@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private RoleMenuService roleMenuService;
	
	@RequestMapping("/roleIndex")
	public ModelAndView roleIndex()
	{
		ModelAndView model = new ModelAndView("backstage/role/roleIndex");
		
		return model;
	}
	 
	/**
	 * 编辑用户页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/roleEdit")
	public ModelAndView roleEdit(Integer id) throws Exception
	{
		ModelAndView model = new ModelAndView("backstage/role/roleEdit");
		model.addObject("entity", null);
		if(id!=null){
			Role role = roleService.selectById(id);
			
			model.addObject("entity", role);
		}
		
		return model;
	}
	
	/**
	 * 保存或更新角色信息
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveOrUpdate")
	@ResponseBody
	public BasePageResult saveOrUpdate(@ModelAttribute("entity") Role entity,HttpSession session) throws Exception
	{
		if (!CommonUtils.isNotEmpty(entity.getRoleName()))
        {
            return BasePageResultUtil.failResult(-1, "角色名称不可以为空");
        }
        
        
        if(entity.getId()==null){//新增角色
        	Role role = roleService.selectByName(entity.getRoleName());
            if (role != null)
            {
                return BasePageResultUtil.failResult(-1, "角色名称已存在,请重新输入");
            }
            
            User user = (User) session.getAttribute("User");
        	entity.setCreateUser(user.getId().toString());
            entity.setCreateTime(DateUtils.getNowTime());
            int rid = roleService.insertSelective(entity);

            roleMenuService.deleteByRid(rid);
            
            if(CommonUtils.isNotEmpty(entity.getMid())){
            	Map<String,Object> map = new HashMap<String,Object>();
                map.put("rid",entity.getId());
            	String[] mid = entity.getMid().split(",");
            	map.put("mid",mid);
            	roleMenuService.insertByBidAndMid(map);
            }
        }else{//更新用户信息
        	Role role = roleService.selectByName(entity.getRoleName());
        	if(role==null){
        		roleService.update(entity);
        		
        		roleMenuService.deleteByRid(entity.getId());
                
                if(CommonUtils.isNotEmpty(entity.getMid())){
                	Map<String,Object> map = new HashMap<String,Object>();
                    map.put("rid",entity.getId());
                	String[] mid = entity.getMid().split(",");
                	map.put("mid",mid);
                	roleMenuService.insertByBidAndMid(map);
                }
                
        	}else if(role.getId()==entity.getId()){
        		roleService.update(entity);
        		
        		roleMenuService.deleteByRid(entity.getId());
        		
        		if(CommonUtils.isNotEmpty(entity.getMid())){
                	Map<String,Object> map = new HashMap<String,Object>();
                    map.put("rid",entity.getId());
                	String[] mid = entity.getMid().split(",");
                	map.put("mid",mid);
                	roleMenuService.insertByBidAndMid(map);
                }
        	}else{
        		return BasePageResultUtil.failResult(-1, "角色名称已存在,请重新输入");
        	}
        }
        return BasePageResultUtil.success();
	}
	
	/**
     * 遍历除超级管理员角色之外的所有角色(分页)
     * @return
	 * @throws Exception
     */
    @RequestMapping("/selectAll")
    @ResponseBody
    public BasePageResult selectAll(@RequestParam Map<String, Object> param) throws Exception
    {
        BasePageResult basePage =roleService.selectByTerm(param);
        return basePage;
    }
    
    /**
     * 删除
     * @param array
     * @return
     */
    @RequestMapping("/drop")
    @ResponseBody
    public BasePageResult drop(@RequestBody String[] array){
    	
    	roleService.deleteMultiple(array);
    	return BasePageResultUtil.success();
    }
}
