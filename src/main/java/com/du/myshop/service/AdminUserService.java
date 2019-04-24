package com.du.myshop.service;

import com.du.myshop.entity.AdminUser;

public interface AdminUserService {
    AdminUser selectByUser(String ausername,String apassword);
}
