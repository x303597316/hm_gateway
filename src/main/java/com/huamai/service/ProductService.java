package com.huamai.service;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Product;
import com.huamai.util.BasePageResult;

public interface ProductService {

	Product selectByPrimerykey(Integer id);
	
	List<Product> productList(Map<String,Object> map);
	
	boolean insertProduct(Product record);
	
	boolean updateProduct(Product record);
	
	BasePageResult dropProduct(Integer id);
	
	/*boolean updateStatus(List<String> ids,String status);*/
	
	List<Product> selectChild(Integer id);
	
	public List<Product> getTreeList();
	
	List<Product> selectlist();
}
