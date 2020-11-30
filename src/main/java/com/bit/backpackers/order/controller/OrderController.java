package com.bit.backpackers.order.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.backpackers.cart.model.entity.CartProductVo;
import com.bit.backpackers.cart.service.CartService;
import com.bit.backpackers.member.model.entity.MemberVo;
import com.bit.backpackers.order.OrderStatus;
import com.bit.backpackers.order.model.entity.OrderVo;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.order.service.OrderService;
import com.bit.backpackers.product.model.entity.ProductVo;

import lombok.Data;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	OrderService orderService;
	@Inject
	CartService cartService;
	
	MemberVo user;
	
	private MemberVo getUserFrom(HttpSession session) {
		return (MemberVo) session.getAttribute("user");
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)


	public String createOrder(OrderedProductVo product, HttpSession session) throws SQLException {

//		log.info(productCode + quantity);
		orderService.orderThisNow(product, getUserFrom(session));
		session.setAttribute("orderCart", "yes");
		return "redirect:/order/checkout";
	}
	
	
	@RequestMapping(value = "/checkout")
	public String checkout(Model model, HttpSession session) throws SQLException {
		orderService.getOrderDetail(model, getUserFrom(session));
		return "order/checkout";
	}
	
	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public String checkout(@ModelAttribute OrderVo order, RedirectAttributes redirectAttributes) throws SQLException {
		orderService.changeOrderStatus(order, OrderStatus.ORDERED);
		orderService.changeOrderStatus(order, OrderStatus.PAYED);
		redirectAttributes.addFlashAttribute("order", order);
		return "redirect:/order/receipt";
	}
	
	@RequestMapping(value = "/receipt")
	public String receipt(Model model, HttpSession session) throws SQLException {
		OrderVo order = null;
		try {
			order = (OrderVo) model.asMap().get("order");
		} catch (NullPointerException e) {
			return "redirect:/";
		}
		List<? extends ProductVo> productList = orderService.getOrderDetailByOrderCode(model, order.getOrderCode());
		if(session.getAttribute("orderCart") == null) {
			cartService.removeItemsFromCart(productList, getUserFrom(session));
		}
		return "order/receipt";
	}
	
	@RequestMapping("/cart")
	public String showCart(Model model, HttpSession session) throws SQLException {
		cartService.getCartByMemberId(model, getUserFrom(session));
		return "order/cart";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	@ResponseBody
	public String putItemIntoCart(@RequestBody CartProductVo product, HttpSession session) throws SQLException {
		cartService.putItemIntoCart(product, getUserFrom(session));
		return product.toString();
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.DELETE)
	@ResponseBody
	public String removeItemFromCart(@RequestBody CartProductVo product, HttpSession session) throws SQLException {
		cartService.removeItemFromCart(product, getUserFrom(session));
		return product.toString();
	}
	
	@RequestMapping(value = "/cart/order", method = RequestMethod.POST)
	@ResponseBody
	public String orderCart(@RequestBody String jsonCart, HttpSession session) throws SQLException, ParseException {
		List<CartProductVo> cart = cartService.getCartForOrder(jsonCart, getUserFrom(session));
		String orderCode = orderService.orderCart(cart, getUserFrom(session));
		return orderCode;
	}

	@RequestMapping(value = "/cart/quantity", method = RequestMethod.POST)
	@ResponseBody
	public String plusItemIntoCart(@RequestBody CartProductVo product, HttpSession session) throws SQLException {
		cartService.putItemIntoCart(product, getUserFrom(session));
		return product.toString();
	}
	
	@RequestMapping(value = "/cart/quantity", method = RequestMethod.DELETE)
	@ResponseBody
	public String minusItemFromCart(@RequestBody CartProductVo product, HttpSession session) throws SQLException {
		cartService.removeItemFromCart(product, getUserFrom(session));
		return product.toString();
	}
}
