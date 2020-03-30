package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Solution;

public interface SolutionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Solution record);

    int insertSelective(Solution record);

    Solution selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Solution record);

    int updateByPrimaryKeyWithBLOBs(Solution record);

    int updateByPrimaryKey(Solution record);
    
    List<Solution> selectList(Map<String,Object> map);
    
    List<Solution> selectListByType(String type);
}