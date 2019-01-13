package com.management.service;

import com.management.model.StudentFile;

import java.util.List;
import java.util.Map;

public interface studentFileService {
    //学生上传文件
    public void addStudentFile(StudentFile studentFile);

    //获取教师分配学生文件列表
    public List<Map> getStudentFileInfo(String teacherID);

    //获取下载文件位置
    public String getFilePlace(String fileID);

    //获取学生文件列表
    public List<StudentFile> getStudentFileList(String studentID);

    //删除文件
    public boolean deleteFile(String fileID);
}
