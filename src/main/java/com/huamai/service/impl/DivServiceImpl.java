package com.huamai.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.DivDao;
import com.huamai.entity.Div;
import com.huamai.service.DivService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;

/**
* @author cheng
* @version 创建时间：2018年12月27日 下午4:39:37
* 类说明
*/
@Service
public class DivServiceImpl implements DivService {

	@Autowired
	private DivDao divDao;
	
	@Override
	public int insertDiv(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return divDao.insertDiv(map);
	}

	@Override
	public boolean insertOrUpdate(Map<String, Object> map) {
		
		if(map.get("div_id")==null || map.get("div_id")=="") {
			return divDao.insertDiv(map)>0?true:false;
		}else {
			return divDao.updateDiv(map)>0?true:false;
		}
		
	}

	@Override
	public BasePageResult getDivList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Integer limit = Integer.parseInt((String) map.get("limit"));
		Integer page = Integer.parseInt((String) map.get("page"));
		PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(divDao.getDivList(map));
	}

	@Override
	public Div selectById(Integer div_id) {
		// TODO Auto-generated method stub
		return divDao.selectById(div_id);
	}

	@Override
	public boolean deleteDiv(Integer div_id) {
		// TODO Auto-generated method stub
		return divDao.deleteDiv(div_id)>0?true:false;
	}

	@Override
	public List<Div> getDivByStatus(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return divDao.getDivByStatus(map);
	}

}
