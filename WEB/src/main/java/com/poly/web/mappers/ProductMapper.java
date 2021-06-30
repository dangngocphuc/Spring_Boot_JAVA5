package com.poly.web.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.poly.web.entity.Product;
import com.poly.web.model.ProductModel;

@Component
public class ProductMapper {
	@Autowired
	private ModelMapper mapper;

	public Product convertToEntity(ProductModel productModel) {
		Product entity = new Product();

		mapper.map(productModel, entity);

		return entity;
	}

	public ProductModel convertToDTO(Product entity) {
		ProductModel productModel = new ProductModel();
		mapper.map(entity, productModel);
		return productModel;
	}
}
