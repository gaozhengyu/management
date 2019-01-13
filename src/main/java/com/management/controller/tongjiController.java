package com.management.controller;

import com.management.service.classService;
import com.management.service.tongjiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/tongji")
public class tongjiController {

    @Autowired
    private tongjiService tongjiService;
    @Autowired
    private classService classService;

    @RequestMapping("/getDirectionRenshu")
    @ResponseBody
    public List<Map> getDirectionRenshu(String[] classList){
        List<String> list = Arrays.asList(classList);
        List<Map> listMap = tongjiService.getDirectionRenshu(list);
        return listMap;
    }

    @RequestMapping("/getCompanyRenshu")
    @ResponseBody
    public List<Map> getCompanyRenshu(String[] classList){
        List<String> list = Arrays.asList(classList);
        List<Map> listMap = tongjiService.getCompanyRenshu(list);
        return listMap;
    }

    @RequestMapping("/getTeacherRenshu")
    @ResponseBody
    public List<Map> getTeacherRenshu(String[] classList){
        List<String> list = Arrays.asList(classList);
        List<Map> listMap = tongjiService.getTeacherRenshu(list);
        return listMap;
    }



    @RequestMapping("/getResultList")
    @ResponseBody
    public List<Map> getResultList(String[] classList){
        List<String> list = Arrays.asList(classList);
        List<Map> listMap = tongjiService.getResultList(list);
        return listMap;
    }

    @RequestMapping("/getResultRenshu")
    @ResponseBody
    public List<Map> getResultRenshu(String[] classList){
        List<String> list = Arrays.asList(classList);
        List<Map> listMap = tongjiService.getResultRenshu(list);
        return listMap;
    }

    @RequestMapping("/getClassList")
    @ResponseBody
    public List<String> getClassList(HttpServletRequest request){
        String grade = request.getParameter("grade");
        List<String> list = classService.getClassList(grade);
        return list;
    }

    @RequestMapping("/getGradeList")
    @ResponseBody
    public List<String> getGradeList(HttpServletRequest request){

        List<String> list = classService.getGradeList();
        return list;
    }
}
