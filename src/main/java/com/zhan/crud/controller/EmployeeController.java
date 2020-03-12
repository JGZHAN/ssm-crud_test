package com.zhan.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhan.crud.entity.Employee;
import com.zhan.crud.entity.Mgs;
import com.zhan.crud.service.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;

	@RequestMapping(value = "/emp",method = RequestMethod.POST)
	@ResponseBody
	public Mgs saveEmp(Employee employee){
        System.out.println("employee = " + employee);
        int i=employeeService.saveEmp(employee);
        System.out.println(i);
        if (i>0){
            return Mgs.sussess();
        }
        return Mgs.fail();
	}
	@RequestMapping(value="/emps")
	@ResponseBody
	public Mgs getAlljson(@RequestParam(value = "pn",defaultValue = "1")int pn) {
		/*分页查询插件的接口调用*/
		PageHelper.startPage(pn, 10);
		List<Employee> allemps = employeeService.getAllemps();
		PageInfo page=new PageInfo(allemps,5);
		return Mgs.sussess().add("page", page);
	}
	
	
//	@RequestMapping(value="/emps")
	public String getAllemps(@RequestParam(value = "pn",defaultValue = "1")int pn ,Model model) {
		/*分页查询插件的接口调用*/
		PageHelper.startPage(pn, 10);
		List<Employee> allemps = employeeService.getAllemps();
		PageInfo page=new PageInfo(allemps,5);
		model.addAttribute("page", page);
		return "list";
		
	}
}
