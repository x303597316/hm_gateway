package com.huamai.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.InvestorMapper;
import com.huamai.entity.Investor;
import com.huamai.service.InvestorService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;

@Service
public class InvestorServiceImpl implements InvestorService {

	@Autowired
	InvestorMapper Investormapper;
	
	
	@Override
	public Investor selectByPrimarykey(Integer id) {
		return Investormapper.selectByPrimaryKey(id);
	}

	@Override
	public BasePageResult InvestorList(Map<String, Object> map) {
		Integer limit = Integer.parseInt((String)map.get("limit"));
		Integer page = Integer.parseInt((String)map.get("page"));
		PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(Investormapper.InvestorList(map));
	}

	@Override
	public boolean updateByprimarykey(Investor record) {
		return Investormapper.updateByPrimaryKeySelective(record)>0?true:false;
	}

	@Override
	public boolean insertSelective(Investor entity) {
		return Investormapper.insertSelective(entity)>0?true:false;
	}

	@Override
	public boolean drop(Integer id) {
		return Investormapper.deleteByPrimaryKey(id)>0?true:false;
	}

	@Override
	public List<Investor> getInvestorList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return Investormapper.getInvestorList(map);
	}

	@Override
	public int getInvestorCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return Investormapper.getInvestorCount(map);
	}

	@Override
	public Investor getInvestorById(String id) {
		// TODO Auto-generated method stub
		return Investormapper.getInvestorById(id);
	}

}
