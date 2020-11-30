package com.bit.backpackers.admin.shop.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.admin.shop.model.ShopAdminDao;
import com.bit.backpackers.admin.shop.model.entity.ShopVo;
import com.bit.backpackers.category.Category;
import com.bit.backpackers.item.Item;
import com.bit.backpackers.option.Option;
import com.bit.backpackers.product.Product;
import com.bit.backpackers.product.model.ProductDao;

@Service
public class ShopAdminServiceImpl implements ShopAdminService {

	@Inject
	SqlSession sqlSession;
	@Inject
	Category categorySupport;
	@Inject
	Option optionSupport;
	@Inject
	Product productSupport;
	@Inject
	Item itemSupport;
	
	@Override
	public void getShopList(Model model) throws SQLException {
		List<ShopVo> shopList = sqlSession.getMapper(ShopAdminDao.class).selectAll();
		model.addAttribute("shopList", shopList);
		model.addAttribute("mainCategoryMap", categorySupport.getMainCategoryMap());
		model.addAttribute("subCategoryMap", categorySupport.getSubCategoryMap());
	}
	
	@Override
	public void getShop(Model model, String shopCode) throws SQLException {
		ShopVo shop = sqlSession.getMapper(ShopAdminDao.class).selectOne(shopCode);
		model.addAttribute("shop", shop);
		model.addAttribute("mainCategoryMap", categorySupport.getMainCategoryMap());
		model.addAttribute("subCategoryMap", categorySupport.getSubCategoryByMainCategoryMap());
		model.addAttribute("productList", sqlSession.getMapper(ProductDao.class).selectProductByShopCode(shopCode));
		model.addAttribute("productItemMap", productSupport.getProductItemMapByShopCode(shopCode));
		model.addAttribute("optionGroupList", optionSupport.getOptionGroupList());
		model.addAttribute("optionMap", optionSupport.getOptionByOptionGroupMap());
	}
	
	@Override
	public void getShopForm(Model model) throws SQLException {
		model.addAttribute("mainCategoryMap", categorySupport.getMainCategoryMap());
		model.addAttribute("subCategoryMap", categorySupport.getSubCategoryByMainCategoryMap());
		model.addAttribute("optionGroupList", optionSupport.getOptionGroupList());
		model.addAttribute("optionMap", optionSupport.getOptionByOptionGroupMap());
	}
	
	@Override
	public String getItem(String itemCode) throws SQLException {
		return itemSupport.getItemJson();
	}
	
	@Override
	public void createShop(ShopVo shop) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public int updateShop(ShopVo shop) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int deleteShop(String shopCode) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
