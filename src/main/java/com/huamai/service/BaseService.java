package com.huamai.service;


import com.huamai.entity.BaseEntity;


/**
 * 基于service层的接口模板
 * 
 * @author zhaolong
 *
 * @param <T>
 */
public interface BaseService<T extends BaseEntity> {

	public boolean save(T t) throws Exception;

	public boolean delete(Integer id) throws Exception;

	public boolean update(T t) throws Exception;

}
