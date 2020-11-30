package com.bit.backpackers.cart.service;

import java.sql.SQLException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;

import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.product.model.entity.ProductVo;

public interface CartService {

	void putItemIntoCart(CartProductVo bean, MemberVo user) throws SQLException;
	void getCartByMemberId(Model model, MemberVo user) throws SQLException;
	void removeItemFromCart(ProductVo bean, MemberVo user) throws SQLException;
	List<CartProductVo> getCartForOrder(String jsonCart, MemberVo user) throws SQLException, ParseException;
	void removeItemsFromCart(List<? extends ProductVo> productList, MemberVo user) throws SQLException;
	
}
