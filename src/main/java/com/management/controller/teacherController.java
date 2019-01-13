package com.management.controller;


import com.management.model.Student;
import com.management.model.Teacher;
import com.management.service.*;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/teacher")
public class teacherController {

    @Autowired
    private teacherService teacherService;
    @Autowired
    private studentService studentService;
    @Autowired
    private studentFileService studentFileService;

    private utils utils = new utils();

    //获取教师信息
    @RequestMapping("/findTeacherInfo")
    public String findTeacherInfo(HttpServletRequest request, Model model){
        String teacherID = request.getParameter("teacherID");
        Teacher teacher = teacherService.findTeacherInfo(teacherID);
        utils utils = new utils();
        String teacherSex = teacher.getTeachersex();
        model.addAttribute("teacher",teacher);
        model.addAttribute("teacherSex",teacherSex);
        return "teacherInfo";
    }

    //教师更改个人信息
    @RequestMapping("/updateTeacherInfo")
    @ResponseBody
    public HashMap updateTeacherInfo(HttpServletRequest request, Model model) throws ParseException {
        String teacherID = request.getParameter("teacherID");
        String teacherName = request.getParameter("teacherName");
        String teacherSex = request.getParameter("teacherSex");
        String teacherEmail = request.getParameter("teacherEmail");
        String teacherPhone = request.getParameter("teacherPhone");
        String endTime = request.getParameter("endTime");
        String teacherPassword = request.getParameter("password");
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        teacher.setTeachername(teacherName);
        if(teacherSex != null){
            teacher.setTeachersex(teacherSex);
        }
        teacher.setEndtime(endTime);
        teacher.setTeacherphone(teacherPhone);
        teacher.setTeacheremail(teacherEmail);
        teacher.setTeacherpassword(teacherPassword);
        teacherService.updateTeacherInfo(teacher);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    //获取教师学生信息
    @RequestMapping("/findAllStudent")
    public String findAllStudent(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        List<Student> studentList =  studentService.findAllStudent(teacherID);
        String studentjson = JSONArray.fromObject(studentList).toString();
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        model.addAttribute("studentjson",studentjson);
        model.addAttribute("teacher",teacher);
        return "teacherStudent";
    }

    //获取教师密码
    @RequestMapping("/getTeacherPassword")
    public String getTeacherPassword(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        Teacher teacher = teacherService.findTeacherInfo(teacherID);
        if(teacher != null){
            model.addAttribute("teacher",teacher);
        }
        return "teacherPassword";
    }

    //获取学生文件列表
    @RequestMapping("getStudentFileInfo")
    public String getStudentFileInfo(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        List<Map> studentFileList = studentFileService.getStudentFileInfo(teacherID);
        String studentFilejson = JSONArray.fromObject(studentFileList).toString();
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        model.addAttribute("teacher",teacher);
        model.addAttribute("studentFilejson",studentFilejson);
        return "teacherFile";
    }

    //获取教师分配学生成绩
    @RequestMapping("/getStudentResult")
    public String getStudentResult(HttpServletRequest request, Model model){
        String teacherID = request.getParameter("teacherID");
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        List<Student> studentList = studentService.findAllStudent(teacherID);
        String studentResultjson = JSONArray.fromObject(studentList).toString();
        model.addAttribute("teacher",teacher);
        model.addAttribute("studentResultjson",studentResultjson);
        return "teacherResult";
    }
}
