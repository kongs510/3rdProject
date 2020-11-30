package com.bit.backpackers.cart.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.cart.model.CartDao;
import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.order.CartToOrder;
import com.bit.backpackers.order.Order;
import com.bit.backpackers.order.model.OrderDao;
import com.bit.backpackers.order.model.OrderedProductDao;
import com.bit.backpackers.order.model.entity.OrderVo;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.product.Product;
import com.bit.backpackers.product.model.entity.ProductVo;
import com.bit.backpackers.shop.Shop;
import com.bit.backpackers.shop.model.entity.ShopVo;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	SqlSession sqlSession;
	@Inject
	Product productSupport;
	@Inject
	Shop shopSupport;
	@Inject
	Order orderSupport;

	@Override
	public void putItemIntoCart(CartProductVo product, MemberVo user) throws SQLException {
		for(int i = 0; i < product.getQuantity(); i++) {
			sqlSession.getMapper(CartDao.class).insertItem(product.getProductCode(), product.getSecondOptionCode(), user.getUserId());
		}
	}

	@Override
	public void getCartByMemberId(Model model, MemberVo user) throws SQLException {
		List<CartProductVo> productList = sqlSession.getMapper(CartDao.class).selectCart(user.getUserId());
		List<ImageVo> titleImageList = productSupport.getTitleImageList(productList);
		List<ShopVo> shopList = productSupport.getShopList(productList);
		orderSupport.nameOptionForProducts(productList);
//		model.addAttribute("order", order);
		model.addAttribute("productList", productList);
		model.addAttribute("imageList", titleImageList);
		model.addAttribute("shopList", shopList);
	}
	
	@Override
	public void removeItemFromCart(ProductVo product, MemberVo user) throws SQLException {
		System.out.println(product.toString());
		System.out.println(user.toString());
		if(((CartProductVo) product).getQuantity() == 1) {
			sqlSession.getMapper(CartDao.class).minusItemQuantity(product.getProductCode(), product.getSecondOptionCode(), user.getUserId());
		} else {
			sqlSession.getMapper(CartDao.class).removeItem(product.getProductCode(), product.getSecondOptionCode(), user.getUserId());
		}
	}
	
	@Override
	public void removeItemsFromCart(List<? extends ProductVo> productList, MemberVo user) throws SQLException {
		for(ProductVo product : productList) {
			removeItemFromCart(product, user);
		}
	}
	
	@Override
	public List<CartProductVo> getCartForOrder(String jsonCart, MemberVo user) throws SQLException, ParseException {
//		for(CartProductVo product : cart) {
//			removeItemFromCart(product, user);
//		}
		return new CartToOrder().JsonToCartParser(jsonCart);
	}

}
