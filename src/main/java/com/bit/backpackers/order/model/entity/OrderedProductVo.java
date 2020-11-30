package com.bit.backpackers.order.model.entity;

import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.product.model.entity.ProductVo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderedProductVo extends ProductVo {
	
	private String orderCode;
	private int quantity;
	
}
