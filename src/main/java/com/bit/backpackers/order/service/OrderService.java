package com.bit.backpackers.order.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.entity.OrderVo;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.product.model.entity.ProductVo;

public interface OrderService {
	
	String orderThisNow(OrderedProductVo product, MemberVo user) throws SQLException;
	String orderCart(List<CartProductVo> cart, MemberVo user) throws SQLException;
	void getOrderDetail(Model model, MemberVo user) throws SQLException;
	List<? extends ProductVo> getOrderDetailByOrderCode(Model model, String orderCode) throws SQLException;
	int changeOrderStatus(OrderVo order, OrderStatus status) throws SQLException;

}
