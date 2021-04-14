package com.clm.controller;

import com.alibaba.fastjson.JSON;
import com.clm.pojo.User;
import com.clm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * date: 2021/3/24 10:52
 * 说明:
 */
@RestController
public class HelloController {
    @Autowired
    UserService service;
    @RequestMapping("/hello")
    public String hello(){
        return  "Hello,World";
    }

    @RequestMapping("/getUserList")
    public String getUserInfo(){
        List<User> userList = service.getUserList();
        String s = JSON.toJSONString(userList);
        return s;
    }
}
