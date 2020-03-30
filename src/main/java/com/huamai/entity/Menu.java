package com.huamai.entity;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name="sys_menu")
public class Menu extends BaseEntity {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private String menuName;

    private String urlPath;

    private String icon;

    private Integer parentId;
    
    private Integer ranking;

    private String createTime;

    private String createUser;

    private Integer status;

    private Integer isDelete;

    @Column(name="menu_name")
    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }
    
    @Column(name="url_path")
    public String getUrlPath() {
        return urlPath;
    }

    public void setUrlPath(String urlPath) {
        this.urlPath = urlPath == null ? null : urlPath.trim();
    }

    @Column(name="icon")
    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    @Column(name="parent_id")
    public Integer getParentId() {
        return parentId;
    }
    
    @Column(name="ranking")
    public Integer getRanking() {
		return ranking;
	}

	public void setRanking(Integer ranking) {
		this.ranking = ranking;
	}

	public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
	
    @Column(name="create_time")
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    @Column(name="create_user")
    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }
    @Column(name="status")
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name="id_delete")
    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}