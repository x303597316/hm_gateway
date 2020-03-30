package com.huamai.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.huamai.entity.Role;


public interface RoleMapper extends BaseMapper<Role>{
	
	public Role selectById(@Param("id")Integer id);
	
	public List<Role> selectByTerm(Map<String, Object> map);
	
	public Role selectByName(@Param("roleName")String roleName);
	
	public int dropUpdate(String[] array);
	
	public int insertSelective(Role role);
	
	public int deleteMultiple(@Param("ids") String[] ids);
	
}