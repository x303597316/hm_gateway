package com.huamai.service;

import java.util.List;
import java.util.Map;

import com.huamai.dto.TreeNodeS;
import com.huamai.entity.Menu;
import com.huamai.util.BasePageResult;

public interface MenuService extends BaseService<Menu>{
	public Menu selectById(Integer id);
	
	public Menu selectByName(String name);
	
	public BasePageResult selectByTerm(Map<String, Object> map);
	
	public int dropUpdate(String[] array);
	
	public List<TreeNodeS> getMenuTreeByRole(Integer rid,boolean flag);
	
	public int  insertSelective(Menu menu);
	
	public int deleteMultiple(String[] ids);
}
