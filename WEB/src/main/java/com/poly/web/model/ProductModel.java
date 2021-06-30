package com.poly.web.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import com.poly.web.entity.ProductType;

import lombok.Data;

@Data
public class ProductModel implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;

	private String name;

	private MultipartFile image;

	private Double price;

	private Integer quantity;

	private ProductType type;

}