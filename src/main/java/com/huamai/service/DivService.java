package com.huamai.service;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Div;
import com.huamai.util.BasePageResult;

/**
 * @author cheng
 * @version 创建时间：2018年12月27日 下午4:39:12 类说明
 */

public interface DivService {

	int insertDiv(Map<String, Object> map);

	boolean insertOrUpdate(Map<String, Object> map);

	BasePageResult getDivList(Map<String, Object> map);
	
	Div selectById(Integer div_id);
	
	 boolean deleteDiv(Integer div_id);
	 
	 List<Div> getDivByStatus(Map<String,Object> map);
}
