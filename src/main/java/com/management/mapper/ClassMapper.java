package com.management.mapper;

import com.management.model.Class;

import java.util.List;

public interface ClassMapper {
    int deleteByPrimaryKey(String classid);

    int insert(Class record);

    int insertSelective(Class record);

    Class selectByPrimaryKey(String classid);

    int updateByPrimaryKeySelective(Class record);

    int updateByPrimaryKey(Class record);
	
	String getClassName(String classID);

    String getClassID(String className);

    List<String> getClassList(String grade);

    List<Class> findAllClass();

    List<String> getGradeList();
}