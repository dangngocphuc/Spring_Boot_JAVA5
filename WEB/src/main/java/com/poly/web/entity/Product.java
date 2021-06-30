package com.poly.web.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;
import org.springframework.data.annotation.Transient;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
 * The persistent class for the product database table.
 * 
 */
@Data
@Entity
@Table(name = "PRODUCT")
@SQLDelete(sql = "UPDATE PRODUCT SET is_deleted = 1 WHERE id=?")
@Where(clause = "is_deleted=0")
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue()
	private Integer id;

	@Column(name = "NAME", length = 255, nullable = false)
	private String name;

	@Column(name = "QUANTITY", nullable = false)
	private Integer quantity;

	@Column(name = "PRICE", nullable = false)
	private BigDecimal price;
	
	@Column(name = "IsDeleted", nullable = false)
	private boolean isDeleted;
	
	@Column(name= "IMAGE", nullable = false)
	private String image;
	
	@Column(name = "PRODUCT_TYPE", nullable = false)
	private ProductType type;

}