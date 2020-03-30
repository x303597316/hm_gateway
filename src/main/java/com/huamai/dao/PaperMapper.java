package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Paper;

public interface PaperMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Paper record);

    int insertSelective(Paper record);

    Paper selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Paper record);

    int updateByPrimaryKey(Paper record);
    
    List<Paper> selectAllPaper(Map<String,String> map);
}