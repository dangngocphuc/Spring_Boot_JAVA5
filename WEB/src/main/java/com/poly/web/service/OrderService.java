package com.poly.web.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poly.web.entity.Order;
import com.poly.web.repository.IOrderRepository;

@Service
public class OrderService {
	@Autowired
	private IOrderRepository _orderRepo;
	
	@Transactional
	public Integer save(Order order ) {
		try {
			// Id tồn tại thì UPDATE
			// Không tồn tại thì INSERT
			return _orderRepo.save(order).getId();
		} catch (Exception ex) {
			return -1;
		}
	}
	
	public List<Order> getAll() {
		return _orderRepo.findAll();
	}
	
	public Order getById(Integer id) {
		Optional<Order> opt = _orderRepo.findById(id);
		if (opt.isPresent()) {
			return opt.get();
		}
		return null;
	}
}
