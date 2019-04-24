package com.du.myshop.service.impl;

import com.du.myshop.entity.Goods;
import com.du.myshop.entity.GoodsType;
import com.du.myshop.mapper.GoodsTypeMapper;
import com.du.myshop.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {
    @Autowired
    private GoodsTypeMapper goodsTypeMapper;

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return goodsTypeMapper.deleteByPrimaryKey(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public int insert(GoodsType record) {
        return goodsTypeMapper.insert(record);
    }

    @Override
    public GoodsType selectByPrimaryKey(Integer id) {
        return goodsTypeMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<GoodsType> selectAll() {
        return goodsTypeMapper.selectAll();
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public int updateByPrimaryKey(GoodsType record) {
        return goodsTypeMapper.updateByPrimaryKey(record);
    }

    @Override
    public int count() {
        return goodsTypeMapper.count();
    }
}
