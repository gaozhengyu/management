package com.management.controller;

import com.management.model.Company;
import com.management.model.Student;
import com.management.model.Teacher;
import com.management.service.classService;
import com.management.service.companyService;
import com.management.service.studentService;
import com.management.service.teacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/userLogin")
public class loginController {

    @Autowired
    private studentService studentService;
    @Autowired
    private classService classService;
    @Autowired
    private teacherService teacherService;
    @Autowired
    private companyService companyService;

    private utils utils = new utils();

    @RequestMapping("/login")
    public String login(HttpServletRequest request,Model model){

        String zhanghao = request.getParameter("zhanghao");
        String password = request.getParameter("password");

        Student student = studentService.findStudentInfo(zhanghao);
        if(student!= null){
            if(password.equals(student.getStudentpassword())) {
                String classID = student.getClassid();
                String className = classService.getClassName(classID);
                model.addAttribute("msg", "登录成功");
                model.addAttribute("student", student);
                model.addAttribute("className", className);
                return "studentInfo";
            }
            else {
                model.addAttribute("massage","密码输入错误");
                return "index";
            }
        }
        else{
            Teacher teacher = teacherService.findTeacherInfo(zhanghao);
            if(teacher != null){
                if(password.equals(teacher.getTeacherpassword())) {
                    if (teacher.getRole() == 1) {
                        model.addAttribute("msg", "登录成功");
                        model.addAttribute("teacher", teacher);
                        return "teacherInfo";
                    } else {
                        model.addAttribute("msg", "登录成功");
                        model.addAttribute("teacher", teacher);
                        return "adminInfo";
                    }
                }
                else {
                    model.addAttribute("massage","密码输入错误");
                    return "index";
                }
            }
            else{
                Company company = companyService.findCompanyInfo(zhanghao);
                if(company != null){
                    if(company.getAuthorize() == 1){
                        if(password.equals(company.getCompanypassword())){
                            model.addAttribute("company",company);
                            return "companyInfo";
                        }
                        else {
                            model.addAttribute("massage","密码输入错误");
                            return "index";
                        }
                    }else{
                        model.addAttribute("massage","无权登录");
                        return "index";
                    }

                }
                else {
                    model.addAttribute("massage", "没有该用户");
                    return "index";
                }
            }
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,Model model){
        request.getSession().invalidate();
        return "index";
    }

}
