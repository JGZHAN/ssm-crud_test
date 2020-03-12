package com.zhan.crud.controller;

import com.zhan.crud.entity.Department;
import com.zhan.crud.entity.Mgs;
import com.zhan.crud.service.DeptatmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**获取部门信息的control
 * @author 23923 jgZHAN
 * @create 2020-03-10 2:03
 */
@Controller
public class DeptatmentController {

    @Autowired
    private DeptatmentService deptatmentService;

    @RequestMapping("/getdept")
    @ResponseBody
    public Mgs getDpet(){
        List<Department> list=deptatmentService.getDept();
        return Mgs.sussess().add("dept",list);
    }
}
