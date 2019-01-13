package com.management.mapper;

import java.util.List;
import java.util.Map;

public interface TongjiMapper {

    //去向统计
    List<Map> getDirectionRenshu(List classList);

    //公司人数统计
    List<Map> getCompanyRenshu(List classList);

    //教师学生人数统计
    List<Map> getTeacherRenshu(List classList);

    //学生成绩统计
    List<Map> getResultList(List classList);

    //分数段人数统计
    List<Map> getResultRenshu(List classList);
}
