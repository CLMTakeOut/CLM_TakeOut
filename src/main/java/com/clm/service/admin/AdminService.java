package com.clm.service.admin;

import com.clm.pojo.Admin;

import java.util.List;

public interface AdminService {
    //获取管理员信息
    List<Admin> getAdminList();

    //根据管理员id查找
    Boolean findAdminById(Integer id);

    //根据管理员用户名查找
    Boolean findAdminByName(String name);
}
