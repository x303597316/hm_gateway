package com.huamai.service;


import com.huamai.entity.DowUser;
import com.huamai.util.BasePageResult;


import java.util.List;
import java.util.Map;

public interface DownUserService {


    BasePageResult selectAllPaper(Map<String, Object> map);

    int deleteByPrimaryKey(Map<String,Object> map);

    int insertSelective(Map<String, Object> map);

    int updateByPrimaryKeySelective(Map<String, Object> map);

    Map<String, Object> selectByPrimaryKey(Map<String, Object> map);

    List<Map<String,Object>> selectAllist(Map<String, Object> map);
    //根据用户名查询用户
    DowUser selectByName(String userName);
}
