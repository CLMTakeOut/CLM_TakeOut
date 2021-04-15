package com.clm.service;

import com.clm.mapper.UserMapper;
import com.clm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserMapper mapper;
    public void setMapper(UserMapper mapper) {
        this.mapper = mapper;
    }
    @Override
    public List<User> getUserList() {
        List<User> users = mapper.getUsers();
        return users;
    }
}
