package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author: Administrator
 * @date: 2021/4/14 9:59
 * @description:管理员实体类
 */

@Data
@AllArgsConstructor
public class Admin {
    private Integer adminId;
    private Integer shopId;
    private String adminName;      //管理员用户名
    private String adminPwd;       //管理员密码
}
