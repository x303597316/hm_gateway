package com.huamai.constant;

import com.huamai.util.SystemConfig;

/**
 * 常量类
 */
public class SysConstant
{

    /**
    * 用户session
    */
    public static final String UserSession = "User";

    /**
     * 用户session
     */
    public static final String DowUserSession = "DowUser";

    /**
     * 已删除
     */
    public static final Integer IsDelete = 2;

    /**
     * 未删除
     */
    public static final Integer IsNotDelete = 1;
    
    /**
     * 图片存储路径
     */
    public static final String imagePath = SystemConfig.readValue("image_url");
    
    /**
     * 前台项目地址
     */
    public static final String domainUrlMoblie = SystemConfig.readValue("domainUrlMoblie");
}
