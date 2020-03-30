package com.huamai.service;

import java.util.Map;

import com.huamai.entity.RoleMenu;

public interface RoleMenuService extends BaseService<RoleMenu>{

	public int deleteByRid(Integer rid);
	
	public int insertByBidAndMid(Map<String,Object> map);
	
}
