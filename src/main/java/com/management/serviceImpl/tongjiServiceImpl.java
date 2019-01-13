package com.management.serviceImpl;

import com.management.mapper.TongjiMapper;
import com.management.service.tongjiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class tongjiServiceImpl implements tongjiService {

    @Autowired
    private TongjiMapper tongjiMapper;

    public List<Map> getDirectionRenshu(List classList) {

        return tongjiMapper.getDirectionRenshu(classList);
    }

    public List<Map> getCompanyRenshu(List classList){
        return tongjiMapper.getCompanyRenshu(classList);
    }

    public List<Map> getTeacherRenshu(List classList) {
        return tongjiMapper.getTeacherRenshu(classList);
    }

    public List<Map> getResultList(List classList){
        return tongjiMapper.getResultList(classList);
    }

    public List<Map> getResultRenshu(List classList){
        return tongjiMapper.getResultRenshu(classList);
    }
}
