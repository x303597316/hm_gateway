package com.huamai.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.BannerDao;
import com.huamai.entity.Banner;
import com.huamai.service.BannerService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;

/**
 * @author cheng
 * @version 创建时间：2018年12月18日 上午10:46:04 类说明
 */

@Service
public class BannerServiceImpl implements BannerService {

	@Autowired
	private BannerDao bannerDao;

	@Override
	public BasePageResult getBannerList(Map<String, String> map) {
		Integer limit = Integer.parseInt((String) map.get("limit"));
		Integer page = Integer.parseInt((String) map.get("page"));
		PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(bannerDao.getBannerList(map));

	}

	@Override
	public int insertBanner(Map<String, String> map) {
		// TODO Auto-generated method stub
		return bannerDao.insertBanner(map);
	}

	@Override
	public int updateBanner(Map<String, String> map) {
		// TODO Auto-generated method stub
		return bannerDao.updateBanner(map);
	}

	@Override
	public List<Banner> getBanner(Map<String, String> map) {
		// TODO Auto-generated method stub
		return bannerDao.getBanner(map);
	}

	@Override
	public int deleteBannerById(Map<String, String> map) {
		// TODO Auto-generated method stub
		return bannerDao.deleteBannerById(map);
	}

	@Override
	public Banner selectById(Integer banner_id) {
		// TODO Auto-generated method stub
		return bannerDao.selectById(banner_id);
	}

}
