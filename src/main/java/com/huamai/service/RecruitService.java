package com.huamai.service;

import java.util.Map;

import com.huamai.entity.Recruit;
import com.huamai.util.BasePageResult;

public interface RecruitService {
	/**
	 * 查询招聘列表
	 * @param map
	 * @return
	 */
	public BasePageResult recruitList(Map<String,Object> map);
	/**
	 * 根据ID查询信息
	 * @param id
	 * @return
	 */
	public Recruit recruit(Integer id);
	/**
	 * 删除招聘信息
	 * @param id
	 * @return
	 */
	public int deleteRecruit(Integer id);
	/**
	 * 修改招聘信息
	 * @param recruit
	 * @return
	 */
	public int updateRecruit(Recruit recruit);
	/**
	 * 添加招聘信息
	 * @param recruit
	 * @return
	 */
	public int insertRecruit(Recruit recruit);
	
}
