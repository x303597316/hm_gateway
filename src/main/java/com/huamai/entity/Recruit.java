package com.huamai.entity;

public class Recruit {
    private Integer id;
    //招聘职位
    private String job;
    //公司部门
    private String department;
    //招聘人数
    private Integer number;
    //工作地址
    private String address;
    //工作待遇
    private String workreatment;
    //招聘类型（0-校区   1-社会）
    private Integer type;
    //发布时间
    private String createTime;
    //修改时间
    private String updateTime;
    //招聘要求
    private String requirement;
    //有效期
    private String validitytime;
    //联系人
    private String contacts;
    //联系电话
    private String mobile;
    //应聘该岗位
    private String url;
    
    public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getValiditytime() {
		return validitytime;
	}

	public void setValiditytime(String validitytime) {
		this.validitytime = validitytime;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department == null ? null : department.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getWorkreatment() {
        return workreatment;
    }

    public void setWorkreatment(String workreatment) {
        this.workreatment = workreatment == null ? null : workreatment.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime == null ? null : updateTime.trim();
    }
}