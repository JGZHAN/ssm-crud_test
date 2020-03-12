package com.zhan.crud.controller;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.zhan.crud.entity.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:applicationContext-mvc.xml"})
public class EmployeeControllerTest {

	//传入SpringMVC的ioc
	@Autowired
	WebApplicationContext context;
	//虚拟mvc请求
	MockMvc mockMvc;
	
	@Before
	public void init() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		
	}
	//测试时需要将control的@responsebody去掉，加上modle
	@Test
	public void testPage() throws Exception {
		MvcResult mvcResult=mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1"))
				.andReturn();
		MockHttpServletRequest request=mvcResult.getRequest();
		PageInfo pageInfo=(PageInfo) request.getAttribute("page");
		System.out.println(pageInfo.getTotal());
		System.out.println("当前页码："+pageInfo.getPageNum());
        System.out.println("总页码："+pageInfo.getPages());
        System.out.println("总记录数："+pageInfo.getTotal());
        int[] nums = pageInfo.getNavigatepageNums();
        System.out.println("在页面需要连续显示的页码：");
        for(int i:nums){
            System.out.print(i+"、");
        }
        System.out.println();
 
        //获取员工数据
        List<Employee> list = pageInfo.getList();
        for(Employee e:list){
            System.out.println(e.toString());
        }
 

		
	}

}
