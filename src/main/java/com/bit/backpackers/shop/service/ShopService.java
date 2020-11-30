package com.bit.backpackers.shop.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.shop.model.entity.ReviewVo;

public interface ShopService {

	public void getShoplist(Model model) throws SQLException;
	public void getShoplist(Model model, String mainCategoryName) throws SQLException;
	public void getShoplist(Model model, String mainCategoryName, String subCategoryName) throws SQLException;
	public void getShop(Model model, String shopCode, String productCode) throws SQLException;
	void reviewList(Model model, String shopCode) throws SQLException;
	void registReview(ReviewVo review) throws SQLException;
	void deleteReview(int ReviewNo) throws SQLException;
	void updateReview(ReviewVo review) throws SQLException;
	
}
