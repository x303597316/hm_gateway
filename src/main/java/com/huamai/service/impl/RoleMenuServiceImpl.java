package com.huamai.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huamai.dao.BaseMapper;
import com.huamai.dao.RoleMenuMapper;
import com.huamai.entity.RoleMenu;
import com.huamai.service.RoleMenuService;


@Service
public class RoleMenuServiceImpl extends BaseServiceImpl<RoleMenu> implements RoleMenuService{

	/** 公共方法 开始**/
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	
	@Override
	public RoleMenu getModule() {
		return new RoleMenu();
	}

	@Override
	public BaseMapper<RoleMenu> getBaseMapper() {
		return roleMenuMapper;
	}
	/** 公共方法 结束**/
	@Transactional
	@Override
	public int deleteByRid(Integer rid) {
		return roleMenuMapper.deleteByRid(rid);
	}
	@Transactional
	@Override
	public int insertByBidAndMid(Map<String, Object> map) {
		return roleMenuMapper.insertByBidAndMid(map);
	}

}
