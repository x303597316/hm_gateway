package com.huamai.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.RecruitMapper;
import com.huamai.entity.Recruit;
import com.huamai.service.RecruitService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;
@Service
public class RecruitServiceImpl implements RecruitService {
	@Resource
	private RecruitMapper recruitMapper;
	@Override
	public BasePageResult recruitList(Map<String, Object> map) {
		Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
		return PageUtil.parseBasePageResult(recruitMapper.recruitList(map));
	}

	@Override
	public Recruit recruit(Integer id) {
		Recruit recruit = recruitMapper.selectByPrimaryKey(id);
		return recruit;
	}

	@Override
	public int deleteRecruit(Integer id) {
		return recruitMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateRecruit(Recruit recruit) {
		return recruitMapper.updateByPrimaryKeySelective(recruit);
	}

	@Override
	public int insertRecruit(Recruit recruit) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		recruit.setUpdateTime(df.format(new Date()));
		return recruitMapper.insertSelective(recruit);
	}

}
