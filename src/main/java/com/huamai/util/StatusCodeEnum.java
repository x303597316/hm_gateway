package com.huamai.util;

/**
 * 
 * 状�?�码和描述枚�?
 */
public enum StatusCodeEnum
{
    SUCCESS(0, "操作成功"), SYSTEM_ERROR(1, "系统错误");

    private int code;
    private String desc;


    StatusCodeEnum(int code, String desc)
    {
        this.setCode(code);
        this.setDesc(desc);
    }


    public int getCode()
    {
        return code;
    }


    public void setCode(int code)
    {
        this.code = code;
    }


    public String getDesc()
    {
        return desc;
    }


    public void setDesc(String desc)
    {
        this.desc = desc;
    }
}
