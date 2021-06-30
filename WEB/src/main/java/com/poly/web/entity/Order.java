package com.poly.web.entity;
 
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;
 
@Data
@Entity
@Table(name = "Orders"	)
public class Order implements Serializable {
 
    private static final long serialVersionUID = -2576670215015463100L;
 
    @Id
	@Column(name="Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
    
    @Column(name="Customer")
	private String customer;
 
    @Column(name="Mail")
	private String mail;

	@Column(name="Phone")
	private String phone;
    
    @Column(name = "Order_Date", nullable = false)
    private Date orderDate;
 
 
    @OneToMany(mappedBy="order")
	private List<OrderDetail> orderDetails;
 
}