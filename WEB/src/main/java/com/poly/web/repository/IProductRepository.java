package com.poly.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.poly.web.entity.Product;
import com.poly.web.entity.ProductType;

public interface IProductRepository extends CrudRepository<Product, Integer> {

	@Override
	List<Product> findAll();

	@Query("SELECT p FROM Product p WHERE p.name LIKE %:name%")
	List<Product> findByName(@Param("name") String name);

	Page<Product> findByNameLike(String name,Pageable page);

	List<Product> findByType(ProductType type);

	Page<Product> findAll(Pageable page);

	/*
	 * String SELECT_COUNT_QUANTIY_BY_CATEGORY_ID =
	 * "SELECT count(p.quantity) FROM Product p Where p.category.id =:categoryId AND p.id=:id"
	 * ;
	 * 
	 * List<Product> findByNameContaining(String name);
	 * 
	 * @Query(SELECT_COUNT_QUANTIY_BY_CATEGORY_ID) Integer
	 * countQuantityByCategory(Integer categoryId, Integer id);
	 */

}
