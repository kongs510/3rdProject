package com.bit.backpackers.category.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface CategoryService {

	public void getCategoryList(Model model) throws SQLException;
	public void checkCategory(String mainCategoryName) throws SQLException;
	public void checkCategory(String mainCategoryName, String subCategoryName) throws SQLException;
	public void getCategoryNow(Model model, String mainCategoryName) throws SQLException;
	public void getCategoryNow(Model model, String mainCategoryName, String subCategoryName) throws SQLException;
	
}
