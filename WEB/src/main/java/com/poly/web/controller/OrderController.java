package com.poly.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.web.entity.Order;
import com.poly.web.entity.OrderDetail;
import com.poly.web.entity.Product;
import com.poly.web.entity.ProductType;
import com.poly.web.model.ProductModel;
import com.poly.web.service.OrderDetailService;
import com.poly.web.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService _orderService;
	
	@Autowired
	private OrderDetailService _orderDetailService;

	@GetMapping
	public String getAll(Model model) {
		List<Order> order = _orderService.getAll();
		model.addAttribute("order", order);
		return "orderAdminList";
	}
	
	@GetMapping("/{id}")
	public String getDetailOrder(@PathVariable Integer id, Model model) {

		Order order = _orderService.getById(id);
		
		List<OrderDetail> orderDetail = _orderDetailService.findById(order);

		model.addAttribute("orderDetail", orderDetail);

		return "orderDetailAdminList";

	}
}
