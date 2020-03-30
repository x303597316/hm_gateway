package com.huamai.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huamai.dao.ProductMapper;
import com.huamai.entity.Product;
import com.huamai.service.ProductService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productmapper;
	
	@Override
	public Product selectByPrimerykey(Integer id) {
		return productmapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Product> productList(Map<String, Object> map) {
		return productmapper.selectList(map);
	}

	@Override
	public boolean insertProduct(Product record) {
		return productmapper.insertSelective(record)>0?true:false;
	}

	@Override
	public boolean updateProduct(Product record) {
		return productmapper.updateByPrimaryKeySelective(record)>0?true:false;
	}

	@Override
	public BasePageResult dropProduct(Integer id) {
		if(productmapper.selectByParent(id)>0)
			return BasePageResultUtil.failResult(-1, "拥有子节点，不可删除！");
		if(productmapper.deleteByPrimaryKey(id)>0)
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "删除失败！");
	}

	@Override
	public List<Product> selectChild(Integer id) {
		return productmapper.selectChild(id);
	}
	
	@Override
	public List<Product> getTreeList() {
		List<Product> parentlist= productmapper.selectChild(0);
		for(Product chlidNode:parentlist) {
			chlidNode.setNodelist(productmapper.selectChild(chlidNode.getId()));
		}
		return parentlist;
	}

	@Override
	public List<Product> selectlist() {
		return productmapper.selectlist();
	}

	/*@Override
	public boolean updateStatus(List<String> ids, String status) {
		return productmapper.updateStatus(ids, status)==ids.size()?true:false;
	}*/

}
