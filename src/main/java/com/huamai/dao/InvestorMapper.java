package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Investor;

public interface InvestorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Investor record);

    int insertSelective(Investor record);

    Investor selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Investor record);

    int updateByPrimaryKey(Investor record);
    
    List<Investor> InvestorList(Map<String,Object> map);
      
    int getInvestorCount(Map<String,Object> map);
    
    List<Investor> 	getInvestorList(Map<String,Object> map);
    
    Investor getInvestorById(String id);
    
}