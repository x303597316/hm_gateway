package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.User;

public interface UserDao {

	public User Login(String username);
	
	public List<User> userList(Map<String,Object> map);
	
	public int addUser(User user);
	
	public int updateUser(User user);
	
	public int deleteUser(String id);
	
	public User selectUser(String id);
}
