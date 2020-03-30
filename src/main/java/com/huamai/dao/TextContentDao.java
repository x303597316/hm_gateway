package com.huamai.dao;

import java.util.List;

import com.huamai.entity.TextContent;
import com.huamai.entity.TreeNode;

public interface TextContentDao {

	public List<TreeNode> menuList();
	
	public int insertSelective(TextContent entity);
	
	public TextContent selectByPrimerykey(String id);
	
	public int updateSelective(TextContent entity);
	
	public int countChild(String parentid);
}
