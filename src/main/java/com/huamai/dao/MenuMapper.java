package com.huamai.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.huamai.dto.TreeNodeS;
import com.huamai.entity.Menu;


public interface MenuMapper extends BaseMapper<Menu>{
	
	public Menu selectById(@Param("id")Integer id);
	
	public Menu selectByName(@Param("name")String name);
	
	public List<Menu> selectByTerm(Map<String, Object> map);
	
	public int dropUpdate(String[] array);
	
	public List<TreeNodeS> getMenuTreeByRole(@Param("rid")Integer rid, @Param("flag")boolean flag);
	
	public int  insertSelective(Menu menu);
	
	public int deleteMultiple(@Param("ids") List<Integer> ids);
	
	public List<Integer> getChildList(@Param("id")Integer id);
	
	
}