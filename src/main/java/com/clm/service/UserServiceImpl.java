package com.clm.service;

import com.clm.mapper.UserMapper;
import com.clm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: Administrator
 * @date: 2021/4/14 11:16
 * @description:
 */


@Service
public class UserServiceImpl implements UserService{
    UserMapper mapper;
    @Autowired
    public void setMapper(UserMapper mapper) {
        this.mapper = mapper;
    }

    // 查找用户
    public User findUserByID(Integer uid){
        User user = mapper.findUser(uid);
        return user;
    }

    // 用户登录
    public Boolean userLogin(){
        return null;
    }
}
