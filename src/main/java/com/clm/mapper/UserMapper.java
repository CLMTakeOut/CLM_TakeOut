package com.clm.mapper;

import com.clm.pojo.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    // 查找用户
    List<User> getUsers();
}
