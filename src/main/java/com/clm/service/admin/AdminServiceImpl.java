package com.clm.service.admin;

import com.clm.mapper.AdminMapper;
import com.clm.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    AdminMapper adminMapper;
    public void setAdminMapper(AdminMapper adminMapper){
        this.adminMapper=adminMapper;
    }

    //获取所有的管理员
    @Override
    public List<Admin> getAdminList() {
        List<Admin> Admins = adminMapper.getAdmins();
        return Admins;
    }

    //根据管理员id查找
    @Override
    public Boolean findAdminById(Integer id) {
        Admin admin = adminMapper.getAdminById(id);
        if (admin != null){
            return true;
        }else {
            return false;
        }
    }


    //根据管理员用户名查找
    public Boolean findAdminByName(String name){
        Admin admin = adminMapper.getAdminByName(name);
        if (admin != null){
            return true;
        }else {
            return false;
        }
    }
}
