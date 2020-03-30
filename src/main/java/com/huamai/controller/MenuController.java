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

import com.huamai.dto.TreeNodeS;
import com.huamai.entity.Menu;
import com.huamai.entity.User;
import com.huamai.service.MenuService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.CommonUtils;
import com.huamai.util.DateUtils;

import net.sf.json.JSONArray;



@Controller
@RequestMapping("/menu")
public class MenuController {
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/menuIndex")
	public ModelAndView menuIndex()
	{
		ModelAndView model = new ModelAndView("backstage/menu/menuIndex");
		
		return model;
	}
	
	@RequestMapping("/firstPageEdit")
	public ModelAndView firstPageEdit()
	{
		ModelAndView model = new ModelAndView("backstage/config/firstPageEdit");
		
		return model;
	}
	 
	@RequestMapping("/homePage")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("backstage/div/homePage");
		return mv;
	}
	/**
	 * 编辑菜单页面
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/menuEdit")
	public ModelAndView editMenu(Integer id,@RequestParam(required=false)Integer pid) throws Exception
	{
		ModelAndView model = new ModelAndView("backstage/menu/menuEdit");
		model.addObject("entity", null);
		if(pid!=null&&id==null){
			Menu menu1 = menuService.selectById(pid);
			Menu menu2 = new Menu();
			menu2.setParentId(menu1.getId());
			model.addObject("entity", menu2);
			model.addObject("pname", menu1.getMenuName());
		}
		if(id!=null){
			Menu menu = menuService.selectById(id);
			if(menu.getParentId()!=null&&menu.getParentId()!=0){
				Menu menu1 = menuService.selectById(menu.getParentId());
				model.addObject("pname", menu1.getMenuName());
			}
			model.addObject("entity", menu);
		}
		return model;
	}
	
	/**
	 * 保存或更新菜单信息
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveOrUpdate")
	@ResponseBody
	public BasePageResult addMenu(@ModelAttribute("entity") Menu entity,HttpSession session) throws Exception
	{
		if (!CommonUtils.isNotEmpty(entity.getMenuName()))
        {
            return BasePageResultUtil.failResult(-1, "菜单名称不可以为空");
        }
        
        
        if(entity.getId()==null){//新增菜单信息
        	
        	User user = (User) session.getAttribute("User");
        	entity.setCreateUser(user.getId().toString());
            entity.setCreateTime(DateUtils.getNowTime());
            menuService.insertSelective(entity);
            
        }else{//更新菜单信息
        	Menu menu1 = menuService.selectById(entity.getId());
        	if(menu1==null){
        		return BasePageResultUtil.failResult(-1, "系统错误");
        	}
        	menuService.update(entity);
        }
        return BasePageResultUtil.success();
	}
	
	/**
     * 遍历所有菜单(分页)
     * @return
	 * @throws Exception
     */
    @RequestMapping("/selectAll")
    @ResponseBody
    public BasePageResult selectAll(@RequestParam Map<String, Object> param) throws Exception
    {
        BasePageResult basePage =menuService.selectByTerm(param);
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
    	
    	menuService.deleteMultiple(array);
    	return BasePageResultUtil.success();
    }
    
    /**
     * 获取所有菜单树
     * @return
     */
    @RequestMapping(value="/getMenuTree",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getMenuTree(@RequestParam(required=false) Integer rid){
    	
    	List<TreeNodeS> list = menuService.getMenuTreeByRole(rid,true);
    	
    	TreeNodeS node = new TreeNodeS();
		node.setId("0");
		node.setOpen(true);
		node.setName("角色权限");
		boolean isChecked = false;
		for(TreeNodeS tnode :list){
			if(tnode.getChecked()){
				isChecked=true;
				break;
			}
		}
		node.setChecked(isChecked);
		list.add(node);
    	
    	JSONArray arry= JSONArray.fromObject(list);
    	
		return arry.toString();
    }
}
