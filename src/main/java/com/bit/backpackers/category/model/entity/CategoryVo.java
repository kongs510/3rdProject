package com.bit.backpackers.category.model.entity;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class CategoryVo {

	private String mainCategoryCode, mainCategoryName;
	private List<String> subCategoryList;
}
