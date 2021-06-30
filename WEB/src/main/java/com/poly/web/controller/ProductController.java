package com.poly.web.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.web.entity.Product;
import com.poly.web.entity.ProductType;
import com.poly.web.mappers.ProductMapper;
import com.poly.web.model.ProductModel;
import com.poly.web.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

	@Autowired
	private ProductService _productService;



	@Autowired
	private ProductMapper mapper;

	@Autowired
	private ServletContext app;

	@GetMapping
	public String getAll(Model model) {
		List<Product> product = _productService.getAll();
		model.addAttribute("products", product);
		model.addAttribute("productTypes", ProductType.values());
		return "productsAdminList";
	}

	private final int PAGE_SIZE = 3;

	@GetMapping("/pagination")
	public String getListPageWithPagination(Model model, @RequestParam(defaultValue = "1") int currentPage) {

		// trường hợp nhỏ hơn 0
		// lấy trang đầu tiên
		if (currentPage < 0)
			currentPage = 1;
		Page<Product> page = _productService.getPages(currentPage - 1, PAGE_SIZE);

		// trường hợp lớn hơn tổng trang
		// lấy trang cuối cùng
		if (page.getTotalPages() < currentPage)
			page = _productService.getPages(page.getTotalPages() - 1, PAGE_SIZE);

		model.addAttribute("page", page);

		return "productsAdminList";
	}

	@GetMapping("/{id}")
	public String getDetailPage(@PathVariable Integer id, Model model) {

		Product product = _productService.findById(id);
		ProductModel productModel = mapper.convertToDTO(product);

		model.addAttribute("product", product);
		model.addAttribute("productForm", productModel);
		model.addAttribute("productTypes", ProductType.values());
		return "productsAdminEdit";

	}

	@GetMapping("/new")
	public String viewCreate(Model model) {

		model.addAttribute("productForm", new ProductModel());
		model.addAttribute("productTypes", ProductType.values());
		return "productsAdminCreate";
	}

	@PostMapping("/insert")
	public String saveProduct(@ModelAttribute("productForm") ProductModel productModel, BindingResult bindingResult,
			Model model) {
		// 1. Validate Product

		boolean check = bindingResult.hasErrors();

		// 2. if (validate ok) => save ok => Show message success
		if (!check ) {
			// TODO save product

			Product entity = mapper.convertToEntity(productModel);
			String images = productModel.getImage().getOriginalFilename();

			File dir = new File(app.getRealPath("/storage"));
			if (!dir.exists()) {
				dir.mkdirs();
			}

			try {
				File saveFile = new File(dir, images);
				productModel.getImage().transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.print(images);

			entity.setImage(images);
			Integer id = _productService.save(entity);

			model.addAttribute("message", "Save product is successfuly");
			model.addAttribute("productTypes", ProductType.values());
			// 3. else = => Show error message
			return "redirect:/products/" + id;

		} else {
			// 3. else = => Show error message
			return "productsAdminCreate";
		}

	}

	@PutMapping("/update")
	public String update(@ModelAttribute("productForm") ProductModel productModel, Model model) {
		Product entity = mapper.convertToEntity(productModel);
		String images = productModel.getImage().getOriginalFilename();

		File dir = new File(app.getRealPath("/storage"));
		if (!dir.exists()) {
			dir.mkdirs();
		}

		try {
			File saveFile = new File(dir, images);
			productModel.getImage().transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		entity.setImage(images);
		_productService.save(entity);
		return "redirect:/products/pagination";
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Integer id) {
		_productService.deleteById(id);
		return "redirect:/products/pagination";
	}

	@GetMapping("/search")
	public String getByName(@RequestParam String name, Model model,@RequestParam(defaultValue = "1") int currentPage) {

		if (currentPage < 0)
			currentPage = 1;
		Page<Product> page = _productService.findByName(name, currentPage - 1, PAGE_SIZE);

		// trường hợp lớn hơn tổng trang
		// lấy trang cuối cùng
		if (page.getTotalPages() < currentPage)
			page = _productService.findByName(name ,page.getTotalPages() - 1, PAGE_SIZE);

		model.addAttribute("page", page);


		model.addAttribute("productTypes", ProductType.values());

		return "productsAdminList";
	}

}
