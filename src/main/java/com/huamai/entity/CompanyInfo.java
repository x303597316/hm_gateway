package com.huamai.entity;

public class CompanyInfo {
    private Integer id;

    private String sectionname;

    private String titleimage;

    private String status;

    private String companyintroduction;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSectionname() {
        return sectionname;
    }

    public void setSectionname(String sectionname) {
        this.sectionname = sectionname == null ? null : sectionname.trim();
    }

    public String getTitleimage() {
        return titleimage;
    }

    public void setTitleimage(String titleimage) {
        this.titleimage = titleimage == null ? null : titleimage.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getCompanyintroduction() {
        return companyintroduction;
    }

    public void setCompanyintroduction(String companyintroduction) {
        this.companyintroduction = companyintroduction == null ? null : companyintroduction.trim();
    }
}