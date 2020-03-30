package com.huamai.service;

import java.util.List;
import java.util.Map;

import com.huamai.entity.Banner;
import com.huamai.util.BasePageResult;

/**
 * @author cheng
 */

public interface BannerService {

	BasePageResult getBannerList(Map<String, String> map);
	
	List<Banner> getBanner(Map<String, String> map);

	int insertBanner(Map<String, String> map);

	int updateBanner(Map<String, String> map);
	
	int deleteBannerById(Map<String,String> map);
	
	Banner selectById(Integer banner_id);
}
