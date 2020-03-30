package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Recruit;

public interface RecruitMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Recruit record);

    int insertSelective(Recruit record);

    Recruit selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Recruit record);

    int updateByPrimaryKey(Recruit record);
    //查询招聘信息
    List<Recruit> recruitList(Map<String,Object> map);
}