package com.huamai.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;


public class CommonUtils {
	private static final Logger logger = LoggerFactory.getLogger(CommonUtils.class);
	private static Properties properties;

	/**
     * 字符串是否为空,不为空返回true
     * @return
     */
    public static boolean isNotEmpty(String text)
    {
        if (text != null && !text.equals(""))
        {
            return true;
        }
        return false;
    }
	
	/**
	 * 
	 * 读取配置文件
	 * 
	 */
	public static String readProperties(String key) {
		String ret = "";
		try {
			if (null == properties) {
				properties = new Properties();
				properties
						.load(new InputStreamReader(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"),"UTF-8"));
			}
			ret = properties.getProperty(key);
		} catch (Exception e) {
			logger.error("CommonUtils.readProperties() error:" + e.getMessage());
			return ret;
		}
		return ret;
	}

	/**
	 * 
	 * MD5加密
	 * 
	 */
	public static String md5(String content) {
		String ret = "";
		try {
			MessageDigest digest = MessageDigest.getInstance("md5");
			byte[] bs = digest.digest(content.getBytes());
			for (byte b : bs) {
				int t = b & 255;
				if (t < 16 && t >= 0) {
					ret = ret + "0" + Integer.toHexString(t);
				} else {
					ret = ret + Integer.toHexString(t);
				}
			}
		} catch (Exception e) {
			logger.error("CommonUtils.md5() error:" + e.getMessage());
			return ret;
		}
		return ret;
	}

	/**
	 * 
	 * SHA1加密
	 * 
	 */
	public static String sha1(String content) {
		String result = "";
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-1");
			digest.update(content.getBytes());
			byte[] arr = digest.digest();
			String t;
			for (int i = 0; i < arr.length; i++) {
				t = (Integer.toHexString(arr[i] & 0xFF));
				if (t.length() == 1) {
					result += "0";
				}
				result += t;
			}

		} catch (Exception e) {
			logger.error("CommonUtils.sha1() error:" + e.getMessage());
			return result;
		}
		return result;
	}

	/**
	 * 
	 * 对网�?进行编码
	 * 
	 */
	public static String encodeUrl(String url) {
		String ret = "";
		if (!StringUtils.isEmpty(url)) {
			try {
				ret = URLEncoder.encode(url, "utf-8");
			} catch (Exception e) {
				logger.error("CommonUtils.encodeUrl() error:" + e.getMessage());
				return ret;
			}
		}
		return ret;
	}

	/**
	 * 
	 * 转换文本编码
	 * 
	 */
	public static String convertEncode(String content) {
		String ret = "";
		if (!StringUtils.isEmpty(content)) {
			try {
				ret = new String(content.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				logger.error("CommonUtils.convertEncode() error:" + e.getMessage());
				return ret;
			}
		}
		return ret;
	}
	
	/**
	 * @Description: 将base64编码字符串转换为图片
	 * @Author: 
	 * @CreateTime: 
	 * @param imgStr base64编码字符�?
	 * @param path 图片路径-具体到文�?
	 * @return
	*/
	public static boolean generateImage(String imgStr, String path) {
		if (imgStr == null){
			return false;
		}
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			//解密
			byte[] b = decoder.decodeBuffer(imgStr);
				// 处理数据
				for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {
				b[i] += 256;
				}
			}
			OutputStream out = new FileOutputStream(path);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e){
			logger.error("CommonUtils.generateImage() error:" + e.getMessage());
			return false;
		}
	}
	/**
	 * @Description: 根据图片地址转换为base64编码字符�?
	 * @Author: 
	 * @CreateTime: 
	 * @return
	 */
	public static String getImageStr(File imageFile) {
	    InputStream inputStream = null;
	    byte[] data = null;
	    try {
	        inputStream = new FileInputStream(imageFile);
	        data = new byte[inputStream.available()];
	        inputStream.read(data);
	        inputStream.close();
	        // 加密
		    BASE64Encoder encoder = new BASE64Encoder();
		    return encoder.encode(data);
	    } catch (IOException e) {
	    	logger.error("CommonUtils.getImageStr() error:" + e.getMessage());
	    	return null;
	    }
	}
	
	/**
	 * 
	 * 读取页面数�??
	 * 
	 */
	public static String getParameter(HttpServletRequest request, String name) {
		String ret = "";
		if (null != request) {
			ret = request.getParameter(name);
		}
		return ret;
	}
	
	/**
	 * 
	 * 网址重定�?
	 * 
	 */
	public static void redirectUrl(String url, HttpServletResponse response) {
		try {
			response.sendRedirect(url);
		} catch (Exception e) {
			logger.error("CommonUtils.redirectUrl() error:" + e.getMessage());
		}
	}
	
	/**
	 * 16或�??20位随机数生成规则
	 * @param flag �?1代表20�? 其他 16�?
	 * @return
	 */
	public static String pwdNo(int flag){
		int random =(int)((Math.random()*9+1)*10);
		if(flag == 1){
			random=(int)((Math.random()*9+1)*100000);
		}
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String dstr =  dateFormat.format(date);
		String refundSerialNo = random+dstr;
		return refundSerialNo ;
	}
	
	/**
	 * 获取招行用户id
	 * @param request
	 * @return
	 */
	public static Object getCmbUserID(HttpServletRequest request){
		HttpSession session = request.getSession();
		Object cmbUserID = session.getAttribute("cmbUserID");
		return cmbUserID;
	}
	
}
