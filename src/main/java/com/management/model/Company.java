package com.management.model;

public class Company {
    private String companyid;

    private String companyname;

    private Integer companytype1;

    private Integer companytype2;

    private String companypassword;

    private String companycity;

    private String contacts;

    private String companyphone;

    private Integer authorize;

    private String companytype;

    public String getCompanytype() { return companytype; }

    public void setCompanytype(String companytype) { this.companytype = companytype == null ? null : companytype.trim(); }

    public String getCompanyid() {
        return companyid;
    }

    public void setCompanyid(String companyid) {
        this.companyid = companyid == null ? null : companyid.trim();
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
    }

    public Integer getCompanytype1() {
        return companytype1;
    }

    public void setCompanytype1(Integer companytype1) {
        this.companytype1 = companytype1;
    }

    public Integer getCompanytype2() {
        return companytype2;
    }

    public void setCompanytype2(Integer companytype2) {
        this.companytype2 = companytype2;
    }

    public String getCompanypassword() {
        return companypassword;
    }

    public void setCompanypassword(String companypassword) {
        this.companypassword = companypassword == null ? null : companypassword.trim();
    }

    public String getCompanycity() {
        return companycity;
    }

    public void setCompanycity(String companycity) {
        this.companycity = companycity == null ? null : companycity.trim();
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts == null ? null : contacts.trim();
    }

    public String getCompanyphone() {
        return companyphone;
    }

    public void setCompanyphone(String companyphone) {
        this.companyphone = companyphone == null ? null : companyphone.trim();
    }

    public Integer getAuthorize() {
        return authorize;
    }

    public void setAuthorize(Integer authorize) {
        this.authorize = authorize;
    }
}