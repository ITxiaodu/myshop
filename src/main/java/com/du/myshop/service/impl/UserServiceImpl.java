package com.du.myshop.service.impl;

import com.du.myshop.entity.User;
import com.du.myshop.mapper.UserMapper;
import com.du.myshop.service.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public int insert(User record) {
        return userMapper.insert(record);
    }

    @Override
    public User selectByPrimaryKey(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(User record) {
        return userMapper.updateByPrimaryKey(record);
    }

    @Override
    public int count() {
        return userMapper.count();
    }
    //分页
    @Override
    public List<User> selectAll(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<User> users = userMapper.selectAll();
        PageInfo info = new PageInfo(users);
        return info.getList();
    }

    @Override
    public List<User> selectByUsername(String username, int page, int limit) {
        PageHelper.startPage(page,limit);
        List<User> users = userMapper.selectByUsername(username);
        PageInfo info = new PageInfo(users);
        return info.getList();
    }



}
