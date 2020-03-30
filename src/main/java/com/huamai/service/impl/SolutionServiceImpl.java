package com.huamai.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.ProductMapper;
import com.huamai.dao.RelationMapper;
import com.huamai.dao.SolutionMapper;
import com.huamai.entity.Product;
import com.huamai.entity.Relation;
import com.huamai.entity.Solution;
import com.huamai.service.SolutionService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;

@Service
public class SolutionServiceImpl implements SolutionService {
	
	@Autowired
	private SolutionMapper smapper;
	@Autowired
	private ProductMapper promapper;
	@Autowired
	private RelationMapper relationmapper;

	@Override
	public BasePageResult solutionList(Map<String, Object> map) {
		Integer limit = Integer.parseInt((String)map.get("limit"));
		Integer page = Integer.parseInt((String)map.get("page"));
		PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(smapper.selectList(map));
	}

	@Override
	public boolean insert(Solution record) {
		return smapper.insertSelective(record)>0?true:false;
	}

	@Override
	public boolean delete(Integer id) {
		return smapper.deleteByPrimaryKey(id)>0?true:false;
	}

	@Override
	public boolean update(Solution record) {
		return smapper.updateByPrimaryKeyWithBLOBs(record)>0?true:false;
	}
	
	@Override
	public Solution select(Integer id) {
		return smapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Product> ProductList(Map<String, Object> map) {
		return promapper.selectList(map);
	}

	@Override
	public BasePageResult selectBysolution(Map<String,Object> map) {
		Integer limit = Integer.parseInt((String)map.get("limit"));
		Integer page = Integer.parseInt((String)map.get("page"));
		PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(relationmapper.selectBysolution(map));
	}

	@Override
	public boolean relationDrop(Integer id) {
		return relationmapper.drop(id)>0?true:false;
	}

	@Override
	public Integer addrelation(Relation record) {
		if(relationmapper.selectDistinct(record)!=null) {
			return 2;
		}
		return relationmapper.insert(record)>0?0:1;
	}

	@Override
	public List<Solution> selectList(String type) {
		return smapper.selectListByType(type);
	}

	@Override
	public List<Product> selectProduct(Integer id) {
		return relationmapper.selectProduct(id);
	}

}
