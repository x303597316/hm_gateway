package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Product;
import com.huamai.entity.Relation;

public interface RelationMapper {
    int insert(Relation record);
    
    List<Map<String,Object>> selectBysolution(Map<String, Object> map);

	int drop(Integer id);
	
	List<Product> selectProduct(Integer id);
	
	Relation selectDistinct(Relation record);
}