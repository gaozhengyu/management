package com.management.service;

import com.management.model.Student;

import java.util.List;
import java.util.Map;

public interface studentService {
    //登录
    public Student login(String studentID, String password);
    //更新学生个人信息
    public void updateStudentInfo(Student student);
    //获取学生信息
    public Student selectByPrimaryKey(String sutdentID);
    //修改学生去向
    public void updateStudentDirection(Student student);
    //获取学生信息
    public Student findStudentInfo(String studentID);
    //获取教师全部学生信息
    public List<Student> findAllStudent(String teacherID);
    //获取全部学生信息
    public List<Map> getAllStudent();
    //重置密码
    public void resetPassword(String StudentID);
    //查询重复题目
    public int getSameSubject(Student student);
    //获取公司全部学生
    public List<Student> findAllCompanyStudent(String comapnyID);
    //保存学生信息
    public void saveStudent(Student student);
    //检查重复学生信息
    public Student checkStudent(String studentID);
    //删除学生信息
    public void deleteStudent(String studentID);
}
