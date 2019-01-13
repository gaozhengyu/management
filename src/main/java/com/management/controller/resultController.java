package com.management.controller;

import com.management.service.studentService;
import com.management.model.Student;

import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/result")
public class resultController {

    @Autowired
    private studentService studentService;

    @RequestMapping("/updateStudentResult")
    @ResponseBody
    public String updateStudentResult(HttpServletRequest request, Model model){
        String studentID = request.getParameter("studentID");
        String teacherResult = request.getParameter("teacherResult");
        String companyResult = request.getParameter("companyResult");
        String trainningResult = request.getParameter("trainningResult");
        Student student = new Student();
        student.setStudentid(studentID);
        student.setTeacherresult(Integer.parseInt(teacherResult));
        student.setCompanyresult(Integer.parseInt(companyResult));
        student.setTrainningresult(Integer.parseInt(trainningResult));
        studentService.updateStudentInfo(student);
        Map map = new HashMap();
        map.put("success","true");
        List list = new ArrayList();
        list.add(map);
        String json = JSONArray.fromObject(list).toString();
        return json;
    }
}
