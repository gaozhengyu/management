package com.management.controller;

import com.management.model.Class;
import com.management.model.Company;
import com.management.model.Student;
import com.management.model.Teacher;
import com.management.service.companyService;
import com.management.service.studentService;
import com.management.service.teacherService;
import com.management.service.classService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class adminController {

    @Autowired
    private teacherService teacherService;
    @Autowired
    private studentService studentService;
    @Autowired
    private companyService companyService;
    @Autowired
    private classService classService;

    @RequestMapping("/findAdminInfo")
    public String findAdminInfo(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        Teacher teacher = teacherService.findTeacherInfo(teacherID);
        utils utils = new utils();
        String teacherSex = teacher.getTeachersex();
        model.addAttribute("teacher",teacher);
        model.addAttribute("teacherSex",teacherSex);
        return "adminInfo";
    }

    //指导教师信息管理
    @RequestMapping("/findAllTeacherInfo")
    public String findAllTeacherInfo(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        String type = request.getParameter("type");
        Teacher teacher = new Teacher();
        List<Teacher> teacherList = new ArrayList<Teacher>();
        //list转换为json
        teacherList = teacherService.findAllTeacher();
        String teacherjson = JSONArray.fromObject(teacherList).toString();
        teacher.setTeacherid(teacherID);
        model.addAttribute("teacherjson",teacherjson);
        model.addAttribute("teacher",teacher);
        if(Integer.parseInt(type) == 1){
            return "adminTeacher1";
        }else {
            return "adminTeacher2";
        }
    }

    //学生信息管理
    @RequestMapping("/findAllStudentInfo")
    public String findAllStudentInfo(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        String type = request.getParameter("type");
        List<Map> studentList = studentService.getAllStudent();
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        String studentjson = JSONArray.fromObject(studentList).toString();
        model.addAttribute("teacher",teacher);
        model.addAttribute("studentjson",studentjson);
        if(Integer.parseInt(type) == 1) {
            return "adminStudent1";
        }else if(Integer.parseInt(type) == 2){
            return "adminStudent2";
        }else {
            return "shixun1";
        }
    }

    //公司信息管理
    @RequestMapping("/findAllCompanyInfo")
    public String findAllCompanyInfo(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        String type = request.getParameter("type");
        List<Map> companyList = companyService.findAllCompany();
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        String companyjson = JSONArray.fromObject(companyList).toString();
        model.addAttribute("teacher",teacher);
        model.addAttribute("companyjson",companyjson);
        if(Integer.parseInt(type) == 1) {
            return "adminCompany1";
        }else if(Integer.parseInt(type) == 2){
            return "adminCompany2";
        }else {
            return "adminCompany3";
        }
    }

    //获取管理员密码
    @RequestMapping("/getAdminPassword")
    public String getAdminPassword(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        Teacher teacher = teacherService.findTeacherInfo(teacherID);
        if(teacher != null){
            model.addAttribute("teacher",teacher);
        }
        return "adminPassword";
    }

    //重置密码
    @RequestMapping("/resetPassword")
    @ResponseBody
    public HashMap resetPassword(HttpServletRequest request){
        String studentID = request.getParameter("studentID");
        String teacherID = request.getParameter("teacherID");
        String companyID = request.getParameter("companyID");

        if (studentID != null) {
            studentService.resetPassword(studentID);
        }else if(teacherID != null){
            teacherService.resetPassword(teacherID);
        }else if(companyID != null){
            companyService.resetPassword(companyID);
        }
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    //分配教师
    @RequestMapping("/setTeacher")
    @ResponseBody
    public HashMap setTeacher(String[] studentList,String teacherID){
        List<String> list = Arrays.asList(studentList);
        for(String studentID : list){
            Student student = new Student();
            student.setStudentid(studentID);
            student.setTeacherid(teacherID);
            studentService.updateStudentInfo(student);
        }
        HashMap map = new HashMap();
        map.put("msg","success");
        return map;
    }

    //统计
    @RequestMapping("/tongji")
    public String tongji(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        model.addAttribute("teacher",teacher);
        return "tongji";
    }

    //分配教师列表
    @RequestMapping("/getAllTeacher")
    @ResponseBody
    public List<Teacher> getAllTeacher(HttpServletRequest request) {
        List<Teacher> teacherList = new ArrayList<Teacher>();
        //list转换为json
        teacherList = teacherService.getAllTeacher();
        String teacherjson = JSONArray.fromObject(teacherList).toString();
        return teacherList;
    }

    //设定结束时间
    @RequestMapping("/setEndTime")
    public String setEndTime(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        Teacher teacher = teacherService.findTeacherInfo(teacherID);
        model.addAttribute("teacher",teacher);
        return "setTime";
    }

    //班级管理
    @RequestMapping("/findAllClass")
    public String findAllClass(HttpServletRequest request,Model model){
        String teacherID = request.getParameter("teacherID");
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        List<Class> classList = classService.findAllClass();
        String classjson = JSONArray.fromObject(classList).toString();
        model.addAttribute("classjson",classjson);
        model.addAttribute("teacher",teacher);
        return "adminClass";
    }

    @RequestMapping("/saveTeacher")
    @ResponseBody
    public HashMap saveTeacher(HttpServletRequest request){
        String teacherID = request.getParameter("teacherID");
        String teacherName = request.getParameter("teacherName");
        String teacherSex = request.getParameter("teacherSex");
        String teacherPhone = request.getParameter("teacherPhone");
        String teacherEmail = request.getParameter("teacherEmail");
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        teacher.setTeachername(teacherName);
        teacher.setTeachersex(teacherSex);
        teacher.setTeacherphone(teacherPhone);
        teacher.setTeacheremail(teacherEmail);
        teacherService.saveTeacher(teacher);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    @RequestMapping("/saveStudent")
    @ResponseBody
    public HashMap saveStudent(HttpServletRequest request){
        String studentID = request.getParameter("studentID");
        String studentName = request.getParameter("studentName");
        String studentSex = request.getParameter("studentSex");
        String classID = request.getParameter("classID");
        String studentPhone = request.getParameter("studentPhone");
        String studentEmail = request.getParameter("studentEmail");
        String parentsPhone = request.getParameter("parentsPhone");
        Student student = new Student();
        student.setStudentid(studentID);
        student.setStudentname(studentName);
        student.setStudentsex(studentSex);
        student.setClassid(classID);
        student.setStudentphone(studentPhone);
        student.setStudentemail(studentEmail);
        student.setParentsphone(parentsPhone);
        studentService.saveStudent(student);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    @RequestMapping("/saveCompany")
    @ResponseBody
    public HashMap saveCompany(HttpServletRequest request){
        String companyID = request.getParameter("companyID");
        String companyName = request.getParameter("companyName");
        String companyCity = request.getParameter("companyCity");
        String companyType = request.getParameter("companyType");
        String contacts = request.getParameter("contacts");
        String companyPhone = request.getParameter("companyPhone");
        Company company = new Company();
        company.setCompanyid(companyID);
        company.setCompanyname(companyName);
        company.setCompanycity(companyCity);
        if(companyType.indexOf("校内")!= -1 && companyType.indexOf("学校合作") == -1){
            company.setCompanytype1(1);
            company.setCompanytype2(0);
        }else if(companyType.indexOf("校内") == -1 && companyType.indexOf("学校合作") != -1){
            company.setCompanytype1(0);
            company.setCompanytype2(1);
        }else {
            company.setCompanytype1(1);
            company.setCompanytype2(1);
        }
        company.setContacts(contacts);
        company.setCompanyphone(companyPhone);
        companyService.saveCompany(company);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    @RequestMapping("/updateTeacher")
    @ResponseBody
    public HashMap updateTeacher(HttpServletRequest request){
        String teacherID = request.getParameter("teacherID");
        String teacherName = request.getParameter("teacherName");
        String teacherSex = request.getParameter("teacherSex");
        String teacherPhone = request.getParameter("teacherPhone");
        String teacherEmail = request.getParameter("teacherEmail");
        String teacherPastword = request.getParameter("pastword");
        Teacher teacher = new Teacher();
        teacher.setTeacherid(teacherID);
        teacher.setTeachername(teacherName);
        teacher.setTeachersex(teacherSex);
        teacher.setTeacherphone(teacherPhone);
        teacher.setTeacheremail(teacherEmail);
        teacher.setTeacherpassword(teacherPastword);
        teacherService.updateTeacher(teacher);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    @RequestMapping("/updateStudent")
    @ResponseBody
    public HashMap updateStudent(HttpServletRequest request){
        String studentID = request.getParameter("studentID");
        String studentName = request.getParameter("studentName");
        String studentSex = request.getParameter("studentSex");
        String classID = request.getParameter("classID");
        String studentPhone = request.getParameter("studentPhone");
        String studentEmail = request.getParameter("studentEmail");
        String parentsPhone = request.getParameter("parentsPhone");
        Student student = new Student();
        student.setStudentid(studentID);
        student.setStudentname(studentName);
        student.setStudentsex(studentSex);
        student.setClassid(classID);
        student.setStudentphone(studentPhone);
        student.setStudentemail(studentEmail);
        student.setStudentphone(parentsPhone);
        studentService.updateStudentInfo(student);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    @RequestMapping("/updateCompany")
    @ResponseBody
    public HashMap updateCompany(HttpServletRequest request){
        String companyID = request.getParameter("companyID");
        String companyName = request.getParameter("companyName");
        String companyCity = request.getParameter("companyCity");
        String companyType = request.getParameter("companyType");
        String contacts = request.getParameter("contacts");
        String companyPhone = request.getParameter("companyPhone");
        Company company = new Company();
        company.setCompanyid(companyID);
        company.setCompanyname(companyName);
        company.setCompanycity(companyCity);
        if(companyType.indexOf("校内")!= -1 && companyType.indexOf("学校合作") == -1){
            company.setCompanytype1(1);
            company.setCompanytype2(0);
        }else if(companyType.indexOf("校内") == -1 && companyType.indexOf("学校合作") != -1){
            company.setCompanytype1(0);
            company.setCompanytype2(1);
        }else {
            company.setCompanytype1(1);
            company.setCompanytype2(1);
        }
        company.setContacts(contacts);
        company.setCompanyphone(companyPhone);
        companyService.updateCompanyInfo(company);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    @RequestMapping("checkInfo")
    @ResponseBody
    public HashMap checkInfo(HttpServletRequest request){
        String type = request.getParameter("type");
        String checkID = request.getParameter("checkID");
        HashMap map = new HashMap();
        if(type.equals("student")){
            Student student = studentService.checkStudent(checkID);
            if(student == null){
                map.put("success",true);
            }else {
                map.put("success",false);
            }
        }else if (type.equals("teacher")){
            Teacher teacher = teacherService.checkTeacher(checkID);
            if(teacher == null){
                map.put("success",true);
            }else {
                map.put("success",false);
            }
        }else if(type.equals("company")){
            Company company = companyService.checkCompany(checkID);
            if(company == null){
                map.put("success",true);
            }else {
                map.put("success",false);
            }
        }
        return map;
    }

    @RequestMapping("deleteInfo")
    @ResponseBody
    public HashMap deleteInfo(HttpServletRequest request){
        String type = request.getParameter("type");
        String deleteID = request.getParameter("deleteID");
        if(type.equals("teacher")){
            teacherService.deleteTeacher(deleteID);
        }else if(type.equals("student")){
            studentService.deleteStudent(deleteID);
        }else if(type.equals("company")){
            companyService.deleteCompany(deleteID);
        }
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }
}
