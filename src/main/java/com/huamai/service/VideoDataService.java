package com.huamai.service;

import java.util.Map;

import com.huamai.entity.VideoData;
import com.huamai.util.BasePageResult;

public interface VideoDataService {
	
	public int deleteByPrimaryKey(Integer id);

    public int insert(VideoData record);

    public int insertSelective(VideoData record);

    public VideoData selectByPrimaryKey(Integer id);

    public int updateByPrimaryKeySelective(VideoData record);

    public int updateByPrimaryKey(VideoData record);
    
    public BasePageResult selectAllVideo(Map<String,String> map);
}
