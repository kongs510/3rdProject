package com.bit.backpackers.image.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ImageVo {
	
	private String productCode, imageCode, imageURL;
	private int imageOrder;

}
