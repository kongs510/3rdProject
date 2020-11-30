package com.bit.backpackers.product.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class NewProductVo {

	private String productId;
	private String shopCode;
	private String productCode;
	private String optionGroupCode;
	private String optionCode;
	
}
