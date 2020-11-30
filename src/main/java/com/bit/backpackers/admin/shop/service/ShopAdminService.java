package com.bit.backpackers.admin.shop.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.admin.shop.model.entity.ShopVo;

public interface ShopAdminService {

	void getShopList(Model model) throws SQLException;
	void getShop(Model model, String shopCode) throws SQLException;
	void createShop(ShopVo shop) throws SQLException;
	int updateShop(ShopVo shop) throws SQLException;
	int deleteShop(String shopCode) throws SQLException;
	String getItem(String itemCode) throws SQLException;
	void getShopForm(Model model) throws SQLException;

}
