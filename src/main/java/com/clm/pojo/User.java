package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * date: 2021/3/25 8:43
 * 说明:
 */
@Data
@AllArgsConstructor
public class User {
    private Integer id;
    private String userName; // 用户名
    private String userPwd; // 密码
    private String sex; // 性别
    private String telephone; // 电话
    private Float balance; // 余额
    private Float integral; // 积分
    private byte[] portrait; // 头像
}
