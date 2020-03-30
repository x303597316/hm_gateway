package com.huamai.util;

public class BasePageResult
{
    private Integer code;//是否成功,默认0是成�??

    private Integer result;

    private String msg;//返回消息

    private long count; //总数

    private Object data;
    
    
    
    


    public BasePageResult()
    {
        count = 0;
    }


    public long getCount()
    {
        return count;
    }


    public void setCount(long count)
    {
        this.count = count;
    }


    public Object getData()
    {
        return data;
    }


    public void setData(Object data)
    {
        this.data = data;
    }


    public Integer getResult()
    {
        return result;
    }


    public void setResult(Integer result)
    {
        this.result = result;
    }


    public String getMsg()
    {
        return msg;
    }


    public void setMsg(String msg)
    {
        this.msg = msg;
    }


    public Integer getCode()
    {
        return code;
    }


    public void setCode(Integer code)
    {
        this.code = code;
    }

    @Override
    public String toString() {
        return "BasePageResult{" +
                "code=" + code +
                ", result=" + result +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", data=" + data +
                '}';
    }
}
