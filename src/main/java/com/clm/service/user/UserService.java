package com.clm.service.user;

import com.clm.pojo.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UserService {
    // 获取用户信息
    List<User> getUserList();

    // 根据用户手机号查找
    Boolean findUserByTelephone(String telephone);
    // 用户登陆
    HashMap<String,Object> useLogin(String tel, String pwd);
    // 用户注册
    Boolean userRegister(User user);
}
