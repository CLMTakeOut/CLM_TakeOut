package com.clm.controller;

import com.alibaba.fastjson.JSON;
import com.clm.pojo.Admin;
import com.clm.pojo.Message;
import com.clm.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * date: 2021/4/21 11:15
 * 说明:
 * Author:LFF
 */

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    //获取所有管理员列表
    @RequestMapping("/getAdminList")
    public String getAdminInfo(){
        List<Admin> adminList = adminService.getAdminList();
        String s = JSON.toJSONString(adminList);
        return s;
    }

    //根据id查找
    @RequestMapping("/findAdminById/{id}")
    public Boolean findAdminById(@PathVariable("id") Integer id){
        Boolean flag = adminService.findAdminById(id);
        if (flag){
            return true;
        }else {
            return false;
        }
    }

    //根据用户名查找
    @RequestMapping("/findAdminByName/{name}")
    public Boolean finaAdminByName(@PathVariable("name") String name){
        Boolean flag = adminService.findAdminByName(name);
        if (flag){
            return true;
        }else {
            return false;
        }
    }
}
