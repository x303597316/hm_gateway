package com.huamai.service;

import java.util.Map;

import com.huamai.entity.User;
import com.huamai.util.BasePageResult;

public interface UserService extends BaseService<User>{
	
	public User selectById(Integer id);

	public User selectByName(String userName);
	
	public BasePageResult selectByTerm(Map<String, Object> map);
	
	public int dropUpdate(String[] array);

}
