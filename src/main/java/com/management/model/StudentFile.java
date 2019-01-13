package com.management.model;

import java.util.Date;

public class StudentFile {
    private String studentfileid;

    private String studentfilename;

    private String studentfileplace;

    private Integer studentfiletype;

    private Date uploadtime;

    private String studentid;

    public String getStudentfileid() {
        return studentfileid;
    }

    public void setStudentfileid(String studentfileid) {
        this.studentfileid = studentfileid == null ? null : studentfileid.trim();
    }

    public String getStudentfilename() {
        return studentfilename;
    }

    public void setStudentfilename(String studentfilename) {
        this.studentfilename = studentfilename == null ? null : studentfilename.trim();
    }

    public String getStudentfileplace() {
        return studentfileplace;
    }

    public void setStudentfileplace(String studentfileplace) {
        this.studentfileplace = studentfileplace == null ? null : studentfileplace.trim();
    }

    public Integer getStudentfiletype() {
        return studentfiletype;
    }

    public void setStudentfiletype(Integer studentfiletype) {
        this.studentfiletype = studentfiletype;
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid == null ? null : studentid.trim();
    }
}