package com.management.serviceImpl;

import com.management.mapper.CompanyFileMapper;
import com.management.model.Company;
import com.management.model.CompanyFile;
import com.management.service.companyFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;
import java.util.Map;

@Service
public class companyFileServiceImpl implements companyFileService {

    @Autowired
    private CompanyFileMapper companyFileMapper;

    public List<CompanyFile> getCompanyFileInfo(CompanyFile companyFile) {
        return companyFileMapper.getCompanyFileInfo(companyFile);
    }

    public void addCompanyFile(CompanyFile companyFile) {
        companyFileMapper.addCompanyFile(companyFile);
    }

    //获取文件路径
    public String getFilePlace(String companyFileID){
        return companyFileMapper.getFilePlace(companyFileID);
    }

    //删除文件
    public boolean deleteFile(String fileID){
        String filePlace = companyFileMapper.getFilePlace(fileID);
        File file = new File(filePlace);
        if(file.exists()){
            if(file.delete()){
                companyFileMapper.deleteByPrimaryKey(fileID);
                return true;
            }else {
                return false;
            }
        }
        else {
            return false;
        }
    }
}
