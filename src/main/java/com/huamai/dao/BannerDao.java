package com.huamai.dao;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Banner;

/**
* @author cheng
* @version 创建时间：
* 类说明
*/

public interface BannerDao {

	List<Banner> getBannerList(Map<String, String> map);
	
	int insertBanner(Map<String,String> map);
	
	int updateBanner(Map<String,String> map);
	
	List<Banner> getBanner(Map<String, String> map);
	
	int deleteBannerById(Map<String,String> map);
	
	Banner selectById(Integer banner_id);
	
}
