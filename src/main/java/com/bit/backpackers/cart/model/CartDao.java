package com.bit.backpackers.cart.model;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.product.model.entity.ProductVo;

import java.sql.SQLException;

public interface CartDao {
	
	void insertItem(@Param("productCode") String productCode, @Param("optionCode") String optionCode, @Param("userId") String userId) throws SQLException;
	List<CartProductVo> selectCart(String userId) throws SQLException;
	int minusItemQuantity(@Param("productCode") String productCode, @Param("optionCode") String optionCode, @Param("userId") String userId) throws SQLException;
	int removeItem(@Param("productCode") String productCode, @Param("optionCode") String optionCode, @Param("userId") String userId) throws SQLException;

}
