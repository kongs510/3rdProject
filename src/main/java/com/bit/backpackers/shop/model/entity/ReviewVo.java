package com.bit.backpackers.shop.model.entity;

import java.sql.Date;
import java.util.List;

import com.bit.backpackers.model.entity.brandVo;
import com.bit.backpackers.product.model.entity.ProductVo;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ReviewVo {

	private int itemNo;
	private String shopCode,userId;
	private int reviewNo;
	private String reviewContent;
	private Date reviewDate;
	
	
	
	
}
