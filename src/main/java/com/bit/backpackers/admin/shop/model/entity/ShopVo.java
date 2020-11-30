package com.bit.backpackers.admin.shop.model.entity;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ShopVo {
	
	private int shopId;
	private String shopCode;
	private String shopTitle;
	private String mainCategoryCode;
	private String subCategoryCode;
	private Timestamp shopDate;
	private String shopContent;
	private int shopPrice;
	
}
