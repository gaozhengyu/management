package com.management.serviceImpl;

import com.management.mapper.StudentFileMapper;
import com.management.model.StudentFile;
import com.management.service.studentFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;
import java.util.Map;

@Service
public class studentFileServiceImpl implements studentFileService {

    @Autowired
    private StudentFileMapper studentFileMapper;

    public void addStudentFile(StudentFile studentFile) {
        studentFileMapper.addStudentFile(studentFile);
    }

    public List<Map> getStudentFileInfo(String teacherID) {
        return studentFileMapper.getStudentFileInfo(teacherID);
    }

    public String getFilePlace(String fileID) {
        return studentFileMapper.getFilePlace(fileID);
    }

    public List<StudentFile> getStudentFileList(String studentID){
        return studentFileMapper.getStudentFileList(studentID);
    }

    public boolean deleteFile(String fileID) {
        String filePlace = studentFileMapper.getFilePlace(fileID);
        File file = new File(filePlace);
        if(file.exists()){
            if(file.delete()){
                studentFileMapper.deleteByPrimaryKey(fileID);
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
