package com.huamai.dao;



import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.huamai.entity.RoleMenu;


public interface RoleMenuMapper extends BaseMapper<RoleMenu>{
	
	public int deleteByRid(@Param("rid")Integer rid);
	
	public int insertByBidAndMid(Map<String,Object> map);
	
	public int deleteMultipleByRid(@Param("ids") String[] ids);
	
	public int deleteMultipleByMid(@Param("ids") String[] ids);
	
}