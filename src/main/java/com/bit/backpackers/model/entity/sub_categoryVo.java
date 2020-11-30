package com.bit.backpackers.model.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor 
@Data
@ToString 
public class sub_categoryVo {

	private int subCategoryId;
	
	private String subCategoryCode,subCategoryName,mainCategoryCode;
	
	
	
}
