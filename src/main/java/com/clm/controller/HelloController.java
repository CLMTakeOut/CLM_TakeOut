package com.clm.controller;
import com.alibaba.fastjson.JSON;
import com.clm.pojo.User;
import com.clm.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * date: 2021/3/24 10:52
 * 说明:
 */
@RestController
public class HelloController {
    UserServiceImpl service;
    @Autowired
    public void setService(UserServiceImpl service) {
        this.service = service;
    }

    @RequestMapping("/hello")
    public String hello(){
        return  "Hello,World";
    }

    @RequestMapping("/getUser/{id}")
    public String getUserInfo(@PathVariable Integer id){
        // 调用service方法
        User user = service.findUserByID(id);
        String s = JSON.toJSONString(user);
        return s;
    }
}
