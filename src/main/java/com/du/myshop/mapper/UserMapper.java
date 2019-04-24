package com.du.myshop.mapper;

import com.du.myshop.entity.User;

import java.util.List;

public interface UserMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

    int count();

    List<User> selectByUsername(String username);
}
