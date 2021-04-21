package com.clm.service;

import com.clm.pojo.User;

import java.util.List;

public interface UserService {
    // 获取用户信息
    List<User> getUserList();

    // 根据用户手机号查找
    Boolean findUserByTelephone(String telephone);
    // 用户登陆
    User useLogin(String tel,String pwd);
}
