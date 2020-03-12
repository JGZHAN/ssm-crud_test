package com.zhan.crud.test;

import static org.junit.Assert.*;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhan.crud.dao.DepartmentMapper;
import com.zhan.crud.dao.EmployeeMapper;
import com.zhan.crud.entity.Department;
import com.zhan.crud.entity.Employee;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class CRUDtest {
	
	@Autowired
	private DepartmentMapper departmentM;
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;
	@Test
	public void test() {
		System.out.println(departmentM);
		/*
		 * departmentM.insert(new Department(null, "开发部")); departmentM.insert(new
		 * Department(null, "测试部"));
		 */
		//employeeMapper.insert(new Employee(null, "张三", "M", "aaa@zhan.com", 1));
		EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 1000; i++) {
			String uuid = UUID.randomUUID().toString().substring(0, 5);
			mapper.insert(new Employee(null, uuid+i, "M", uuid+"@zhan.com", 1));
		}
		System.out.println("批量操作完成");
		
	}

}
