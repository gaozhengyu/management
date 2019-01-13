package com.management.service;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface excelWorkService {
    public void importStudentInfo(InputStream in, MultipartFile file) throws Exception;
    public void importTeacherInfo(InputStream in, MultipartFile file) throws Exception;
    public void importClassInfo(InputStream in, MultipartFile file) throws Exception;
    public void importCompanyInfo(InputStream in,MultipartFile file) throws Exception;

    public XSSFWorkbook exportCompanyStudent(String companyID) throws Exception;

    public XSSFWorkbook exportStudentInfo() throws Exception;
    public XSSFWorkbook exportTeacherInfo() throws Exception;
    public XSSFWorkbook exportCompanyInfo() throws Exception;
    public XSSFWorkbook exportClassInfo() throws Exception;

    public HSSFWorkbook exportDirectionData(String[] header,List<Map> list);
    public HSSFWorkbook exportTeacherData(String[] header,List<Map> list);
    public HSSFWorkbook exportCompanyData(String[] header,List<Map> list);
    public HSSFWorkbook exportResultData(String[] header,List<Map> list);
}
