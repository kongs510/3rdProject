package com.bit.backpackers.order.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.order.model.entity.OrderVo;

public interface OrderDao {

	void insertOrder(@Param("orderCode") String orderCode, @Param("userId") String userId) throws SQLException;
	void insertOrderItem(@Param("orderCode") String orderCode, @Param("productCode") String productCode, @Param("optionCode") String optionCode) throws SQLException;
	OrderVo selectOrder(String orderCode) throws SQLException;
	OrderVo selectOrdersFilteredBy(@Param("orderStatus") OrderStatus orderStatus, @Param("userId") String userId) throws SQLException;
	List<OrderedProductVo> selectOrderItem(String orderCode) throws SQLException;
	int updateOrder(OrderVo order);
}
