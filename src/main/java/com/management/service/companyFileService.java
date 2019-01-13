package com.management.service;

import com.management.model.Company;
import com.management.model.CompanyFile;

import java.util.List;
import java.util.Map;

public interface companyFileService {

    //获取公司文件信息
    public List<CompanyFile> getCompanyFileInfo(CompanyFile companyFile);
    //上传文件
    public void addCompanyFile(CompanyFile companyFile);
    //获取文件路径
    public String getFilePlace(String companyFileID);
    //删除文件
    public boolean deleteFile(String fileID);
}
