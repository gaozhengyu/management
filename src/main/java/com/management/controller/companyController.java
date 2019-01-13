package com.management.controller;

import com.management.model.Company;
import com.management.model.CompanyFile;
import com.management.model.Student;
import com.management.service.companyFileService;
import com.management.service.companyService;
import com.management.service.studentService;
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
@RequestMapping("/company")
public class companyController {

    @Autowired
    private companyService companyService;
    @Autowired
    private companyFileService companyFileService;
    @Autowired
    private studentService studentService;

    //查找指定类型的合作公司
    @RequestMapping("/findCompany")
    @ResponseBody
    public String findCompany(HttpServletRequest request,Model model){
        String direction = request.getParameter("direction");
        Company company = new Company();
        //校内实训公司
        if(direction.equals("0")){
            company.setCompanytype1(1);
        }
        //学校合作公司
        else if(direction.equals("1")){
            company.setCompanytype2(1);
        }
        //自行联系实训公司
        else if (direction.equals("2")){
            return null;
        }
        List<Company> companyList = companyService.findCompany(company);
        String json = JSONArray.fromObject(companyList).toString();
        return json;
    }

    //公司信息
    @RequestMapping("/findCompanyInfo")
    public String findCompanyInfo(HttpServletRequest request,Model model){
        String companyID = request.getParameter("companyID");
        Company company = companyService.findCompanyInfo(companyID);
        model.addAttribute("company",company);
        return "companyInfo";
    }

    //获取授权公司信息
    @RequestMapping("/findAllCompany")
    public String findAllCompany(HttpServletRequest request,Model model){
        String studentID = request.getParameter("studentID");
        Student student = new Student();
        List<Map> companyList = companyService.findAuthorizeCompany();
        String companyjson =JSONArray.fromObject(companyList).toString();
        student.setStudentid(studentID);
        model.addAttribute("companyjson",companyjson);
        model.addAttribute("student",student);
        return "studentCompanyInfo";
    }


    //更新公司信息
    @RequestMapping("/updateCompanyInfo")
    @ResponseBody
    public HashMap updateCompanyInfo(HttpServletRequest request){
        String companyID = request.getParameter("companyID");
        String companyType = request.getParameter("companyType");
        String companyType2 = request.getParameter("companyType2");
        String companyName = request.getParameter("companyName");
        String contacts = request.getParameter("contacts");
        String companyPhone = request.getParameter("companyPhone");
        String password = request.getParameter("password");
        String companyCity = request.getParameter("companyCity");
        String isAuthorize = request.getParameter("isAuthorize");
        Company company = new Company();
        company.setCompanyid(companyID);
        company.setCompanyname(companyName);
        if(companyType != null && companyType != "") {
            if(Integer.parseInt(companyType) == 0){
                company.setCompanytype1(1);
                company.setCompanytype2(0);
            }else if(Integer.parseInt(companyType) == 1){
                company.setCompanytype1(0);
                company.setCompanytype2(1);
            }else {
                company.setCompanytype1(1);
                company.setCompanytype2(1);
            }
        }
        if(companyType2 != null && companyType2 != "") {
            if (companyType2.indexOf("校内") != -1 && companyType2.indexOf("合作") == -1) {
                company.setCompanytype1(1);
                company.setCompanytype2(0);
            }else if (companyType2.indexOf("校内") == -1 && companyType2.indexOf("合作") != -1) {
                company.setCompanytype1(0);
                company.setCompanytype2(1);
            }else {
                company.setCompanytype1(1);
                company.setCompanytype2(1);
            }
        }
        company.setContacts(contacts);
        company.setCompanycity(companyCity);
        company.setCompanyphone(companyPhone);
        company.setCompanypassword(password);
        if(isAuthorize != null && isAuthorize != "") {
            company.setAuthorize(Integer.parseInt(isAuthorize));
        }
        companyService.updateCompanyInfo(company);
        HashMap map = new HashMap();
        map.put("success",true);
        return map;
    }

    //获取公司密码信息
    @RequestMapping("/getCompanyPassword")
    public String getCompanyPassword(HttpServletRequest request,Model model){
        String companyID = request.getParameter("companyID");
        Company company = companyService.findCompanyInfo(companyID);
        if(company != null){
            model.addAttribute("company",company);
        }
        return "companyPassword";
    }

    //获取公司文件信息
    @RequestMapping("/getCompanyFileInfo")
    public String getStudentFileInfo(HttpServletRequest request,Model model){
        String companyID = request.getParameter("companyID");
        String companyFileType = request.getParameter("type");
        CompanyFile companyFile = new CompanyFile();
        companyFile.setCompanyfiletype(Integer.parseInt(companyFileType));
        companyFile.setCompanyid(companyID);
        List<CompanyFile> companyFileList = companyFileService.getCompanyFileInfo(companyFile);
        String companyfilejson = JSONArray.fromObject(companyFileList).toString();
        Company company = new Company();
        company.setCompanyid(companyID);
        model.addAttribute("company",company);
        model.addAttribute("companyfilejson",companyfilejson);
        return "companyFile"+Integer.parseInt(companyFileType);
    }

    //获取公司学生信息
    @RequestMapping("/findAllCompanyStudent")
    public String findAllCompanyStudent(HttpServletRequest request,Model model){
        String companyID = request.getParameter("companyID");
        List<Student> studentList = studentService.findAllCompanyStudent(companyID);
        String studentjson = JSONArray.fromObject(studentList).toString();
        Company company = new Company();
        company.setCompanyid(companyID);
        model.addAttribute("studentjson",studentjson);
        model.addAttribute("company",company);
        return "companyStudent";
    }

    //获取公司学生信息
    @RequestMapping("/findAllCompanyResult")
    public String findAllCompanyResult(HttpServletRequest request,Model model){
        String companyID = request.getParameter("companyID");
        List<Student> studentList = studentService.findAllCompanyStudent(companyID);
        String studentResultjson = JSONArray.fromObject(studentList).toString();
        Company company = new Company();
        company.setCompanyid(companyID);
        model.addAttribute("studentResultjson",studentResultjson);
        model.addAttribute("company",company);
        return "companyResult";
    }
}
