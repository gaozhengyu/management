package com.management.serviceImpl;

import com.management.mapper.StudentMapper;
import com.management.model.Student;
import com.management.service.studentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class studentServiceImpl implements studentService {

    @Autowired
    private StudentMapper studentMapper;
    //登录
    public Student login(String studentID, String password) {
        return studentMapper.login(studentID,password);
    }
    //更新学生信息
    public void updateStudentInfo(Student student) {
        studentMapper.updateByPrimaryKeySelective(student);
    }

    public Student selectByPrimaryKey(String sutdentID){
        return studentMapper.selectByPrimaryKey(sutdentID);
    }
    //更新学生去向
    public void updateStudentDirection(Student student) {
        studentMapper.updateStudentDirection(student);
    }
    //获取学生信息
    public Student findStudentInfo(String studentID){
        return studentMapper.selectByPrimaryKey(studentID);
    }
    //获取教师全部学生
    public List<Student> findAllStudent(String teacherID) {
        return studentMapper.findAllStudent(teacherID);
    }
    //获取全部学生信息
    public List<Map> getAllStudent() {
        return studentMapper.getAllStudent();
    }
    //重置密码
    public void resetPassword(String studentID){
        studentMapper.resetPassword(studentID);
    }
    //查询是否存在相同题目
    public int getSameSubject(Student student){
        List list = studentMapper.getSameSubject(student);
        if(list.size() == 0){
            return 0;
        }else {
            return 1;
        }
    }

    public List<Student> findAllCompanyStudent(String companyID){
        return studentMapper.findAllCompanyStudent(companyID);
    }

    public void saveStudent(Student student){
        studentMapper.insertSelective(student);
    }

    public Student checkStudent(String studentID){
        return studentMapper.selectByPrimaryKey(studentID);
    }
    //删除学生信息
    public void deleteStudent(String studentID){
        studentMapper.deleteByPrimaryKey(studentID);
    }
}
