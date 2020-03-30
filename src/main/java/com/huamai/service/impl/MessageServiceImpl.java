package com.huamai.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.MessageDao;
import com.huamai.entity.Message;
import com.huamai.util.PageUtil;
import com.huamai.service.MessageService;
import com.huamai.util.BasePageResult;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDao messageDao;
	@Override
	public BasePageResult findAllMes(Map<String, Object> map) {
		BasePageResult p = null;
		Integer limit = Integer.parseInt((String) map.get("limit"));
		Integer page = Integer.parseInt((String) map.get("page"));
		PageHelper.startPage(page, limit);
		p = PageUtil.parseBasePageResult(messageDao.findAllMes(map));
		return p;
	}
	@Override
	public Message findById(Integer id) {
		return messageDao.findById(id);
	}
	@Override
	public int insertSelective(Message record) {
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		record.setCreatetime(sdf.format(d));
		return messageDao.insertSelective(record);
	}
	@Override
	public boolean insert(Message record) {
		return messageDao.insertSelective(record)>0?true:false;
	}

	
}
