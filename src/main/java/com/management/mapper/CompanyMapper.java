package com.management.mapper;

import com.management.model.Company;

import java.util.List;
import java.util.Map;

public interface CompanyMapper {
    int deleteByPrimaryKey(String companyid);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(String companyid);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);
	
	//查找指定类型的公司
    List<Company> findCompany(Company company);
    //获取全部公司信息
    List<Map> findAllCompany();
    //获取公司信息
    Company findCompanyInfo(String companyID);
    //更新公司信息
    void updateCompanyInfo(Company company);
    //重置密码
    void resetPassword(String companyID);
    //导出公司
    List<Company> exportCompany();
    //获取授权公司信息
    List<Map> findAuthorizeCompany();
}