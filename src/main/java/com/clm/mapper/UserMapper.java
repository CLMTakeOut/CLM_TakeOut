package com.clm.mapper;

import com.clm.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface UserMapper {
    // 获取用户列表
    List<User> getUsers();

    // 根据用户id查找一个用户
    User getUserById(Integer id);

    // 根据用户手机号查找用户
    User getUserByTelephone(String telephone);

    // 匹配手机号和密码正确的用户
    HashMap<String,Object> getUserByTelephoneAndPwd(@Param("telephone")String telephone, @Param("pwd")String pwd);

    // 添加用户
    Boolean insertUser(User user);
}
