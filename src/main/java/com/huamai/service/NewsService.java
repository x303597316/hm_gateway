package com.huamai.service;

import java.util.List;
import java.util.Map;

import com.huamai.entity.News;
import com.huamai.util.BasePageResult;

public interface NewsService {
	
	public BasePageResult search(Map<String,String> map);
	
	public boolean insert(News entity);

	public boolean saveOrUpdate(News entity);
	
	public boolean delete(Integer id);
	
	public News selectByprimerykey(Integer id);
	
	public List<News> selectByType(String type);
	
	public int getCount(Map<String, String> map);
	
	public List<News> selectNewsType(Map<String,Object> map);
}
