package com.management.serviceImpl;

import com.management.mapper.ClassMapper;
import com.management.mapper.CompanyMapper;
import com.management.mapper.StudentMapper;
import com.management.mapper.TeacherMapper;
import com.management.model.*;
import com.management.model.Class;
import com.management.service.excelWorkService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.management.controller.excelUtil;

import java.io.InputStream;
import java.util.*;

import static org.apache.poi.hssf.record.ExtendedFormatRecord.CENTER;

@Service
public class excelWorkImpl implements excelWorkService {

    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ClassMapper classMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private CompanyMapper companyMapper;

    //导入学生信息
    public void importStudentInfo(InputStream in, MultipartFile file) throws Exception {
        List<List<Object>> listob = excelUtil.getBankListByExcel(in,file.getOriginalFilename());
        for(int i = 0;i<listob.size();i++){
            List<Object> ob = listob.get(i);
            Student student = new Student();
            student.setStudentid(String.valueOf(ob.get(0)));
            student.setStudentname(String.valueOf(ob.get(1)));
            student.setStudentsex(String.valueOf(ob.get(2)));
            String className = String.valueOf(ob.get(3));
            student.setClassid(classMapper.getClassID(className));
            student.setStudentphone(String.valueOf(ob.get(4)));
            student.setStudentemail(String.valueOf(ob.get(5)));
            student.setParentsphone(String.valueOf(ob.get(6)));
            studentMapper.insertSelective(student);
        }
    }

    //导入班级信息
    public void importClassInfo(InputStream in, MultipartFile file) throws Exception {
        List<List<Object>> listob = excelUtil.getBankListByExcel(in,file.getOriginalFilename());
        for(int i = 0;i<listob.size();i++){
            List<Object> ob = listob.get(i);
            Class classinfo = new Class();
            classinfo.setClassid(String.valueOf(ob.get(0)));
            classinfo.setClassname(String.valueOf(ob.get(1)));
            classinfo.setGrade(String.valueOf(ob.get(2)));
            classMapper.insertSelective(classinfo);
        }
    }

    //导入教师信息
    public void importTeacherInfo(InputStream in, MultipartFile file) throws Exception {
        List<List<Object>> listob = new ArrayList<List<Object>>();
        listob = excelUtil.getBankListByExcel(in,file.getOriginalFilename());
        for(int i = 0;i<listob.size();i++){
            List<Object> ob = listob.get(i);
            Teacher teacher = new Teacher();
            teacher.setTeacherid(String.valueOf(ob.get(0)));
            teacher.setTeachername(String.valueOf(ob.get(1)));
            teacher.setTeachersex(String.valueOf(ob.get(2)));
            teacher.setTeacherphone(String.valueOf(ob.get(3)));
            teacher.setTeacheremail(String.valueOf(ob.get(4)));
            teacherMapper.insertSelective(teacher);
        }
    }

    //导入公司信息
    public void importCompanyInfo(InputStream in, MultipartFile file) throws Exception {
        List<List<Object>> listob = excelUtil.getBankListByExcel(in,file.getOriginalFilename());
        for(int i = 0;i<listob.size();i++){
            List<Object> ob = listob.get(i);
            Company company = new Company();
            company.setCompanyid(String.valueOf(ob.get(0)));
            company.setCompanyname(String.valueOf(ob.get(1)));

            if(String.valueOf(ob.get(2)).equals("校内实训")){
                company.setCompanytype1(1);
                company.setCompanytype2(0);
            }else if(String.valueOf(ob.get(2)).equals("学校合作实训公司")){
                company.setCompanytype1(0);
                company.setCompanytype2(1);
            }
            company.setCompanycity(String.valueOf(ob.get(3)));
            company.setContacts(String.valueOf(ob.get(4)));
            company.setCompanyphone(String.valueOf(ob.get(5)));
            companyMapper.insertSelective(company);
        }
    }

