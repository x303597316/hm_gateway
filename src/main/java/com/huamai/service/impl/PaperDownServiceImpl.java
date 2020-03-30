package com.huamai.service.impl;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.PaperDownDao;
import com.huamai.service.PaperDownService;
import com.huamai.util.BasePageResult;
import com.huamai.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class PaperDownServiceImpl  implements PaperDownService {
    @Autowired
    private PaperDownDao paperDownDao;
    @Override
    public Map<String, Object> selectByPrimaryKey(Map<String, Object> map) {
        return paperDownDao.selectByPrimaryKey(map);
    }

    @Override
    public BasePageResult selectAllPaper(Map<String, String> map) {
        Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
        List<Map<String,Object>> list = paperDownDao.selectAllPaper(map);
        return PageUtil.parseBasePageResult(list);
    }

    @Override
    public int deleteByPrimaryKey(Map<String, String> map) {
        return paperDownDao.deleteByPrimaryKey(map);
    }

    @Override
    public int insertSelective(Map<String, String> map) {
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        map.put("updateTime",sdf.format(d));

        return paperDownDao.insertSelective(map);
    }

    @Override
    public int updateByPrimaryKeySelective(Map<String, String> map) {
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        map.put("updateTime",sdf.format(d));
        return paperDownDao.updateByPrimaryKeySelective(map);
    }
}
