package com.huamai.service;

import java.util.Map;

import com.huamai.entity.CompanyInfo;
import com.huamai.util.BasePageResult;

public interface InfoService {

	public BasePageResult infolist(Map<String,Object> map); 
	
	public boolean updateByprimerykey(CompanyInfo entity);
	
	public boolean deleteByprimerykey(Integer id);
	
	public CompanyInfo select(Integer id);
	
	public boolean insert(CompanyInfo entity);
}
