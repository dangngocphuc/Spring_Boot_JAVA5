package com.poly.web.model;

import lombok.Data;

@Data
public class OrderDetailInfo {
    private Integer id;
 
    private String productCode;
    private String productName;
 
    private int quanity;
    private double price;
    private double amount;
 
}