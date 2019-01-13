package com.management.mapper;

import com.management.model.StudentFile;

import java.util.List;
import java.util.Map;

public interface StudentFileMapper {
    int deleteByPrimaryKey(String studentfileid);

    int insert(StudentFile record);

    int insertSelective(StudentFile record);

    StudentFile selectByPrimaryKey(String studentfileid);

    int updateByPrimaryKeySelective(StudentFile record);

    int updateByPrimaryKey(StudentFile record);

    void addStudentFile(StudentFile studentFile);

    List<Map> getStudentFileInfo(String teacherID);

    String getFilePlace(String fileID);

    List<StudentFile> getStudentFileList(String studentID);
}