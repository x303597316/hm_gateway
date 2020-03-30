package com.huamai.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.BaseMapper;
import com.huamai.dao.RoleMapper;
import com.huamai.dao.RoleMenuMapper;
import com.huamai.entity.Role;
import com.huamai.service.RoleService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;


@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService{

	/** 公共方法 开始**/
	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	
	@Override
	public Role getModule() {
		return new Role();
	}

	@Override
	public BaseMapper<Role> getBaseMapper() {
		return roleMapper;
	}
	/** 公共方法 结束**/

	@Override
	public BasePageResult selectByTerm(Map<String, Object> map) {
		Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
        return PageUtil.parseBasePageResult(roleMapper.selectByTerm(map));
	}

	@Override
	public Role selectById(Integer id) {
		return roleMapper.selectById(id);
	}

	@Override
	public Role selectByName(String roleName) {
		return roleMapper.selectByName(roleName);
	}

	@Override
	public int dropUpdate(String[] array) {
		return roleMapper.dropUpdate(array);
	}

	@Override
	public List<Role> selectAll(Map<String, Object> map) {
		return roleMapper.selectByTerm(map);
	}

	//返回自增主键
	@Override
	public int insertSelective(Role role) {
		roleMapper.insertSelective(role);
		return role.getId();
	}
	@Transactional
	@Override
	public int deleteMultiple(String[] ids) {
		roleMenuMapper.deleteMultipleByRid(ids);
		return roleMapper.deleteMultiple(ids);
	}

}
