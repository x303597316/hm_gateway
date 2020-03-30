package com.huamai.service;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Investor;
import com.huamai.util.BasePageResult;

public interface InvestorService {

	Investor selectByPrimarykey(Integer id);
	
	BasePageResult InvestorList(Map<String,Object> map);
	
	boolean updateByprimarykey(Investor record);
	
	boolean insertSelective(Investor entity);
	
	boolean drop(Integer id);
	
	int getInvestorCount(Map<String,Object> map);
	
    List<Investor> 	getInvestorList(Map<String,Object> map);
    
    Investor getInvestorById(String id);
}
