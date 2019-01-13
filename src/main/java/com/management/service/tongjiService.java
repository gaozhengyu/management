package com.management.service;

import java.util.List;
import java.util.Map;

public interface tongjiService {
    public List<Map> getDirectionRenshu(List classList);

    public List<Map> getCompanyRenshu(List classList);

    public List<Map> getTeacherRenshu(List classList);

    public List<Map> getResultList(List classList);

    public List<Map> getResultRenshu(List classList);
}
