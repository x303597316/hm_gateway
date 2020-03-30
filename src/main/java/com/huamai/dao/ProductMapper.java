package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Product;

public interface ProductMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    //选择性插入字段
    int insertSelective(Product record);

    //根据主键查询
    Product selectByPrimaryKey(Integer id);

    //根据主键选择性更新字段
    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
    
    //条件查询
    List<Product> selectList(Map<String,Object> map);
    
    //查询是否有子节点
    Integer selectByParent(Integer pid);
    
    int updateStatus(List<String> ids, String status);
    
    List<Product> selectChild(Integer id);
    
    
    List<Product> selectlist();
    
}