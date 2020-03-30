package com.huamai.entity;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name="sys_role")
public class Role extends BaseEntity{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String roleName;

    private String description;

    private String createTime;

    private String createUser;
    
    private Integer status;

    private Integer isDelete;
    
    private String mid;//额外参数，用于接受菜单ID

    @Column(name="role_name")
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    @Column(name="description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
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
        this.createUser = createUser;
    }

    @Column(name="status")
    public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name="is_delete")
    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}
    
}