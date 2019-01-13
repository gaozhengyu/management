package com.management.service;

import com.management.model.Company;

import java.util.List;
import java.util.Map;

public interface companyService {
    //获取全部公司信息
    public List<Map> findAllCompany();
    //查找指定类型的公司
    public List<Company> findCompany(Company company);
    //查找公司信息
    public Company findCompanyInfo(String comanyID);
    //更新公司信息
    public void updateCompanyInfo(Company company);
    //重置密码
    public void resetPassword(String companyID);
    //保存公司信息
    public void saveCompany(Company company);
    //获取授权公司信息
    public List<Map> findAuthorizeCompany();
    //检查重复公司信息
    public Company checkCompany(String companyID);
    //删除公司信息
    public void deleteCompany(String companyID);
}
