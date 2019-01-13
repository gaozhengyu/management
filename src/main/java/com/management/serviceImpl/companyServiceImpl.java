package com.management.serviceImpl;

import com.management.mapper.CompanyMapper;
import com.management.model.Company;
import com.management.service.companyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class companyServiceImpl implements companyService {

    @Autowired
    private CompanyMapper companyMapper;

    public List<Map> findAllCompany() {
        return companyMapper.findAllCompany();
    }
    //查找指定类型的公司
    public List<Company> findCompany(Company company) {
        return companyMapper.findCompany(company);
    }
    //查找公司信息
    public Company findCompanyInfo(String comanyID) {
        return companyMapper.findCompanyInfo(comanyID);
    }
    //更新公司信息
    public void updateCompanyInfo(Company company) {
        companyMapper.updateCompanyInfo(company);
    }
    //重置密码
    public void resetPassword(String companyID) {
        companyMapper.resetPassword(companyID);
    }

    public void saveCompany(Company company) {
        companyMapper.insertSelective(company);
    }

    public List<Map> findAuthorizeCompany() {
        return companyMapper.findAuthorizeCompany();
    }

    public Company checkCompany(String companyID){
        return companyMapper.selectByPrimaryKey(companyID);
    }
    //删除公司信息
    public void deleteCompany(String companyID){
        companyMapper.deleteByPrimaryKey(companyID);
    }
}
