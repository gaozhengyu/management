package com.management.controller;

import com.management.service.excelWorkService;
import com.management.service.tongjiService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/excelWork")
public class ExcelWorkController {

    @Autowired
    private excelWorkService excelWorkService;
    @Autowired
    private tongjiService tongjiService;

    @RequestMapping("/excelImport")
    @ResponseBody
    public String excelImport(HttpServletRequest request) throws Exception{
        String type = request.getParameter("type");
        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
        MultipartFile file = multipart.getFile("excelFile");
        InputStream in = file.getInputStream();
        //数据导入
        if(type.equals("student")){
            excelWorkService.importStudentInfo(in,file);
        }else if(type.equals("teacher")){
            excelWorkService.importTeacherInfo(in,file);
        }else if(type.equals("classinfo")){
            excelWorkService.importClassInfo(in,file);
        }else {
            excelWorkService.importCompanyInfo(in,file);
        }
        in.close();
        return "success";
    }

    @RequestMapping("/downloadMuban")
    public String downloadMuban(HttpServletRequest request,HttpServletResponse response) {
        String type = request.getParameter("type");
        System.out.println("控制台输出：走入下载");
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        String fileName = type + "Information.xlsx";
        response.setHeader("Content-Disposition", "attachment;fileName="+ fileName);
        try {
            String execlPath = request.getSession().getServletContext().getRealPath("/Excel"+"/"+fileName);
//            System.out.println(execlPath);
//            String path="E:\\upload/muban";
//            System.out.println(path+ File.separator + fileName);
            InputStream inputStream = new FileInputStream(new File(execlPath));
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b,0,length);
            }
            // 关闭os
            os.close();
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //  返回值要注意，要不然就出现下面这句错误！
        //java+getOutputStream() has already been called for this response
        return null;
    }

    @RequestMapping("/excelExport")
    public void export(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String type = request.getParameter("type");
        XSSFWorkbook workbook=null;
        String fileName;
        //导出Excel对象
        if(type.equals("student")){
            workbook = excelWorkService.exportStudentInfo();
            fileName = "studentinformation";
        }else if(type.equals("teacher")){
            workbook = excelWorkService.exportTeacherInfo();
            fileName = "teacherinformation";
        }else if(type.equals("company")){
            workbook = excelWorkService.exportCompanyInfo();
            fileName = "companyinformation";
        }else {
            workbook = excelWorkService.exportClassInfo();
            fileName = "classinformation";
        }
        response.reset(); //清除buffer缓存
        // 指定下载的文件名
        response.setHeader("Content-Disposition", "attachment;filename="+fileName+".xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/exportDirection")
    public void exportDirection(HttpServletRequest request, HttpServletResponse response) {
        List classList = Arrays.asList(request.getParameter("classList"));
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=DirectionInformation.xls");
        OutputStream ouputStream = null;
        List<Map> listMap = tongjiService.getDirectionRenshu(classList);
        String[] header = {"总人数","校内实训","学校合作实训","自行联系"};
        HSSFWorkbook wb = excelWorkService.exportDirectionData(header,listMap);
        try {
            ouputStream = response.getOutputStream();
            wb.write(ouputStream);
        } catch (Exception e) {
            throw new RuntimeException("系统异常");
        } finally {
            try {
                ouputStream.flush();
                ouputStream.close();
            } catch (Exception e) {
                throw new RuntimeException("系统异常");
            }
        }
    }

    @RequestMapping("/exportTeacher")
    public void exportTeacher(HttpServletRequest request, HttpServletResponse response) {
        List classList = Arrays.asList(request.getParameter("classList"));
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=TeacherInformation.xls");
        OutputStream ouputStream = null;
        List<Map> listMap = tongjiService.getTeacherRenshu(classList);
        String[] header = {"教师姓名","分配学生人数"};
        HSSFWorkbook wb = excelWorkService.exportTeacherData(header,listMap);
        try {
            ouputStream = response.getOutputStream();
            wb.write(ouputStream);
        } catch (Exception e) {
            throw new RuntimeException("系统异常");
        } finally {
            try {
                ouputStream.flush();
                ouputStream.close();
            } catch (Exception e) {
                throw new RuntimeException("系统异常");
            }
        }
    }

    @RequestMapping("/exportCompany")
    public void exportCompany(HttpServletRequest request, HttpServletResponse response) {
        List classList = Arrays.asList(request.getParameter("classList"));
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=CompanyInformation.xls");
        OutputStream ouputStream = null;
        List<Map> listMap = tongjiService.getCompanyRenshu(classList);
        String[] header = {"公司名称","选报学生人数"};
        HSSFWorkbook wb = excelWorkService.exportCompanyData(header,listMap);
        try {
            ouputStream = response.getOutputStream();
            wb.write(ouputStream);
        } catch (Exception e) {
            throw new RuntimeException("系统异常");
        } finally {
            try {
                ouputStream.flush();
                ouputStream.close();
            } catch (Exception e) {
                throw new RuntimeException("系统异常");
            }
        }
    }

    @RequestMapping("/exportResult")
    public void exportResult(HttpServletRequest request, HttpServletResponse response) {
        List classList = Arrays.asList(request.getParameter("classList"));
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=ResultInformation.xls");
        OutputStream ouputStream = null;
        List<Map> listMap = tongjiService.getResultList(classList);
        String[] header = {"学号","姓名","班级","实训题目","成绩"};
        HSSFWorkbook wb = excelWorkService.exportResultData(header,listMap);
        try {
            ouputStream = response.getOutputStream();
            wb.write(ouputStream);
        } catch (Exception e) {
            throw new RuntimeException("系统异常");
        } finally {
            try {
                ouputStream.flush();
                ouputStream.close();
            } catch (Exception e) {
                throw new RuntimeException("系统异常");
            }
        }
    }

    @RequestMapping("/exportCompanyStudent")
    public void exportCompanyStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String companyID = request.getParameter("companyID");
        XSSFWorkbook workbook=null;
        String fileName;
        //导出Excel对象
        workbook = excelWorkService.exportCompanyStudent(companyID);
        fileName = "StudentInformation";
        response.reset(); //清除buffer缓存
        // 指定下载的文件名
        response.setHeader("Content-Disposition", "attachment;filename="+fileName+".xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
