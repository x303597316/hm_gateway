package com.huamai.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.PaperMapper;
import com.huamai.entity.Paper;
import com.huamai.service.PaperService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;
@Service
public class PaperServiceImpl implements PaperService{
	@Autowired
	private PaperMapper paperMapper;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return paperMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Paper record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Paper record) {
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		record.setUpdatetime(sdf.format(d));
		return paperMapper.insertSelective(record);
	}

	@Override
	public Paper selectByPrimaryKey(Integer id) {
		return paperMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Paper record) {
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		record.setUpdatetime(sdf.format(d));
		return paperMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Paper record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BasePageResult selectAllPaper(Map<String, String> map) {
		Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(paperMapper.selectAllPaper(map));
	}
	
}
