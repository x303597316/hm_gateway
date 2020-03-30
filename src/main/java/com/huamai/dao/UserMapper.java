package com.huamai.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.huamai.entity.User;


public interface UserMapper extends BaseMapper<User>{
	
	public User selectById(@Param("id")Integer id);
	
	public User selectByName(@Param("userName")String userName);
	
	public List<User> selectByTerm(Map<String, Object> map);
	
	public int dropUpdate(String[] array);
	
}