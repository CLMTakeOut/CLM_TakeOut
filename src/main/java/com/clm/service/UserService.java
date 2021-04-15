package com.clm.service;

import com.clm.pojo.User;

import java.util.List;

public interface UserService {
    // 获取用户信息
    List<User> getUserList();
}
