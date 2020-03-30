package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Div;

/**
* @author cheng
* @version 创建时间：2018年12月27日 下午4:37:15
* 类说明
*/

public interface DivDao {

	int insertDiv(Map<String,Object> map);
	
	int updateDiv(Map<String,Object> map);
	
	List<Div> getDivList(Map<String,Object> map);
	
	Div selectById(Integer div_id);
	
	int deleteDiv(Integer div_id);
	
	List<Div> getDivByStatus(Map<String,Object> map);
}
