package com.bit.backpackers.product.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class NewProductItemVo {
	
	private String productCode;
	private String itemCode;
	private String optionGroupCode;
	private String optionCode;

}
