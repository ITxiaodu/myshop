package com.du.myshop.service;

import com.du.myshop.entity.User;

import java.util.List;

public interface UserService {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll(int page,int limit);

    int updateByPrimaryKey(User record);

    int count();

    List<User> selectByUsername(String username ,int page,int limit);

    List<User> selectAll();
}
