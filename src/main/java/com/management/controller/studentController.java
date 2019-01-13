package com.management.controller;

import com.management.model.Student;
import com.management.model.StudentFile;
import com.management.model.Teacher;
import com.management.service.classService;
import com.management.service.studentFileService;
import com.management.service.studentService;
import com.management.service.teacherService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class studentController {

    @Autowired
    private teacherService teacherService;
    @Autowired
    private classService classService;
    @Autowired
    private studentService studentService;
    @Autowired
    private studentFileService studentFileService;

    private utils utils = new utils();

    //获取学生信息
    @RequestMapping("/findStudentInfo")
    public String findStudentInfo(HttpServletRequest request,Model model){
        String studentID = request.getParameter("studentID");

        Student student = studentService.findStudentInfo(studentID);
        if(student!= null){
            String classID = student.getClassid();
            String className = classService.getClassName(classID);
            utils utils = new utils();
            String studentSex = student.getStudentsex();
            model.addAttribute("student",student);
            model.addAttribute("className",className);
            return "studentInfo";
        }
        else{
            return "error";
        }
    }

    //学生更改个人信息
    @RequestMapping("/updateStudentInfo")
    @ResponseBody
    public HashMap updateStudentInfo(HttpServletRequest request,Model model){
        String studentID = request.getParameter("studentID");
        String studentName = request.getParameter("studentName");
        String studentSex = request.getParameter("studentSex");
        String ClassName = request.getParameter("className");
        String studentPhone = request.getParameter("studentPhone");
        String studentEmail = request.getParameter("studentEmail");
        String parentsPhone = request.getParameter("parentsPhone");
        String studentPassword = request.getParameter("password");
        String subject = request.getParameter("subject");
        Student student = new Student();
        student.setClassid(classService.getClassID(ClassName));
        student.setStudentid(studentID);
        student.setStudentname(studentName);
        student.setStudentsex(studentSex);
        student.setStudentphone(studentPhone);
        student.setStudentemail(studentEmail);
        student.setParentsphone(parentsPhone);
        student.setStudentpassword(studentPassword);
        student.setSubject(subject);
        studentService.updateStudentInfo(student);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    //更新去向
    @RequestMapping("/updateStudentDirection")
    @ResponseBody
    public HashMap updateStudentDirection(HttpServletRequest request, Model model){
        String studentID = request.getParameter("studentID");
        String direction = request.getParameter("direction");
        String companyID = request.getParameter("companyID");
        String companyName = request.getParameter("companyName");
        Student student = new Student();
        /**
         * 判断实训公司
         */
        if(companyName == null || companyName == ""){

            student.setCompanyid(companyID);
            student.setCompanyname("");
        }else {
            student.setCompanyid("");
            student.setCompanyname(companyName);
        }
        student.setStudentid(studentID);
        student.setDirection(direction);
        studentService.updateStudentDirection(student);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    //查看学生去向
    @RequestMapping("/findStudentDirection")
    public String findStudentDirection(HttpServletRequest request,Model model){
        String studentID = request.getParameter("studentID");
        Student student = studentService.selectByPrimaryKey(studentID);
        String endTime = teacherService.getDirectionTime();
        model.addAttribute("student",student);
        model.addAttribute("endTime",endTime);
        return "studentDirection";
    }

    //获取学生密码
    @RequestMapping("/getStudentPassword")
    public String getStudentPassword(HttpServletRequest request,Model model){
        String studentID = request.getParameter("studentID");
        Student student = studentService.findStudentInfo(studentID);
        if(student != null){
            model.addAttribute("student",student);
        }
        return "studentPassword";
    }

    //分配学生
    @RequestMapping("/findAllStudent")
    @ResponseBody
    public List<Map> findAllStudent(HttpServletRequest request){
        String teacherID = request.getParameter("teacherID");
        List<Map> studentList = studentService.getAllStudent();
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        String studentjson = JSONArray.fromObject(studentList).toString();
        return studentList;
    }

    //获取学生实训题目
    @RequestMapping("/getStudentSubject")
    public String getStudentSubject(HttpServletRequest request,Model model){
        String studentID = request.getParameter("studentID");
        Student student = studentService.findStudentInfo(studentID);
        model.addAttribute("student",student);
        return "studentSubject";
    }

    //查询是否有重复数据
    @RequestMapping("/getSameSubject")
    @ResponseBody
    public HashMap getSameSubject(HttpServletRequest request){
        String studentID = request.getParameter("studentID");
        String subject = request.getParameter("subject");
        Student student = new Student();
        student.setStudentid(studentID);
        student.setSubject(subject);
        HashMap map = new HashMap();
        if(studentService.getSameSubject(student) == 0){
            map.put("isNull","null");
            return map;
        }
        else {
            map.put("isNull","notNull");
            return map;
        }
    }

    //获取学生上传文件信息
    @RequestMapping("/getStudentFileInfo")
    public String getStudentFileInfo(HttpServletRequest request,Model model){
        String studentID = request.getParameter("studentID");
        Student student = new Student();
        List<StudentFile> studentFileList = studentFileService.getStudentFileList(studentID);
        String studentFilejson = JSONArray.fromObject(studentFileList).toString();
        student.setStudentid(studentID);
        model.addAttribute("studentFilejson",studentFilejson);
        model.addAttribute("student",student);
        return "studentFile";
    }

    //获取学生信息
    @RequestMapping("/findStudentResult")
    public String findStudentResult(HttpServletRequest request,Model model){
        String studentID = request.getParameter("studentID");

        Student student = studentService.findStudentInfo(studentID);
        if(student!= null){
            String classID = student.getClassid();
            model.addAttribute("student",student);
            return "studentResult";
        }
        else{
            return "error";
        }
    }
}
