package com.huamai.dao;

import com.huamai.entity.DowUser;

import java.util.List;
import java.util.Map;

public interface DownUserDao {


    List<Map<String,Object>> selectAllPaper(Map<String, Object> map);

    int deleteByPrimaryKey(Map<String,Object> map);

    int insertSelective(Map<String, Object> map);

    int updateByPrimaryKeySelective(Map<String, Object> map);

    Map<String, Object> selectByPrimaryKey(Map<String, Object> map);

    DowUser selectByName(String userName);
}
