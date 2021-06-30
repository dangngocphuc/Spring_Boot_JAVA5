package com.poly.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.web.model.Cart;
import com.poly.web.entity.Product;
import com.poly.web.model.CartManager;
import com.poly.web.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartManager cartManager;
	@Autowired
	private ProductService service;

	@RequestMapping("/add/{id}")
	public String add(HttpSession session, @PathVariable("id") Integer id,
			@RequestParam(value = "qty", required = false, defaultValue = "1") int qty) {
		Product product = service.findById(id);
		Cart cart = cartManager.getCart(session);
		cart.addItem(product, qty);
		return "products/cart";
	}

	@RequestMapping("/remove")
	public String remove(HttpSession session, @RequestParam("id") Integer id) {
		Product product = service.findById(id);
		Cart cart = cartManager.getCart(session);
		cart.removeItem(product);
		return "products/cart";
	}

	@RequestMapping("/update")
	public String update(HttpSession session, @RequestParam("id") Integer id, @RequestParam("qty") int qty) {
		Product product = service.findById(id);
		Cart cart = cartManager.getCart(session);
		cart.updateItem(product, qty);
		return "products/cart";
	}
}
