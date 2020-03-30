package com.huamai.util;

import java.util.List;

import com.github.pagehelper.Page;

/**
 * 
 * 分页工具�?
 */
public class PageUtil
{
    @SuppressWarnings("rawtypes")
    public static BasePageResult parseBasePageResult(List datas)
    {
        BasePageResult result = new BasePageResult();
        if (datas instanceof Page)
        {
            Page page = (Page) datas;
            result.setCount(page.getTotal());
            result.setData(page.getResult());
            result.setCode(StatusCodeEnum.SUCCESS.getCode());
            result.setMsg(StatusCodeEnum.SUCCESS.getDesc());
        }
        return result;
    }
}
