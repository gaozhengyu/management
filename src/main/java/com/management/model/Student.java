package com.management.model;

public class Student {
    private String studentid;

    private String studentname;

    private String studentsex;

    private String studentphone;

    private String classid;

    private String teacherid;

    private Integer teacherresult;

    private Integer companyresult;

    private Integer trainningresult;

    private String direction;

    private String companyid;

    private String studentpassword;

    private String companyname;

    private String parentsphone;

    private String studentemail;

    private String subject;

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid == null ? null : studentid.trim();
    }

    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname == null ? null : studentname.trim();
    }

    public String getStudentsex() {
        return studentsex;
    }

    public void setStudentsex(String studentsex) {
        this.studentsex = studentsex == null ? null : studentsex.trim();
    }

    public String getStudentphone() {
        return studentphone;
    }

    public void setStudentphone(String studentphone) {
        this.studentphone = studentphone == null ? null : studentphone.trim();
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid == null ? null : classid.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public Integer getTeacherresult() {
        return teacherresult;
    }

    public void setTeacherresult(Integer teacherresult) {
        this.teacherresult = teacherresult;
    }

    public Integer getCompanyresult() {
        return companyresult;
    }

    public void setCompanyresult(Integer companyresult) {
        this.companyresult = companyresult;
    }

    public Integer getTrainningresult() {
        return trainningresult;
    }

    public void setTrainningresult(Integer trainningresult) {
        this.trainningresult = trainningresult;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getCompanyid() {
        return companyid;
    }

    public void setCompanyid(String companyid) {
        this.companyid = companyid == null ? null : companyid.trim();
    }

    public String getStudentpassword() {
        return studentpassword;
    }

    public void setStudentpassword(String studentpassword) {
        this.studentpassword = studentpassword == null ? null : studentpassword.trim();
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
    }

    public String getParentsphone() {
        return parentsphone;
    }

    public void setParentsphone(String parentsphone) {
        this.parentsphone = parentsphone == null ? null : parentsphone.trim();
    }

    public String getStudentemail() {
        return studentemail;
    }

    public void setStudentemail(String studentemail) {
        this.studentemail = studentemail == null ? null : studentemail.trim();
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }
}