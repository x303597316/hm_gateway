package com.huamai.util;

import java.util.UUID;

/**
 * 生成uuid
 *
 */
public class UUIDUtil {
	public static String getUuid(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replace("-", "");
	}

	public static void main(String[] args) {
		System.out.println(UUIDUtil.getUuid());
	}
}
