package com.management.controller;

import com.management.model.Class;
import com.management.service.classService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/class")
public class classController {

    @Autowired
    private classService classService;

    @RequestMapping("/getClassName")
    @ResponseBody
    public JSONObject getClassName(HttpServletRequest request) {
        String classID = request.getParameter("classID");
        Map<String,String> map = new HashMap<String, String>();
        map.put("className",classService.getClassName(classID));
        JSONObject jsonObject=JSONObject.fromObject(map);
        return jsonObject;
    }

    @RequestMapping("/updateClassInformation")
    @ResponseBody
    public HashMap updateClassInformation(HttpServletRequest request) {
        String classID = request.getParameter("classID");
        String className = request.getParameter("className");
        Class classinfo = new Class();
        classinfo.setClassid(classID);
        classinfo.setClassname(className);
        classService.updateClassInformation(classinfo);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }


}
