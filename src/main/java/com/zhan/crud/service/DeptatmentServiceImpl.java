package com.zhan.crud.service;

import com.zhan.crud.dao.DepartmentMapper;
import com.zhan.crud.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 23923 jgZHAN
 * @create 2020-03-10 2:12
 */
@Service
public class DeptatmentServiceImpl implements DeptatmentService  {

    @Autowired
    DepartmentMapper departmentMapper;
    @Override
    public List<Department> getDept() {
        List<Department> list=departmentMapper.selectByExample(null);
        return list;
    }
}
