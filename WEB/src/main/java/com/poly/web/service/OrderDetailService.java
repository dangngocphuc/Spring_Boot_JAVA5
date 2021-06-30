package com.poly.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.web.entity.Order;
import com.poly.web.entity.OrderDetail;
import com.poly.web.repository.IOrderDetailRepository;

@Service
public class OrderDetailService {
	@Autowired
	private IOrderDetailRepository _orderDetailRepo;
	
	public Integer save(OrderDetail orderDetail ) {
		try {
			// Id tồn tại thì UPDATE
			// Không tồn tại thì INSERT
			return _orderDetailRepo.save(orderDetail).getId();
		} catch (Exception ex) {
			return -1;
		}
	}

	public List<OrderDetail> findById(Order order) {
		
		return _orderDetailRepo.findByOrder(order);
	}
}
