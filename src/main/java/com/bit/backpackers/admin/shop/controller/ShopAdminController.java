package com.bit.backpackers.admin.shop.controller;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.backpackers.admin.shop.service.ShopAdminService;
import com.bit.backpackers.item.Item;
import com.bit.backpackers.item.model.entity.NewItemVo;

@Controller
@RequestMapping("/admin/shop")
public class ShopAdminController {
	
	@Inject
	ShopAdminService shopAdminService;
	@Inject
	Item itemSupport;

	@RequestMapping("")
	public String listShop(Model model) throws SQLException {
		shopAdminService.getShopList(model);
		return "admin/shop/list";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String formShop(Model model) throws SQLException {
		shopAdminService.getShopForm(model);
		return "admin/shop/detail";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String addShop() {
		return "redirect:./";
	}

	@RequestMapping(value = "/{shopCode}")
	public String shopDetail(Model model, @PathVariable String shopCode) throws SQLException {
		shopAdminService.getShop(model, shopCode);
		return "admin/shop/detail";
	}

	@RequestMapping(value = "/{shopCode}", method = RequestMethod.PUT)
	public String shopEdit() {
		return "redirect:.";
	}
	
	@RequestMapping(value = "/{shopCode}", method = RequestMethod.DELETE)
	public String shopDelete(@PathVariable String shopCode) {
		return "redirect:..";
	}
	
	@RequestMapping(value = "/item", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody List<NewItemVo> listItem(String itemCode) throws SQLException {
		return itemSupport.getItemList();
	}
}
