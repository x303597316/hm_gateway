package com.huamai.service.impl;

import com.github.pagehelper.PageHelper;
import com.huamai.dao.DownUserDao;
import com.huamai.entity.DowUser;
import com.huamai.entity.Paper;
import com.huamai.service.DownUserService;
import com.huamai.util.BasePageResult;
import com.huamai.util.MD5Util;
import com.huamai.util.PageUtil;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DownUserServiceImpl implements DownUserService {
    @Autowired
    private DownUserDao downUserDao;
    @Override
    public BasePageResult selectAllPaper(Map<String, Object> map) {
        Integer limit = Integer.parseInt((String) map.get("limit"));
        Integer page = Integer.parseInt((String) map.get("page"));
        PageHelper.startPage(page, limit);
        List<Map<String,Object>> list = downUserDao.selectAllPaper(map);
     //   System.out.println(list);


        if(null!=list && list.size()>0){
            for (int i = 0; i <list.size() ; i++) {
                Map<String, Object> stringObjectMap = list.get(i);
                String password = (String) stringObjectMap.get("password");
                stringObjectMap.put("md5password",MD5Util.getMD5(password));

            }
        }


        return PageUtil.parseBasePageResult(list);
    }

    public List<Map<String,Object>> selectAllist(Map<String, Object> map) {

        List list = downUserDao.selectAllPaper(map);
        return list;
    }



    @Override
    public int deleteByPrimaryKey( Map<String,Object> map) {
        return downUserDao.deleteByPrimaryKey(map);
    }

    @Override
    public int insertSelective(Map<String, Object> map) {
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        map.put("create_time",sdf.format(d));

        return downUserDao.insertSelective(map);
    }

    @Override
    public int updateByPrimaryKeySelective(Map<String, Object> map) {
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        map.put("create_time",sdf.format(d));
        return downUserDao.updateByPrimaryKeySelective(map);
    }

    @Override
    public Map<String, Object> selectByPrimaryKey(Map<String, Object> map) {
        return downUserDao.selectByPrimaryKey(map);
    }

    @Override
    public DowUser selectByName(String userName) {
        return downUserDao.selectByName(userName);
    }
}
