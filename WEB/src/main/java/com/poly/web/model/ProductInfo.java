package com.poly.web.model;

import java.math.BigDecimal;

import com.poly.web.entity.Product;

import lombok.Data;

@Data
public class ProductInfo {
	private Integer code;
	private String name;
	private BigDecimal price;

	public ProductInfo() {
	}

	public ProductInfo(Product product) {
		this.code = product.getId();
		this.name = product.getName();
		this.price = product.getPrice();
	}

	// Sử dụng trong JPA/Hibernate query

}
