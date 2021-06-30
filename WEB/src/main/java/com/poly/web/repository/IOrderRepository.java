package com.poly.web.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.poly.web.entity.Order;

public interface IOrderRepository extends CrudRepository<Order, Integer> {
	
	@Override
	List<Order> findAll();
}
