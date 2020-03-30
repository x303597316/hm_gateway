package com.huamai.service;

import java.util.Map;

import com.huamai.entity.Message;
import com.huamai.util.BasePageResult;

public interface MessageService {
	public BasePageResult findAllMes(Map<String,Object> map);
	
	public Message findById(Integer id);
	
	public int insertSelective(Message record);
	
	public boolean insert(Message record);
}
