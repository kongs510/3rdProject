package com.bit.backpackers.item.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class NewItemVo {
	
	private int itemId;
	private String itemCode;
	private String itemName;
	private int itemPrice;
	private String mainCategoryCode;
	private String subCategoryCode;
	private String brandCode;
	private String firstOptionCode;
	private String secondOptionCode;

}
