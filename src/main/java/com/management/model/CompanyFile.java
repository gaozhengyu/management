package com.management.model;

import java.util.Date;

public class CompanyFile {
    private String companyfileid;

    private String companyfilename;

    private String companyfileplace;

    private Date uploadtime;

    private String companyid;

    private Integer companyfiletype;

    public String getCompanyfileid() {
        return companyfileid;
    }

    public void setCompanyfileid(String companyfileid) {
        this.companyfileid = companyfileid == null ? null : companyfileid.trim();
    }

    public String getCompanyfilename() {
        return companyfilename;
    }

    public void setCompanyfilename(String companyfilename) {
        this.companyfilename = companyfilename == null ? null : companyfilename.trim();
    }

    public String getCompanyfileplace() {
        return companyfileplace;
    }

    public void setCompanyfileplace(String companyfileplace) {
        this.companyfileplace = companyfileplace == null ? null : companyfileplace.trim();
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public String getCompanyid() {
        return companyid;
    }

    public void setCompanyid(String companyid) {
        this.companyid = companyid == null ? null : companyid.trim();
    }

    public Integer getCompanyfiletype() {
        return companyfiletype;
    }

    public void setCompanyfiletype(Integer companyfiletype) {
        this.companyfiletype = companyfiletype;
    }
}