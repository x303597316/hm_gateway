package com.huamai.service;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Product;
import com.huamai.entity.Relation;
import com.huamai.entity.Solution;
import com.huamai.util.BasePageResult;

public interface SolutionService {

	public BasePageResult solutionList(Map<String,Object> map);
	
	public boolean insert(Solution record);
	
	public boolean delete(Integer id);
	
	public boolean update(Solution record);

	public Solution select(Integer id);
	
	public List<Solution> selectList(String type);
	
	public List<Product> ProductList(Map<String,Object> map); 
	
	/**
	 * 关联产品列表
	 */
	public BasePageResult selectBysolution(Map<String,Object> map);
	
	//删除关联
	public boolean relationDrop(Integer id);
	
	Integer addrelation(Relation record);
	
	List<Product> selectProduct(Integer id);
	
}
