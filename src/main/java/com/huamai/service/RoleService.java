package com.huamai.service;

import java.util.List;
import java.util.Map;


import com.huamai.entity.Role;
import com.huamai.util.BasePageResult;

public interface RoleService extends BaseService<Role>{

	public Role selectById(Integer id);
	
	public Role selectByName(String roleName);
	
	public List<Role> selectAll(Map<String, Object> map);
	
	public BasePageResult selectByTerm(Map<String, Object> map);
	
	public int dropUpdate(String[] array);
	
	public int insertSelective(Role role);
	
	public int deleteMultiple(String[] ids);
	
}
