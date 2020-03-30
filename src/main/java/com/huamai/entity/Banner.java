package com.huamai.entity;

/**
 * @author cheng
 * @version 创建时间：2018年12月26日 下午2:32:59 类说明
 */

public class Banner {
	private int banner_id;
	private String banner_name;
	private String banner_image;
	private int banner_sort;
	private int banner_status;
	private String createtime;
	
	

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public int getBanner_id() {
		return banner_id;
	}

	public void setBanner_id(int banner_id) {
		this.banner_id = banner_id;
	}

	public String getBanner_name() {
		return banner_name;
	}

	public void setBanner_name(String banner_name) {
		this.banner_name = banner_name;
	}

	public String getBanner_image() {
		return banner_image;
	}

	public void setBanner_image(String banner_image) {
		this.banner_image = banner_image;
	}

	public int getBanner_sort() {
		return banner_sort;
	}

	public void setBanner_sort(int banner_sort) {
		this.banner_sort = banner_sort;
	}

	public int getBanner_status() {
		return banner_status;
	}

	public void setBanner_status(int banner_status) {
		this.banner_status = banner_status;
	}

	@Override
	public String toString() {
		return " {banner_id=" + banner_id + ", banner_name=" + banner_name + ", banner_image=" + banner_image
				+ ", banner_sort=" + banner_sort + ", banner_status=" + banner_status + ", createtime=" + createtime
				+ "}";
	}
}
