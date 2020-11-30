package com.bit.backpackers.shop.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.backpackers.category.service.CategoryService;
import com.bit.backpackers.shop.model.entity.ReviewVo;
import com.bit.backpackers.shop.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Inject
	ShopService shopService;
	
	
	
	@Inject
	CategoryService categoryService;
	
	@RequestMapping("")
	public String list(Model model) throws SQLException {
		shopService.getShoplist(model);
		categoryService.getCategoryList(model);
		return "redirect:/shop/clothing/tops";
	}
	
	@RequestMapping("/{mainCategoryName}")
	public String list(@PathVariable String mainCategoryName, Model model) throws SQLException {
		try {
			categoryService.checkCategory(mainCategoryName);
		} catch (NullPointerException e) {
			return "redirect:/shop/clothing/tops";
		}
		categoryService.getCategoryList(model);
		categoryService.getCategoryNow(model, mainCategoryName);
		shopService.getShoplist(model, mainCategoryName);
		return "shop/list";
	}
	
	@RequestMapping("/{mainCategoryName}/{subCategoryName}")
	public String list(@PathVariable String mainCategoryName, 
			@PathVariable String subCategoryName, Model model) throws SQLException {
		try {
			categoryService.checkCategory(mainCategoryName, subCategoryName);
		} catch (NullPointerException e) {
			return "redirect:/shop/clothing/tops";
		}
		categoryService.getCategoryList(model);
		categoryService.getCategoryNow(model, mainCategoryName, subCategoryName);
		shopService.getShoplist(model, mainCategoryName, subCategoryName);
		return "shop/list";
	}
	
	@RequestMapping("/{mainCategoryName}/{subCategoryName}/{shopCode}/{productCode}")
	public String detail(@PathVariable String mainCategoryName, @PathVariable String subCategoryName, 
			@PathVariable String shopCode, @PathVariable String productCode,Model model) throws SQLException {
		try {
			categoryService.checkCategory(mainCategoryName, subCategoryName);
			
		} catch (NullPointerException e) {
			return "redirect:/shop/clothing/tops";
		}
		shopService.getShop(model, shopCode, productCode);
		shopService.reviewList(model, shopCode);
		return "shop/detail";
	}
	
	@RequestMapping(value = "/insertReview", method=RequestMethod.POST)
	public String registReview(@ModelAttribute ReviewVo review,HttpSession session) throws SQLException {
		String userId=(String) session.getAttribute("username");
		
		review.setUserId(userId);
		System.out.println(review);
		shopService.registReview(review);
		
		return "redirect:/shop/clothing/tops";
	}
	
	@RequestMapping(value = "/{reviewNo}/delete", method=RequestMethod.DELETE)
	public String deleteReview(@PathVariable int reviewNo, @ModelAttribute String url) throws SQLException{
		shopService.deleteReview(reviewNo);
		System.out.println(url);
		return "redirect:.";
	}
	
	@RequestMapping(value = "/{reviewNo}/update", method=RequestMethod.PUT)
	public String updateReview(@PathVariable int reviewNo, @ModelAttribute ReviewVo review) throws SQLException{
		shopService.updateReview(review);
		return "redirect:.";
	}

}
