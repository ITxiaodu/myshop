package com.du.myshop.service;

import com.du.myshop.entity.OrderDetail;

import java.util.List;

public interface OrderDetailService {
    int deleteByPrimaryKey(Integer id);
    int insert(OrderDetail record);
    int deleteByOrderId(Integer id);
    OrderDetail selectByPrimaryKey(Integer id);
    List<OrderDetail> selectAll();

    int updateByPrimaryKey(OrderDetail record);

}
