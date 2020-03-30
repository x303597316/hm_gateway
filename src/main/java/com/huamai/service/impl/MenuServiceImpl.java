package com.huamai.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.BaseMapper;
import com.huamai.dao.MenuMapper;
import com.huamai.dao.RoleMenuMapper;
import com.huamai.dto.TreeNodeS;
import com.huamai.entity.Menu;
import com.huamai.service.MenuService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;


@Service
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements MenuService{

	/** 公共方法 开始**/
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	
	@Override
	public Menu getModule() {
		return new Menu();
	}

	@Override
	public BaseMapper<Menu> getBaseMapper() {
		return menuMapper;
	}
	/** 公共方法 结束**/

	@Override
	public Menu selectById(Integer id) {
		return menuMapper.selectById(id);
	}

	@Override
	public Menu selectByName(String name) {
		return menuMapper.selectByName(name);
	}

	@Override
	public BasePageResult selectByTerm(Map<String, Object> map) {
		Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
        return PageUtil.parseBasePageResult(menuMapper.selectByTerm(map));
	}

	
	@Override
	public int dropUpdate(String[] array) {
		return menuMapper.dropUpdate(array);
	}

	@Override
	public List<TreeNodeS> getMenuTreeByRole(Integer rid,boolean flag) {
		return menuMapper.getMenuTreeByRole(rid,flag);
	}

	/**
	 * 返回自增主键
	 */
	@Transactional
	@Override
	public int insertSelective(Menu menu) {
		menuMapper.insertSelective(menu);
		
		//将添加的菜单权限赋值给管理员
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("rid",1);
    	String[] mid = {String.valueOf(menu.getId())};
    	map.put("mid",mid);
    	
		roleMenuMapper.insertByBidAndMid(map);
		return menu.getId();
	}
	
	@Transactional
	@Override
	public int deleteMultiple(String[] ids) {
		//查询要删除的所有菜单ID
		List<Integer> list = new ArrayList<Integer>();
		for(int i=0;i<ids.length;i++){
			List<Integer> temp = menuMapper.getChildList(Integer.parseInt(ids[i]));
			if(temp!=null){
				list.addAll(temp);
			}
		}
		//去除重复
		list= new ArrayList<Integer>(new HashSet<Integer>(list));
		return menuMapper.deleteMultiple(list);
	}

}
