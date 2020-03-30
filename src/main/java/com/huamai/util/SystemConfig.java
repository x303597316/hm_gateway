package com.huamai.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 系统配置文件
 * @author chengfeiyang
 *
 */
public class SystemConfig
{
    private static Properties config = null;
    static
    {
        InputStream in = SystemConfig.class.getClassLoader().getResourceAsStream("config.properties");
        config = new Properties();
        try
        {
            config.load(in);
            in.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }


    // 根据key读取value 
    public static String readValue(String key)
    {
        try
        {
            String value = config.getProperty(key);
            return value;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }

}
