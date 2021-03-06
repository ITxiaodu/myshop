package com.du.myshop.mapper;

import com.du.myshop.entity.AdminUser;

import java.util.List;

public interface AdminUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AdminUser record);

    AdminUser selectByPrimaryKey(Integer id);

    List<AdminUser> selectAll();

    int updateByPrimaryKey(AdminUser record);

    AdminUser selectByUser(String ausername,String apassword);
}
