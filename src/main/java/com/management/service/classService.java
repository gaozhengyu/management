package com.management.service;

import com.management.model.Class;

import java.util.List;

public interface classService {
    String getClassName(String classID);
    String getClassID(String className);
    List<String> getClassList(String grade);
    List<Class> findAllClass();
    void updateClassInformation(Class classinfo);
    List<String> getGradeList();
}
