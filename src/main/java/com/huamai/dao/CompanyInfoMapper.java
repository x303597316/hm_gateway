package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.CompanyInfo;

public interface CompanyInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyInfo record);

    int insertSelective(CompanyInfo record);

    CompanyInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyInfo record);

    int updateByPrimaryKeyWithBLOBs(CompanyInfo record);

    int updateByPrimaryKey(CompanyInfo record);
    
    List<CompanyInfo> pagelist(Map<String,Object> map);
}