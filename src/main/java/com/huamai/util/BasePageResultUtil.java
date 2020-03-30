package com.huamai.util;


public class BasePageResultUtil
{

    public static BasePageResult success(Object object)
    {
        BasePageResult result = new BasePageResult();
        result.setCode(StatusCodeEnum.SUCCESS.getCode());
        result.setMsg(StatusCodeEnum.SUCCESS.getDesc());
        result.setData(object);
        return result;
    }


    public static BasePageResult success(Object object, long i)
    {
        BasePageResult result = new BasePageResult();
        result.setCode(StatusCodeEnum.SUCCESS.getCode());
        result.setMsg(StatusCodeEnum.SUCCESS.getDesc());
        result.setCount(i);
        result.setData(object);
        return result;
    }


    public static BasePageResult success()
    {
        return success(null, 0);
    }


    public static String fail(int code, String msg)
    {
        BasePageResult result = new BasePageResult();
        result.setCode(code);
        result.setMsg(msg);
        result.setData(null);
        return result.toString();
    }


    public static BasePageResult failResult(int code, String msg)
    {
        BasePageResult result = new BasePageResult();
        result.setCode(code);
        result.setMsg(msg);
        result.setData(null);
        return result;
    }


    public static String fail(StatusCodeEnum statusCodeEnum)
    {
        BasePageResult result = new BasePageResult();
        result.setCode(statusCodeEnum.getCode());
        result.setMsg(statusCodeEnum.getDesc());
        result.setData(null);
        return result.toString();
    }

}
