package com.management.mapper;

import com.management.model.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentMapper {
    int deleteByPrimaryKey(String studentid);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String studentid);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
	
	//学生登录并获取信息
    Student login(@Param("studentID") String studentID, @Param("password") String password);
    //获取学生去向
    int findDirection(String studentID);
    //更新学生去向
    void updateStudentDirection(Student student);
    //获取教师全部学生
    List<Student> findAllStudent(String teacherID);
    //获取全部学生信息
    List<Map> getAllStudent();
    //重置密码
    void resetPassword(String studentID);
    //查询是否存在相同题目
    List<Map> getSameSubject(Student student);
    //获取公司全部学生
    List<Student> findAllCompanyStudent(String companyID);
    //导出学生
    List<Student> exportStudent();

    List<Student> exportCompanyStudent(String companyID);
}