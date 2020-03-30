package com.huamai.dao;

import java.util.List;
import java.util.Map;

public interface PaperDownDao {

    Map<String, Object> selectByPrimaryKey(Map<String, Object> map);

    List<Map<String, Object>> selectAllPaper(Map<String, String> map);

    int deleteByPrimaryKey(Map<String, String> map);

    int insertSelective(Map<String, String> map);

    int updateByPrimaryKeySelective(Map<String, String> map);
}
