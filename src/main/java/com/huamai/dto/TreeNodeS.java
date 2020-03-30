package com.huamai.dto;

import java.util.List;

/**
 * 树节点实体类
 * 
 * @author 29077
 *
 */
public class TreeNodeS {
	public String id;// 必须
	public String pId;// 必须父id
	public String name;// 名称
	public boolean open;// 是否展开
	public String url;// 给节点加链接
	public String icon;// 节点图标，可以自定义图标路径
	public String title;//
	public boolean checked;// 当前节点是否被选中 true or false
	public List<TreeNodeS> childTreeNodeS;

	public TreeNodeS() {
	}

	public TreeNodeS(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean getChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public List<TreeNodeS> getChildTreeNodeS() {
		return childTreeNodeS;
	}

	public void setChildTreeNodeS(List<TreeNodeS> childTreeNodeS) {
		this.childTreeNodeS = childTreeNodeS;
	}

	@Override
	public String toString() {
		return "TreeNodeS [id=" + id + ", pId=" + pId + ", name=" + name + ", open=" + open + ", url=" + url + ", icon="
				+ icon + ", title=" + title + ", checked=" + checked + ", childTreeNodeS=" + childTreeNodeS + "]";
	}

}
