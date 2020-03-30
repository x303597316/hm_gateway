package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Message;

public interface MessageDao {
	public List<Message> findAllMes(Map<String,Object> map);
	
	public Message findById(Integer id);
	
	int insertSelective(Message record);
	
	
}
