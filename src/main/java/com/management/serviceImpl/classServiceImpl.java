package com.management.serviceImpl;

import com.management.mapper.ClassMapper;
import com.management.model.Class;
import com.management.service.classService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class classServiceImpl implements classService {

    @Autowired
    private ClassMapper classMapper;

    public String getClassName(String classID) {
        return classMapper.getClassName(classID);
    }

    public String getClassID(String className){
        return classMapper.getClassID(className);
    }

    public List<String> getClassList(String grade) {
        return classMapper.getClassList(grade);
    }

    public List<Class> findAllClass(){
        return classMapper.findAllClass();
    }

    public void updateClassInformation(Class classinfo) {
        classMapper.updateByPrimaryKeySelective(classinfo);
    }

    public List<String> getGradeList(){
        return classMapper.getGradeList();
    }
}
