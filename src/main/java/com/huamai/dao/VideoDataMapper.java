package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.VideoData;

public interface VideoDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VideoData record);

    int insertSelective(VideoData record);

    VideoData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VideoData record);

    int updateByPrimaryKey(VideoData record);
    
    List<VideoData> selectAllVideo(Map<String,String> map);

}