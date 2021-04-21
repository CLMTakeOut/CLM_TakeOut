package com.clm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.clm.pojo.Message;
import com.clm.pojo.User;
import com.clm.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * date: 2021/3/24 10:52
 * 说明:
 */


@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService service;

    @RequestMapping("/hello")
    public String hello() {
        return "Hello,World";
    }

    @RequestMapping("/getUserList")
    public String getUserInfo() {
        List<User> userList = service.getUserList();
        String s = JSON.toJSONString(userList);
        return s;
    }

    @RequestMapping("/findTelephone/{tel}")
    public Boolean findUserByTelephone(@PathVariable("tel") String telephone) {
        Boolean flag = service.findUserByTelephone(telephone);
        if(flag){
            return true;
        }else{
            return false;
        }
    }

    @RequestMapping("/userLogin")
    public String login(@RequestBody JSONObject body) {
        System.out.println(body);
        String tel = (String) body.get("telephone");
        String pwd = (String) body.get("pwd");
        // 登陆
        User user = service.useLogin(tel, pwd);
        String result = JSON.toJSONString(user);
        // 返回数据
        Message message = new Message(200, "登陆成功!", result);
        return JSON.toJSONString(message);
    }
}
