package com.bit.backpackers.cart.model.entity;

import java.sql.Timestamp;

import com.bit.backpackers.product.model.entity.ProductVo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class CartProductVo extends ProductVo {

	private int cartId;
	private String memberId;
	private Timestamp cartDate;
	private int cartRemoved;
	private int quantity;

	
	
}
