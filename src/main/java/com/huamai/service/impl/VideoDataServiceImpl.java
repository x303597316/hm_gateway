package com.huamai.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.VideoDataMapper;
import com.huamai.entity.VideoData;
import com.huamai.service.VideoDataService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;
@Service
public class VideoDataServiceImpl implements VideoDataService{
	@Autowired
	private VideoDataMapper videoDataMapper;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return videoDataMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(VideoData record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(VideoData record) {
		return videoDataMapper.insertSelective(record);
	}

	@Override
	public VideoData selectByPrimaryKey(Integer id) {
		return videoDataMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(VideoData record) {
		return videoDataMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(VideoData record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BasePageResult selectAllVideo(Map<String, String> map) {
		Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(videoDataMapper.selectAllVideo(map));
		/*Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(newmapper.selectByMap(map));*/
	}
	
}
