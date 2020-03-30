package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.News;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
    
    List<News> selectByMap(Map<String,String> map);

	List<News> selectByType(String type);

	List<News> selectNewsType(Map<String, Object> map);
}