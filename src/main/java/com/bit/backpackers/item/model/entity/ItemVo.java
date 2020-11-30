package com.bit.backpackers.item.model.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
public @Data class ItemVo {
	
	private int itemId;
	private String itemCode, itemName;
	private int price;
	private String mainCategoryName, subCategoryName, brandName, firstOptionName, secondOptionName;
	private String mainCategoryCode, subCategoryCode, brandCode, firstOptionCode,secondOptionCode;
	
}
