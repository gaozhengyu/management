package com.management.mapper;

import com.management.model.Company;
import com.management.model.CompanyFile;

import java.util.List;
import java.util.Map;

public interface CompanyFileMapper {
    int deleteByPrimaryKey(String companyfileid);

    int insert(CompanyFile record);

    int insertSelective(CompanyFile record);

    CompanyFile selectByPrimaryKey(String companyfileid);

    int updateByPrimaryKeySelective(CompanyFile record);

    int updateByPrimaryKey(CompanyFile record);

    //获取公司文件信息
    List<CompanyFile> getCompanyFileInfo(CompanyFile companyFile);

    //上传公司文件
    void addCompanyFile(CompanyFile companyFile);

    //获取文件路径
    String getFilePlace(String companyFileID);
}