    //导出学生信息
    public XSSFWorkbook exportStudentInfo() throws Exception {
        //根据条件查询数据，把数据装载到一个list中
        List<Student> list = studentMapper.exportStudent();
        List<ExcelBean> excel=new ArrayList();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("学号","studentid",0));
        excel.add(new ExcelBean("姓名","studentname",0));
        excel.add(new ExcelBean("性别","studentsex",0));
        excel.add(new ExcelBean("班级","classid",0));
        excel.add(new ExcelBean("联系方式","studentphone",0));
        excel.add(new ExcelBean("邮箱","studentemail",0));
        excel.add(new ExcelBean("家长联系方式","parentsphone",0));
        excel.add(new ExcelBean("实训去向","direction",0));
        map.put(0, excel);
        String sheetName = "学生信息";
        //调用ExcelUtil的方法
        xssfWorkbook = excelUtil.createExcelFile(Student.class, list, map, sheetName);
        return xssfWorkbook;
    }

    //导出公司学生列表
    public XSSFWorkbook exportCompanyStudent(String companyID) throws Exception {
        //根据条件查询数据，把数据装载到一个list中
        List<Student> list = studentMapper.exportCompanyStudent(companyID);
        List<ExcelBean> excel=new ArrayList();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("学号","studentid",0));
        excel.add(new ExcelBean("姓名","studentname",0));
        excel.add(new ExcelBean("性别","studentsex",0));
        excel.add(new ExcelBean("班级","classid",0));
        excel.add(new ExcelBean("联系方式","studentphone",0));
        excel.add(new ExcelBean("邮箱","studentemail",0));
        excel.add(new ExcelBean("家长联系方式","parentsphone",0));
        map.put(0, excel);
        String sheetName = "学生信息";
        //调用ExcelUtil的方法
        xssfWorkbook = excelUtil.createExcelFile(Student.class, list, map, sheetName);
        return xssfWorkbook;
    }

    //导出教师信息
    public XSSFWorkbook exportTeacherInfo() throws Exception {
        //根据条件查询数据，把数据装载到一个list中
        List<Teacher> list = teacherMapper.findAllTeacher();
        List<ExcelBean> excel=new ArrayList();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("工号","teacherid",0));
        excel.add(new ExcelBean("姓名","teachername",0));
        excel.add(new ExcelBean("性别","teachersex",0));
        excel.add(new ExcelBean("联系方式","teacherphone",0));
        excel.add(new ExcelBean("邮箱","teacheremail",0));
        map.put(0, excel);
        String sheetName = "教师信息";
        //调用ExcelUtil的方法
        xssfWorkbook = excelUtil.createExcelFile(Teacher.class, list, map, sheetName);
        return xssfWorkbook;
    }

    //导出公司信息
    public XSSFWorkbook exportCompanyInfo() throws Exception {
        //根据条件查询数据，把数据装载到一个list中
        List<Company> list = companyMapper.exportCompany();
        for(int i = 0;i<list.size();i++){
            if(list.get(i).getCompanytype1() == 1 && list.get(i).getCompanytype2() == 0){
                list.get(i).setCompanytype("校内实训");
            }else if(list.get(i).getCompanytype1() == 0 && list.get(i).getCompanytype2() == 1){
                list.get(i).setCompanytype("学校合作实训");
            }else {
                list.get(i).setCompanytype("校内实训&&学校合作实训");
            }
        }
        List<ExcelBean> excel=new ArrayList();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("公司编号","companyid",0));
        excel.add(new ExcelBean("公司名称","companyname",0));
        excel.add(new ExcelBean("公司类型","companytype",0));
        excel.add(new ExcelBean("所在城市","companycity",0));
        excel.add(new ExcelBean("联系人","contacts",0));
        excel.add(new ExcelBean("联系方式","companyphone",0));
        map.put(0, excel);
        String sheetName = "公司信息";
        //调用ExcelUtil的方法
        xssfWorkbook = excelUtil.createExcelFile(Company.class, list, map, sheetName);
        return xssfWorkbook;
    }

    public XSSFWorkbook exportClassInfo() throws Exception {
        //根据条件查询数据，把数据装载到一个list中
        List<Class> list = classMapper.findAllClass();
        List<ExcelBean> excel=new ArrayList();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("班级编号","classid",0));
        excel.add(new ExcelBean("班级名称","classname",0));
        map.put(0, excel);
        String sheetName = "班级信息";
        //调用ExcelUtil的方法
        xssfWorkbook = excelUtil.createExcelFile(Class.class, list, map, sheetName);
        return xssfWorkbook;
    }

    public HSSFWorkbook exportDirectionData(String[] header,List<Map> list) {
        // 创建工作空间
        HSSFWorkbook wb = new HSSFWorkbook();
        // 创建表
        HSSFSheet sheet = wb.createSheet("mySheet");
        sheet.setDefaultColumnWidth(20);
        sheet.setDefaultRowHeightInPoints(20);
        // 创建行
        HSSFRow row = sheet.createRow((int) 0);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(CENTER);// 水平居中
        style.setVerticalAlignment(CENTER);// 垂直居中
        // 生成一个字体
        HSSFFont font = wb.createFont();
        font.setFontHeightInPoints((short) 10);
        font.setBold(true);
        font.setFontName("宋体");
        // 把字体 应用到当前样式
        style.setFont(font);
        // 添加表头数据
        for (int i = 0; i < header.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(header[i]);
            cell.setCellStyle(style);
        }
        // 添加单元格数据
        for (int i = 0; i < list.size(); i++) {
            row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(list.get(i).get("total").toString());
            if(list.get(i).get("xiaonei") != null){
                row.createCell(1).setCellValue(list.get(i).get("xiaonei").toString());
            }else {
                row.createCell(1).setCellValue(0);
            }
            if(list.get(i).get("hezuo") != null){
                row.createCell(2).setCellValue(list.get(i).get("hezuo").toString());
            }else {
                row.createCell(2).setCellValue(0);
            }
            if(list.get(i).get("zixing") != null){
                row.createCell(3).setCellValue(list.get(i).get("zixing").toString());
            }else {
                row.createCell(3).setCellValue(0);
            }
        }
        return wb;
    }

    public HSSFWorkbook exportTeacherData(String[] header,List<Map> list) {
        // 创建工作空间
        HSSFWorkbook wb = new HSSFWorkbook();
        // 创建表
        HSSFSheet sheet = wb.createSheet("mySheet");
        sheet.setDefaultColumnWidth(20);
        sheet.setDefaultRowHeightInPoints(20);
        // 创建行
        HSSFRow row = sheet.createRow((int) 0);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(CENTER);// 水平居中
        style.setVerticalAlignment(CENTER);// 垂直居中
        // 生成一个字体
        HSSFFont font = wb.createFont();
        font.setFontHeightInPoints((short) 10);
        font.setBold(true);
        font.setFontName("宋体");
        // 把字体 应用到当前样式
        style.setFont(font);
        // 添加表头数据
        for (int i = 0; i < header.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(header[i]);
            cell.setCellStyle(style);
        }
        // 添加单元格数据
        for (int i = 0; i < list.size(); i++) {
            row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(list.get(i).get("teachername").toString());
            row.createCell(1).setCellValue(list.get(i).get("num").toString());
        }
        return wb;
    }

    public HSSFWorkbook exportCompanyData(String[] header,List<Map> list) {
        // 创建工作空间
        HSSFWorkbook wb = new HSSFWorkbook();
        // 创建表
        HSSFSheet sheet = wb.createSheet("mySheet");
        sheet.setDefaultColumnWidth(20);
        sheet.setDefaultRowHeightInPoints(20);
        // 创建行
        HSSFRow row = sheet.createRow((int) 0);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(CENTER);// 水平居中
        style.setVerticalAlignment(CENTER);// 垂直居中
        // 生成一个字体
        HSSFFont font = wb.createFont();
        font.setFontHeightInPoints((short) 10);
        font.setBold(true);
        font.setFontName("宋体");
        // 把字体 应用到当前样式
        style.setFont(font);
        // 添加表头数据
        for (int i = 0; i < header.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(header[i]);
            cell.setCellStyle(style);
        }
        // 添加单元格数据
        for (int i = 0; i < list.size(); i++) {
            row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(list.get(i).get("companyname").toString());
            row.createCell(1).setCellValue(list.get(i).get("num").toString());
        }
        return wb;
    }

    public HSSFWorkbook exportResultData(String[] header,List<Map> list) {
        // 创建工作空间
        HSSFWorkbook wb = new HSSFWorkbook();
        // 创建表
        HSSFSheet sheet = wb.createSheet("mySheet");
        sheet.setDefaultColumnWidth(20);
        sheet.setDefaultRowHeightInPoints(20);
        // 创建行
        HSSFRow row = sheet.createRow((int) 0);
        // 生成一个样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(CENTER);// 水平居中
        style.setVerticalAlignment(CENTER);// 垂直居中
        // 生成一个字体
        HSSFFont font = wb.createFont();
        font.setFontHeightInPoints((short) 10);
        font.setBold(true);
        font.setFontName("宋体");
        // 把字体 应用到当前样式
        style.setFont(font);
        // 添加表头数据
        for (int i = 0; i < header.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(header[i]);
            cell.setCellStyle(style);
        }
        // 添加单元格数据
        for (int i = 0; i < list.size(); i++) {
            row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(list.get(i).get("studentid").toString());
            row.createCell(1).setCellValue(list.get(i).get("studentName").toString());
            row.createCell(2).setCellValue(list.get(i).get("classid").toString());
            row.createCell(3).setCellValue(list.get(i).get("subject").toString());
            row.createCell(4).setCellValue(list.get(i).get("TrainningResult").toString());
        }
        return wb;
    }
}
