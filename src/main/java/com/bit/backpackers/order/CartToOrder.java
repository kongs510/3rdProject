package com.bit.backpackers.order;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.product.model.entity.ProductVo;

public class CartToOrder {

	public List<CartProductVo> JsonToCartParser(String jsonCart) throws ParseException {
		
		List<CartProductVo> cart = new ArrayList<CartProductVo>();
		
		JSONParser parser = new JSONParser();
		JSONArray array = (JSONArray) parser.parse(jsonCart);
		
		for(int i = 0; i < array.size(); i++) {
			JSONObject obj = (JSONObject) array.get(i);
			
			String productCode = (String) obj.get("productCode");
			String secondOptionCode = (String) obj.get("secondOptionCode");
			int quantity = Integer.parseInt((String) obj.get("quantity"));
			
			CartProductVo product = new CartProductVo();
			product.setProductCode(productCode);
			product.setSecondOptionCode(secondOptionCode);
			product.setQuantity(quantity);
			
			System.out.println("+++++++++++++++++++++++" + product.toString());
			
			cart.add(product);
		}
		return cart;
	}
	
}
