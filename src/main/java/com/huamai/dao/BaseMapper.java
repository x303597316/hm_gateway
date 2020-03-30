package com.huamai.dao;


import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.UpdateProvider;

import com.huamai.entity.BaseEntity;
import com.huamai.util.CRUDTemplate;


/**
 * MyBatis基于Dao层的CRUD基接口
 * @author zhaolong
 * @param <T> 处理的POJO对象
 */
public interface BaseMapper<T extends BaseEntity> {

	/**
	 * Insert语句从CRUDTemplate类中生成
	 * @param obj
	 */
	//@InsertProvider(type = CRUDTemplate.class, method = "insert")
	//public int insert(T t) throws Exception;
	
	/**
	 * Insert语句从CRUDTemplate类中生成（无主键生成策略）
	 * @param obj
	 */
	@InsertProvider(type = CRUDTemplate.class, method = "insertNoPrimaryKey")
	public int insertNoPrimaryKey(T t) throws Exception;
	
	/**
	 * Delete语句从CRUDTemplate类中生成
	 * @param obj
	 */
	@DeleteProvider(type = CRUDTemplate.class, method = "delete")
	public int delete(T t) throws Exception;
	
	/**
	 * Update语句从CRUDTemplate类中生成
	 * @param obj
	 */
	@UpdateProvider(type = CRUDTemplate.class, method = "update")
	public int update(T t) throws Exception;
	
	/**
	 * 根据Id查询一条数据
	 * @param obj
	 */
//	public abstract List<T> selectById(T t) throws Exception;
	
	/**
	 * 查询所有,其子类从CRUDTemplate类中生成
	 * @return List<T>
	 */
//	public abstract List<T> findAll(T t) throws Exception;
	
//	public abstract T get(T obj);
//
//	public abstract List<T> findBy(T obj, List<SearchFilter> searchFilterList, int pageNumber, int limit);
//	
//	@SelectProvider(type = CRUDTemplate.class,method = "count")
//	public int count(Object obj, List<SearchFilter> searchFilterList);
}
