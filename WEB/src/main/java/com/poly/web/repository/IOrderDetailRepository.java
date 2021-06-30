package com.poly.web.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.poly.web.entity.Order;
import com.poly.web.entity.OrderDetail;

public interface IOrderDetailRepository extends CrudRepository<OrderDetail, Integer> {

	List<OrderDetail> findByOrder(Order order);
}
