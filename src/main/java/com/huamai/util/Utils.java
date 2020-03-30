package com.huamai.util;

import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

public class Utils {
	
	private Utils() {

	}

	public static final String PARAM_SEPARATOR = "#h#u#a#m#a#i#6#0#3#0#4#2#";
	public static final String PARAM_FILLING = "#h#u#a#m#a#i#S#o#f#t#N#o#S#h#a#n#g#S#h#i";
	public static final int PARAM_ENCODE = 1;
	public static final int PARAM_DECODE = 2;

	public static final String SESSION_MANAGER = "session_manager";
	
	static Properties properties;

	public static String readProperties(String key) {
		String ret = "";
		try {
			if (null == properties) {
				properties = new Properties();
				properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"));
			}
			ret = properties.getProperty(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
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
			e.printStackTrace();
		}
		return ret;
	}
	
	public static String encodeUrl(String url) {
		String ret = "";
		if (!StringUtils.isEmpty(url)) {
			try {
				ret = URLEncoder.encode(url, "utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
	
	public static void redirectUrl(String url, HttpServletResponse response) {
		try {
			response.sendRedirect(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * 处理页面传�??
	 * 
	 */
	public static String[] paramPro(String secretKey, String param) {
		String[] ret = null;
		if (!StringUtils.isEmpty(param)) {
			String decode = TripleDESUtils.decode(secretKey, param);
			if (!StringUtils.isEmpty(decode)) {
				int len = decode.split(Utils.PARAM_SEPARATOR).length;
				ret = new String[len];
				for (int i = 0; i < len; i++) {
					ret[i] = Utils.paramPro(decode.split(Utils.PARAM_SEPARATOR)[i], Utils.PARAM_DECODE);
				}
			}
		}
		return ret;
	}
	
	/**
	 * 
	 * 处理页面传�?�（1：如果为空，进行填充 2：如果为填充值，设置为空�?
	 * 
	 */
	public static String paramPro(String param, int method) {
		String ret = null;
		if (Utils.PARAM_ENCODE == method) { // 如果为空，进行填�?
			if (StringUtils.isEmpty(param)) {
				ret = Utils.PARAM_FILLING;
			} else {
				ret = param; 
			}
		} else if (Utils.PARAM_DECODE == method) { // 如果为填充�?�，设置为空
			if (Utils.PARAM_FILLING.equals(param)) {
				ret = "";
			} else {
				ret = param;
			}
		}
		return ret;
	}
	
	/**
	 * 
	 * 生成加密�?
	 * 
	 */
	public static String createParamEncodeSrc(String... params) {
		String ret = "";
		if (null != params && 0 < params.length) {
			for (String param : params) {
				ret += Utils.paramPro(param, Utils.PARAM_ENCODE) + Utils.PARAM_SEPARATOR;
			}
			ret = ret.substring(0, ret.lastIndexOf(Utils.PARAM_SEPARATOR));
		}
		return ret;
	}

	public static String toUnicode(String str) {
        str = (str == null ? "" : str);
        String tmp;
        StringBuffer sb = new StringBuffer(1000);
        char c;
        int i, j;
        sb.setLength(0);
        for (i = 0; i < str.length(); i++) {
            c = str.charAt(i);
            sb.append("\\u");
            j = (c >>> 8); // 取出高8位
            tmp = Integer.toHexString(j);
            if (tmp.length() == 1)
                sb.append("0");
            sb.append(tmp);
            j = (c & 0xFF); // 取出低8位
            tmp = Integer.toHexString(j);
            if (tmp.length() == 1)
                sb.append("0");
            sb.append(tmp);
        }
        return (new String(sb));
    }

    public static String toUTF8(String str) {
        Charset set = Charset.forName("UTF-16");
        Pattern p = Pattern.compile("\\\\u([0-9a-fA-F]{4})");
        Matcher m = p.matcher(str);
        int start = 0;
        int start2 = 0;
        StringBuffer sb = new StringBuffer();
        while (m.find(start)) {
            start2 = m.start();
            if (start2 > start) {
                String seg = str.substring(start, start2);
                sb.append(seg);
            }
            String code = m.group(1);
            int i = Integer.valueOf(code, 16);
            byte[] bb = new byte[4];
            bb[0] = (byte) ((i >> 8) & 0xFF);
            bb[1] = (byte) (i & 0xFF);
            ByteBuffer b = ByteBuffer.wrap(bb);
            sb.append(String.valueOf(set.decode(b)).trim());
            start = m.end();
        }
        start2 = str.length();
        if (start2 > start) {
            String seg = str.substring(start, start2);
            sb.append(seg);
        }
        return sb.toString();
    }
	
}
