package com.poly.web.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Optional;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.poly.web.entity.Product;
import com.poly.web.entity.ProductType;
import com.poly.web.model.ProductModel;
import com.poly.web.repository.IProductRepository;

@Service
public class ProductService {
	@Autowired
	private IProductRepository _productRepo;

	public List<Product> getAll() {
		return _productRepo.findAll();
	}

	public Page<Product> getPages(int currentPage, int pageSize) {
		Pageable page = PageRequest.of(currentPage, pageSize);
		return _productRepo.findAll(page);
	}

	public Product findById(Integer id) {
		Optional<Product> opt = _productRepo.findById(id);
		if (opt.isPresent()) {
			return opt.get();
		}
		return null;
	}

	/*
	 * public int add(Product product) { try { _productRepo.save(product); return 1;
	 * } catch (Exception ex) { ex.printStackTrace(); return -1; } }
	 * 
	 * public int updateById(Product product) { try { _productRepo.save(product);
	 * return 1; } catch (Exception e) { return -1; }
	 * 
	 * }
	 */

	public int save(Product product) {
		try {
			// Id tồn tại thì UPDATE
			// Không tồn tại thì INSERT
			return _productRepo.save(product).getId();
		} catch (Exception ex) {
			return -1;
		}
	}

	public int deleteById(Integer deleteId) {
		try {
			_productRepo.deleteById(deleteId);
			return 1;
		} catch (Exception ex) {
			return -1;
		}
	}

	public Page<Product> findByName(String name, int currentPage, int pageSize) {
		try {
			Pageable page = PageRequest.of(currentPage, pageSize);
			return _productRepo.findByNameLike("%" + name + "%", page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Product> findByType(ProductType type) {
		try {
			return _productRepo.findByType(type);
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ProductModel convertToModel(Product entity, ProductModel model) {
		if (model == null)
			model = new ProductModel();
		try {
			BeanUtils.copyProperties(entity, model);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return model;
	}

	public Product convertToEntity(ProductModel model, Product entity) {

		return null;
	}

}
