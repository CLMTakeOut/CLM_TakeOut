package com.clm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.clm.utils.JwtUtil;
import com.clm.utils.ResMessage;
import com.clm.pojo.User;
import com.clm.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * date: 2021/3/24 10:52
 * 说明: 处理关于用户接口的
 */

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService service;

    // 获取用户列表
    @RequestMapping(value = "/getUserList",method = RequestMethod.GET)
    public String getUserInfo(HttpServletRequest request) {
        // 获取header里面的token
        String token = request.getHeader("token");
        boolean verity = JwtUtil.verity(token);  // 验证token
        if (verity){
            List<User> userList = service.getUserList();
            return JSON.toJSONString(userList);
        }
        return "获取失败,没有权限";
    }

    // 根据手机号查找
    @RequestMapping(value = "/findTelephone/{tel}",method = RequestMethod.GET)
    public Boolean findUserByTelephone(@PathVariable("tel") String telephone) {
        return service.findUserByTelephone(telephone);
    }

    // 处理用户登录
    @RequestMapping(value = "/userLogin",method = RequestMethod.POST)
    public String login(@RequestBody JSONObject reqBody) {
        //System.out.println(body);
        String tel = (String) reqBody.get("telephone");
        String pwd = (String) reqBody.get("pwd");
        // 登陆
        HashMap<String,Object> userInfo = service.useLogin(tel, pwd);
        ResMessage message; // 消息体
        JSONObject result = new JSONObject(); // 返回数据
        if (userInfo != null){
            // 生成token
            String token = JwtUtil.sign(tel,pwd);
            result.put("userInfo",userInfo);
            result.put("token",token);
            // 返回数据
            message = new ResMessage(200, "登陆成功!",result);
        }else {
            result.put("isLogin",false);
            // 返回数据
            message = new ResMessage(200, "登录失败!",result);
        }
        return JSON.toJSONString(message);
    }

    // 处理用户注册
    @RequestMapping(value = "/userRegister",method = RequestMethod.POST)
    public String register(@RequestBody JSONObject reqBody){
        // 拿到请求体对象，转换为User对象
        User user = reqBody.toJavaObject(User.class);
        Boolean isRegister = service.userRegister(user);
        ResMessage message; // 消息体
        JSONObject result = new JSONObject(); // 返回的数据
        if (isRegister){
            result.put("isRegister",true);
            message = new ResMessage(200,"注册成功",result);
        }else {
            result.put("isRegister",false);
            message = new ResMessage(200,"注册失败",result);
        }
        return JSON.toJSONString(message);
    }
}
