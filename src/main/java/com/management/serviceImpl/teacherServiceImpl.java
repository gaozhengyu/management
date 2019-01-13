package com.management.serviceImpl;

import com.management.mapper.TeacherMapper;
import com.management.model.Teacher;
import com.management.service.teacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class teacherServiceImpl implements teacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    public List<Teacher> findAllTeacher() {
        return teacherMapper.findAllTeacher();
    }

    public Teacher findTeacherInfo(String teacherID) {
        return teacherMapper.findTeacherInfo(teacherID);
    }
    //更新教师信息
    public void updateTeacherInfo(Teacher teacher) {
        teacherMapper.updateByPrimaryKeySelective(teacher);
    }
    //重置密码
    public void resetPassword(String teacherID) {
        teacherMapper.resetPassword(teacherID);
    }

    public String getDirectionTime(){
        return teacherMapper.getDirectionTime();
    }

    public void saveTeacher(Teacher teacher) {
        teacherMapper.insertSelective(teacher);
    }

    public void updateTeacher(Teacher teacher){
        teacherMapper.updateByPrimaryKeySelective(teacher);
    }

    public List<Teacher> getAllTeacher() {
        return teacherMapper.getAllTeacher();
    }

    public Teacher checkTeacher(String teacherID){
        return teacherMapper.selectByPrimaryKey(teacherID);
    }

    public void deleteTeacher(String teacherID){
        teacherMapper.deleteByPrimaryKey(teacherID);
    }
}
