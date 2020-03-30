package com.huamai.service;

import com.huamai.util.BasePageResult;

import java.util.Map;

public interface PaperDownService {

    Map<String, Object> selectByPrimaryKey(Map<String, Object> map);

    BasePageResult selectAllPaper(Map<String, String> map);

    int deleteByPrimaryKey(Map<String, String> map);

    int insertSelective(Map<String, String> map);

    int updateByPrimaryKeySelective(Map<String, String> map);
}
