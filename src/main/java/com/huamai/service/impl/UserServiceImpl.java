package com.huamai.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.BaseMapper;
import com.huamai.dao.UserMapper;
import com.huamai.entity.User;
import com.huamai.service.UserService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;


@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	/** 公共方法 开始**/
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User getModule() {
		return new User();
	}

	@Override
	public BaseMapper<User> getBaseMapper() {
		return userMapper;
	}
	/** 公共方法 结束**/
	
	
	/**
	 * 根据用户名查找
	 */
	@Override
	public User selectByName(String userName) {
		return userMapper.selectByName(userName);
	}


	/**
	 * 模糊查询（分页）
	 */
	@Override
	public BasePageResult selectByTerm(Map<String, Object> map) {
		Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
        return PageUtil.parseBasePageResult(userMapper.selectByTerm(map));
	}

	/**
	 * 更新删除
	 */
	@Override
	public int dropUpdate(String[] array) {
		return userMapper.dropUpdate(array);
	}

	@Override
	public User selectById(Integer id) {
		return userMapper.selectById(id);
	}
	

}
