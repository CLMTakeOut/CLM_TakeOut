package com.clm.service.user;

import com.clm.mapper.UserMapper;
import com.clm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserMapper userMapper;
    public void setUserMapperMapper(UserMapper mapper) {
        this.userMapper = mapper;
    }

    @Override
    public List<User> getUserList() {
        List<User> users = userMapper.getUsers();
        return users;
    }

    // 根据手机号查找用户
    @Override
    public Boolean findUserByTelephone(String telephone) {
        User user = userMapper.getUserByTelephone(telephone);
        if (user != null){
            return true;
        }else {
            return false;
        }
    }

    // 用户登录
    @Override
    public HashMap<String,Object> useLogin(String tel,String pwd) {
        HashMap<String,Object> userInfo = userMapper.getUserByTelephoneAndPwd(tel, pwd);
        if (userInfo != null) {
            return userInfo;
        }else {
            return null;
        }
    }

    // 用户注册
    @Override
    public Boolean userRegister(User user) {
        Boolean isInsert = userMapper.insertUser(user);
        System.out.println(isInsert);
        return isInsert;
    }
}
