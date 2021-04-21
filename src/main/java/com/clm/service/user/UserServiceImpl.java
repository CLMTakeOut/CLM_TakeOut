package com.clm.service.user;

import com.clm.mapper.UserMapper;
import com.clm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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


    @Override
    public Boolean findUserByTelephone(String telephone) {
        User user = userMapper.getUserByTelephone(telephone);
        if (user != null){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public User useLogin(String tel,String pwd) {
        User user = userMapper.getUserByTelephoneAndPwd(tel, pwd);
        if (user != null) {
            return user;
        }else {
            return null;
        }
    }
}
