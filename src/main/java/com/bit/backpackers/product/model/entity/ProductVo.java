package com.bit.backpackers.product.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ProductVo {

	private String productId, shopCode, productCode;
	private String firstOptionGroupCode, firstOptionGroupName, firstOptionCode, firstOptionName;
	private String secondOptionGroupCode, secondOptionGroupName, secondOptionCode, secondOptionName;
	
}
