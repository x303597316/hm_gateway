package com.huamai.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.CompanyInfoMapper;
import com.huamai.entity.CompanyInfo;
import com.huamai.service.InfoService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;

@Service
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private CompanyInfoMapper mapper;

	@Override
	public BasePageResult infolist(Map<String, Object> map) {
		Integer limit = Integer.parseInt((String)map.get("limit"));
		Integer page = Integer.parseInt((String)map.get("page"));
		PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(mapper.pagelist(map));
	}

	@Override
	public boolean updateByprimerykey(CompanyInfo entity) {
		return mapper.updateByPrimaryKeySelective(entity)>0?true:false;
	}

	@Override
	public boolean deleteByprimerykey(Integer id) {
		return mapper.deleteByPrimaryKey(id)>0?true:false;
	}

	@Override
	public CompanyInfo select(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean insert(CompanyInfo entity) {
		return mapper.insertSelective(entity)>0?true:false;
	}

}
