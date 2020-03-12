package com.zhan.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhan.crud.dao.EmployeeMapper;
import com.zhan.crud.entity.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	@Override
	public List<Employee> getAllemps() {
		// TODO Auto-generated method stub
		
		List<Employee> withDept = employeeMapper.selectByExampleWithDept(null);
		return withDept;
	}

	@Override
	public int saveEmp(Employee employee) {
		return employeeMapper.insertSelective(employee);
	}

}
