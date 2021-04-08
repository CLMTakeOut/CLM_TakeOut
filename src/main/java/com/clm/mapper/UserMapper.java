package com.clm.mapper;

import org.springframework.stereotype.Repository;

/**
 * date: 2021年04月08日 11:18
 * 描述:
 * Author: 薛定谔的猫er
 */
@Repository
public interface UserMapper {
    // 增加用户
    boolean insertUser();
    // 删除用户
    boolean deleteUser();
    // 查询用户
    boolean findUser();
}
