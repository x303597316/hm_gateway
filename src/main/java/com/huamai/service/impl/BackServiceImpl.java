package com.huamai.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.TextContentDao;
import com.huamai.dao.UserDao;
import com.huamai.entity.TextContent;
import com.huamai.entity.TreeNode;
import com.huamai.entity.User;
import com.huamai.util.PageUtil;
import com.huamai.service.BackService;
import com.huamai.util.BasePageResult;

@Service
public class BackServiceImpl implements BackService{

	@Autowired
	private UserDao usermapper;
	
	@Autowired
	private TextContentDao textmapper;
	
	@Override
	public User Login(String username) {
		return usermapper.Login(username);
	}

	@Override
	public List<TreeNode> menuList() {
		return textmapper.menuList();
	}

	@Override
	public BasePageResult userList(Map<String, Object> map) {
		Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(usermapper.userList(map));
	}

	@Override
	public boolean addUser(User user) {
		return usermapper.addUser(user)>0?true:false;
	}

	@Override
	public boolean updateUser(User user) {
		return usermapper.updateUser(user)>0?true:false;
	}

	@Override
	public boolean deleteUser(String id) {
		return usermapper.deleteUser(id)>0?true:false;
	}

	@Override
	public User selectUser(String id) {
		return usermapper.selectUser(id);
	}

	@Override
	public boolean ContentInsertSelective(TextContent entity) {
		return textmapper.insertSelective(entity)>0?true:false;
	}

	@Override
	public TextContent selectContentByprimerykey(String id) {
		return textmapper.selectByPrimerykey(id);
	}

	
	

}
