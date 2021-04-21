package com.clm.mapper;

import com.clm.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {

    //获取管理员列表
    List<Admin> getAdmins();

    //根据管理员id查找管理员
    Admin getAdminById(Integer adminId);

    //根据管理员用户名查找
    Admin getAdminByName(String adminName);

    //管理员登录（匹配用户名、密码输入正确）
    Admin getAdminByIdAndName(@Param(Integer ))
}
