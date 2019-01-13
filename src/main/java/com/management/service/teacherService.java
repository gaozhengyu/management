package com.management.service;

import com.management.model.Teacher;

import java.util.List;

public interface teacherService {
    //获取全部教师信息
    public List<Teacher> findAllTeacher();
    //获取教师信息
    public Teacher findTeacherInfo(String teacherID);
    //更新教师个人信息
    public void updateTeacherInfo(Teacher teacher);
    //重置密码
    public void resetPassword(String teacherID);
    //获取去向更新时间
    public String getDirectionTime();

    public void saveTeacher(Teacher teacher);
    public void updateTeacher(Teacher teacher);

    public List<Teacher> getAllTeacher();
    //检查教师信息
    public Teacher checkTeacher(String teacherID);
    //删除教师信息
    public void deleteTeacher(String teacherID);
}
