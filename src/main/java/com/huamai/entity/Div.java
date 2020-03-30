package com.huamai.entity;

/**
* @author cheng
* @version 创建时间：2018年12月27日 下午4:33:35
* 类说明
*/

public class Div {
	private int div_id;
	private String div_name;
	private String div_position;
	private String div_href;
	private String div_image;
	private String div_status;
	private String div_updatetime;
	private String div_content;
	public int getDiv_id() {
		return div_id;
	}
	public void setDiv_id(int div_id) {
		this.div_id = div_id;
	}
	public String getDiv_name() {
		return div_name;
	}
	public void setDiv_name(String div_name) {
		this.div_name = div_name;
	}
	public String getDiv_position() {
		return div_position;
	}
	public void setDiv_position(String div_position) {
		this.div_position = div_position;
	}
	public String getDiv_href() {
		return div_href;
	}
	public void setDiv_href(String div_href) {
		this.div_href = div_href;
	}
	public String getDiv_image() {
		return div_image;
	}
	public void setDiv_image(String div_image) {
		this.div_image = div_image;
	}
	public String getDiv_status() {
		return div_status;
	}
	public void setDiv_status(String div_status) {
		this.div_status = div_status;
	}
	public String getDiv_updatetime() {
		return div_updatetime;
	}
	public void setDiv_updatetime(String div_updatetime) {
		this.div_updatetime = div_updatetime;
	}
	public String getDiv_content() {
		return div_content;
	}
	public void setDiv_content(String div_content) {
		this.div_content = div_content;
	}
	@Override
	public String toString() {
		return " {div_id=" + div_id + ", div_name=" + div_name + ", div_position=" + div_position + ", div_href="
				+ div_href + ", div_image=" + div_image + ", div_status=" + div_status + ", div_updatetime="
				+ div_updatetime + ", div_content=" + div_content + "}";
	}
}
