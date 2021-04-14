package com.clm.service;

import com.clm.pojo.User;

/**
 * @author: Administrator
 * @date: 2021/4/14 11:34
 * @description:
 */
public interface UserService {
    User findUserByID(Integer uid);
}
