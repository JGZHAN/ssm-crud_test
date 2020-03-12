package com.zhan.crud.service;

import java.util.List;

import com.zhan.crud.entity.Employee;

public interface EmployeeService {
	
	public List<Employee> getAllemps();

    int saveEmp(Employee employee);
}
