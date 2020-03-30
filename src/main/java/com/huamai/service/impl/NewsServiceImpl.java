package com.huamai.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.NewsMapper;
import com.huamai.entity.News;
import com.huamai.service.NewsService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;

@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsMapper newmapper;

	@Override
	public BasePageResult search(Map<String, String> map) {
		Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(newmapper.selectByMap(map));
	}

	@Override
	public boolean insert(News entity) {
		return newmapper.insert(entity)>0?true:false;
	}

	@Override
	public boolean saveOrUpdate(News entity) {
		/*News entity = new News();
		entity.setContent((String)map.get("content"));
		entity.setCreatetime((String)map.get("createtime"));
		entity.setImgurl((String)map.get("imgurl"));
		entity.setTitle((String)map.get("title"));
		entity.setType((String)map.get("type"));
		entity.setVisittime((Integer)map.get("visittime"));
		entity.setPresent((String)map.get("present"));*/
		/*if(map.get("id")==null || map.get("id")=="") {*/
		if(entity.getId()==null) {
			entity.setVisittime(0);
			return newmapper.insertSelective(entity)>0?true:false;
		}
		/*entity.setId((Integer)map.get("id"));*/
		return newmapper.updateByPrimaryKeySelective(entity)>0?true:false;
	}

	@Override
	public boolean delete(Integer id) {
		return newmapper.deleteByPrimaryKey(id)>0?true:false;
	}

	@Override
	public News selectByprimerykey(Integer id) {
		return newmapper.selectByPrimaryKey(id);
	}

	@Override
	public List<News> selectByType(String type) {
		return newmapper.selectByType(type);
	}
	
	@Override
	public int getCount(Map<String, String> map) {
		return newmapper.selectByMap(map).size();
	}

	@Override
	public List<News> selectNewsType(Map<String, Object> map) {
		return newmapper.selectNewsType(map);
	}

}
