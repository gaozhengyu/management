package com.management.mapper;

import com.management.model.Teacher;

import java.util.List;

public interface TeacherMapper {
    int deleteByPrimaryKey(String teacherid);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(String teacherid);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
	
	 //获取全部教师信息
    List<Teacher> findAllTeacher();
    //获取教师信息
    Teacher findTeacherInfo(String teacherID);
    //重置密码
    void resetPassword(String teacherID);

    String getDirectionTime();

    List<Teacher> getAllTeacher();

}