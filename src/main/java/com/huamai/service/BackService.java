package com.huamai.service;

import java.util.List;
import java.util.Map;

import com.huamai.entity.TextContent;
import com.huamai.entity.TreeNode;
import com.huamai.entity.User;
import com.huamai.util.BasePageResult;

public interface BackService {

	public User Login(String username);
	
	
	public List<TreeNode> menuList();
	
	public boolean ContentInsertSelective(TextContent entity);
	
	public TextContent selectContentByprimerykey(String id);
	
	
	/*
	 * user表操作开始
	 */
	public BasePageResult userList(Map<String,Object> map);
	
	public boolean addUser(User user);
	
	public boolean updateUser(User user);
	
	public boolean deleteUser(String id);
	
	public User selectUser(String id);
	/*
	 * user表操作结束
	 */
	
}
