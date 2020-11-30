package com.bit.backpackers.order.model.entity;

import java.sql.Date;

import com.bit.backpackers.order.OrderStatus;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderVo {

	private String orderCode;
	private String userId;
	private Date orderDate;
	private OrderStatus orderStatus;
	private int orderAmount;
	
}
