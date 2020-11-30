package com.bit.backpackers.order;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.order.model.OrderedProductDao;

//@Component
public class OrderedItem {
	
	@Inject
	SqlSession sqlSession;

}
