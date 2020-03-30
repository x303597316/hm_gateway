package com.huamai.entity;

public class News {
    private Integer id;

    private String title;

    private String createtime;
    
    private String present;

    private Integer visittime;

    private String type;

    private String content;

    private String imgurl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public Integer getVisittime() {
        return visittime;
    }

    public void setVisittime(Integer visittime) {
        this.visittime = visittime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

	public String getPresent() {
		return present;
	}

	public void setPresent(String present) {
		this.present = present;
	}
    
    
}