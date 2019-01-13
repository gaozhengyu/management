package com.management.controller;

import com.management.model.Company;
import com.management.model.CompanyFile;
import com.management.model.Student;
import com.management.model.StudentFile;
import com.management.service.companyFileService;
import com.management.service.studentFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/file")
public class fileController {

    @Autowired
    private studentFileService studentFileService;
    @Autowired
    private companyFileService companyFileService;

    //公司文件上传
    @RequestMapping("/insertCompanyFile")
    @ResponseBody
    public Map<String, Object> insertCompanyFile(MultipartHttpServletRequest request) throws IOException {
        String companyID = request.getParameter("companyID");
        String fileType = request.getParameter("fileType");
        Map<String, Object> json = new HashMap<String, Object>();
        MultiValueMap<String, MultipartFile> map = request.getMultiFileMap();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("text", "plain", Charset.forName("UTF-8")));
        // 获取到文件的列表
        List<MultipartFile> list = map.get("file");
        //文件上传路径信息
        String path = "E:/upload/company";
        //判断文件夹是否创建，没有创建则创建新文件夹
        if(!new File(path).exists()){
            new File(path).mkdirs();
        }
        for (MultipartFile mFile : list) {
            //获取文件名称
            String originalFileName = mFile.getOriginalFilename();
            String UUID = java.util.UUID.randomUUID().toString().replaceAll("-","");
            byte[] bytes = mFile.getBytes();//获取字节数组
            String fileBname = UUID + "." + mFile.getOriginalFilename().substring(mFile.getOriginalFilename().lastIndexOf(".") + 1);
            //上传文件位置
            String filePath = path + File.separator + fileBname;
            FileOutputStream fos = new FileOutputStream(new File(filePath));
            //写出到文件
            fos.write(bytes);
            fos.flush();
            fos.close();
            json.put("url", filePath);
            CompanyFile companyFile = new CompanyFile();
            companyFile.setCompanyfilename(originalFileName);
            companyFile.setCompanyfileplace(filePath);
            Date date = new Date();
            companyFile.setUploadtime(date);
            companyFile.setCompanyid(companyID);
            companyFile.setCompanyfiletype(Integer.parseInt(fileType));
            companyFile.setCompanyfileid(UUID);
            companyFileService.addCompanyFile(companyFile);
        }
        return json;
    }

    //学生文件上传
    @RequestMapping("/insertStudentFile")
    @ResponseBody
    public Map<String, Object> insertStudentFile(MultipartHttpServletRequest request) throws IOException {
        String studentID = request.getParameter("studentID");
        String fileType = request.getParameter("fileType");
        Map<String, Object> json = new HashMap<String, Object>();
        MultiValueMap<String, MultipartFile> map = request.getMultiFileMap();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("text", "plain", Charset.forName("UTF-8")));
        // 获取到文件的列表
        List<MultipartFile> list = map.get("file");
        //文件上传路径信息
        String path = "E:/upload/student";
        //判断文件夹是否创建，没有创建则创建新文件夹
        if(!new File(path).exists()){
            new File(path).mkdirs();
        }
        for (MultipartFile mFile : list) {
            //获取文件名称
            String originalFileName = mFile.getOriginalFilename();
            String UUID = java.util.UUID.randomUUID().toString().replaceAll("-","");
            byte[] bytes = mFile.getBytes();//获取字节数组
            String fileBname = UUID + "." + mFile.getOriginalFilename().substring(mFile.getOriginalFilename().lastIndexOf(".") + 1);
            //上传文件位置
            String filePath = path + File.separator + fileBname;
            FileOutputStream fos = new FileOutputStream(new File(filePath)); //写出到文件
            fos.write(bytes);
            fos.flush();
            fos.close();
            json.put("url", filePath);
            StudentFile studentFile = new StudentFile();
            studentFile.setStudentfilename(originalFileName);
            studentFile.setStudentfileplace(filePath);
            Date date = new Date();
            studentFile.setUploadtime(date);
            studentFile.setStudentid(studentID);
            studentFile.setStudentfiletype(Integer.parseInt(fileType));
            studentFile.setStudentfileid(UUID);
            studentFileService.addStudentFile(studentFile);
        }
        return json;
    }

    //文件下载
    @RequestMapping("/downLoadFile")
    public void downLoadFile(HttpServletRequest request, HttpServletResponse response){
        String fileID = request.getParameter("fileID");
        String fileName = request.getParameter("fileName");
        String type = request.getParameter("type");
        String fileUrl = null;
        if(type.equals("student")){
            fileUrl = studentFileService.getFilePlace(fileID);
        }else if(type.equals("company")){
            fileUrl = companyFileService.getFilePlace(fileID);
        }
        InputStream fin = null;
        ServletOutputStream out = null;
        try{
            fin = new FileInputStream(fileUrl);
            out = response.getOutputStream();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/force-download");
            response.addHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes("UTF-8"),"ISO8859-1"));

            byte[] buffer = new byte[1024];
            int bytesToRead = -1;
            // 通过循环将读入的Word文件的内容输出到浏览器中
            while((bytesToRead = fin.read(buffer)) != -1) {
                out.write(buffer, 0, bytesToRead);
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e);
        }finally {
            try {
                if(fin != null)
                    fin.close();
                if(out != null)
                    out.close();
            }catch (Exception e1){
                e1.printStackTrace();
            }

        }
    }

    //文件删除
    @RequestMapping("/deleteFile")
    @ResponseBody
    public HashMap deleteFile(HttpServletRequest request){
        String fileID = request.getParameter("fileID");
        String type = request.getParameter("type");
        boolean result = false;
        HashMap map = new HashMap();
        if(type.equals("student")){
            result = studentFileService.deleteFile(fileID);
        }else {
            result = companyFileService.deleteFile(fileID);
        }
        map.put("success",result);
        return map;
    }
}
