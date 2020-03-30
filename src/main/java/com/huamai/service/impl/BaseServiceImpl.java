package com.huamai.service.impl;


import org.springframework.transaction.annotation.Transactional;

import com.huamai.dao.BaseMapper;
import com.huamai.entity.BaseEntity;



/**
 * 基于service层的crud模版，使用时必须实现getModule()和getBaseMapper()两个方法
 * @author zhaolong 
 * @param <T>
 */
public abstract class BaseServiceImpl<T extends BaseEntity> {
	
//	private static final int USE_DEFAULT_PAGE_SIZE = -1;
	
//	@Transactional(readOnly = false)
//	public boolean save(T t) throws Exception{
//		return this.getBaseMapper().insert(t)>0;
//	}
	
	@Transactional(readOnly = false)
	public boolean save(T t) throws Exception{
		return this.getBaseMapper().insertNoPrimaryKey(t)>0;
	}
	
	@Transactional(readOnly = false)
	public boolean delete(Integer id) throws Exception{
		T t = this.getModule();
		t.setId(id);
		return this.getBaseMapper().delete(t)>0;
	}

	@Transactional(readOnly = false)
	public boolean update(T t) throws Exception{
		return this.getBaseMapper().update(t)>0;
	}
	
	/*@Transactional(readOnly = true)
	public T selectById(Integer id) throws Exception{
		T t = this.getModule();
		t.setId(id);
		List<T> list = this.getBaseMapper().selectById(t);
		if(list.isEmpty()){
			return null;
		}else{
			return list.get(0);
		}
	}
	
	@Transactional(readOnly = true)
	public List<T> findAll() throws Exception{
		T t = this.getModule();
		return getBaseMapper().findAll(t);
	}*/
	
	/**
	 * 想要使用父类的增、删、改、查基础方法，必须实现此方法，返回当前的空实体对象
	 * @return
	 */
	public abstract T getModule();
	
	/**
	 * 想要使用父类的增、删、改、查基础方法，必须实现此方法，返回当前的BaseMapper接口的实现类
	 * @return
	 */
	public abstract BaseMapper<T> getBaseMapper();
	
	
//	@Transactional(readOnly = true)
//	public T getById(Long id) {
//		T t = this.getModule();
//		return this.getBaseMapper().get(t);
//	}
	
//	@Transactional(readOnly = true)
//	public List<T> findBy(List<SearchFilter> searchFilterList, int pageNumber, int limit) {
//		return getBaseMapper().findBy(getEntity(), searchFilterList, pageNumber, limit);
//	}
//	
//	@Transactional(readOnly = true)
//	public List<T> findBy(List<SearchFilter> searchFilterList) {
//		return getBaseMapper().findBy(getEntity(), searchFilterList, 0, 0);
//	}
//	
//	
//	public Page<T> findPage(List<SearchFilter> searchFilterList, int pageNumber, int limit) {
//		int totalCount = this.getBaseMapper().count(getEntity(), searchFilterList);
//		Page<T> page = new Page<T>();
//		if (USE_DEFAULT_PAGE_SIZE == limit) {
//			limit = page.getPageSize();
//		}
//		List<T> result = findBy(searchFilterList, pageNumber, limit);
//		page.setPageNo(pageNumber);
//		page.setTotalCount(totalCount);
//		page.setResult(result);
//		return page;
//	}
//
//	public Page<T> findPage(List<SearchFilter> searchFilterList, int pageNumber){ 
//		return findPage(searchFilterList, pageNumber, USE_DEFAULT_PAGE_SIZE);
//	}
	
}