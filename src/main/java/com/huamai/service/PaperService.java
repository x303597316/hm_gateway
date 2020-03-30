package com.huamai.service;

import java.util.Map;

import com.huamai.entity.Paper;
import com.huamai.util.BasePageResult;

public interface PaperService {
	public int deleteByPrimaryKey(Integer id);

    public int insert(Paper record);

    public int insertSelective(Paper record);

    public Paper selectByPrimaryKey(Integer id);

    public int updateByPrimaryKeySelective(Paper record);

    public int updateByPrimaryKey(Paper record);
    
    public BasePageResult selectAllPaper(Map<String,String> map);
}
