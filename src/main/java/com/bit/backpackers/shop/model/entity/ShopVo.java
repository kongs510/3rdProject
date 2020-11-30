package com.bit.backpackers.shop.model.entity;

import java.sql.Date;
import java.util.List;

import com.bit.backpackers.product.model.entity.ProductVo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ShopVo {

	private int shopId;
	private String shopCode, shopTitle, memberId, mainCategoryName, subCategoryName;
	private Date shopDate;
	private String shopContent;
	private int shopPrice;
	private List<ProductVo> productList;

}
