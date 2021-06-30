package com.poly.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.poly.web.entity.Product;
import com.poly.web.repository.IProductRepository;
import com.poly.web.service.ProductService;

@Controller
public class DefaultController {

    @Autowired
    private IProductRepository productRepository;
    @Autowired
    ProductService service;


    @GetMapping("/shop")
    public String shop(Model model){
        model.addAttribute("products", productRepository.findAll());
        return "products/shop";
    }

    @RequestMapping("/cart")
    public String cart(){
        return "products/cart";
    }

    @RequestMapping("/product/{id}")
    public String product(@PathVariable("id") Integer id, Model model){
    	Product product = service.findById(id);
        model.addAttribute("product", product);
        return "product";
    }
}
