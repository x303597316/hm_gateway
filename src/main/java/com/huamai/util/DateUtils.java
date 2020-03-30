package com.huamai.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类tag.
 * 
 * @author n004881
 * @version [版本�?, 2015�?3�?27日]
 * @see [相关�?/方法]
 * @since [产品/模块版本]
 */
public abstract class DateUtils extends org.apache.commons.lang3.time.DateUtils
{

    /**
    * 默认格式 yyyy-MM-dd HH:mm:ss
    */
    public static final String DEFAULT_FORMAT = "yyyy-MM-dd HH:mm:ss";

    public static final String DATE_PATTERN = "yyyy-MM-dd";

    public static final String TIME_PATTERN = "HH:mm:ss";

    public static final String DATETIME_PATTERN = DATE_PATTERN + " " + TIME_PATTERN;

    private static String[] parsePatterns = { DATE_PATTERN, DATE_PATTERN + TIME_PATTERN, "yyyy-MM-dd HH:mm", "yyyy-MM", "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss",
            "yyyy/MM/dd HH:mm", "yyyy/MM", "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM" };


    public static String date2Str(Date target)
    {
        return date2Str(target, DATE_PATTERN);
    }


    public static String getNowTime()
    {
        // 获取当前时间
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat(DEFAULT_FORMAT);// 可以方便地修改日期格�?
        String updateTime = dateFormat.format(now);
        return updateTime;
    }


    /**
     * 时间对象转换成字符串对象.
     * 
     * @param target
     * @param pattern
     * @return
     */
    public static String date2Str(Date target, String pattern)
    {
        if (null == target)
        {
            return "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        String targetStr = "";
        try
        {
            targetStr = sdf.format(target);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return targetStr;
    }


    /**
     * 时间加减计算.
     * 
     * @param date
     * @param offset
     * @return
     * @see [类�?�类#方法、类#成员]
     */
    public static Date date2Sub(Date date, int field, int offset)
    {
        Calendar c = Calendar.getInstance();

        c.setTime(date);
        c.add(field, offset);

        return c.getTime();
    }


    /**
     * 获取时间戳tag.
     * 
     * @param date
     * @return
     * @throws ParseException
     */
    public static int getTimeStamp(Date date) throws ParseException
    {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String s1 = format.format(date);
        String s2 = format.format(new Date());
        return (int) ((format.parse(s2).getTime() - format.parse(s1).getTime()) / 1000);
    }


    /**
     * 日期型字符串转化为日�? 格式 { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
     * "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy.MM.dd",
     * "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm" }
     */
    public static Date parseDate(Object str)
    {
        if (str == null)
        {
            return null;
        }
        try
        {
            return parseDate(str.toString(), parsePatterns);
        }
        catch (ParseException e)
        {
            return null;
        }
    }


    /**
     * 字符串对象转换成时间对象.
     * 
     * @param target
     * @param pattern
     * @return
     */
    public static Date str2Date(String target, String pattern)
    {
        if (null == target)
        {
            return new Date();
        }
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        Date date = null;
        try
        {
            date = sdf.parse(target);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return date;
    }


    /**
     * 时间字符串转换成字符串tag.
     * 
     * @param src
     * @return
     */
    public static String str2DateFormat(String src)
    {
        if (src == null || "".equals(src))
        {
            return "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try
        {
            long seconds = 0;
            seconds = Long.parseLong(src);
            return sdf.format(new Date(seconds));
        }
        catch (NumberFormatException e)
        {
            return src;
        }
    }
}
