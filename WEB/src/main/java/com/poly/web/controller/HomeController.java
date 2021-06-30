package com.poly.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.poly.web.entity.Order;
import com.poly.web.entity.OrderDetail;
import com.poly.web.entity.Product;
import com.poly.web.entity.ProductType;
import com.poly.web.entity.User;
import com.poly.web.form.CartForm;
import com.poly.web.form.CustomerForm;
import com.poly.web.model.LoginForm;
import com.poly.web.service.OrderDetailService;
import com.poly.web.service.OrderService;
import com.poly.web.service.ProductService;
import com.poly.web.service.UserService;
import com.poly.web.utility.HashUtil;
import com.poly.web.utility.SessionUtils;
import com.poly.web.utility.cookieUtils;

@Controller
public class HomeController {

	@Autowired
	private ProductService _productService;

	@Autowired
	private UserService _userService;

	@Autowired
	private OrderService _orderService;

	@Autowired
	private OrderDetailService _orderDetailService;

	@GetMapping("/product")
	public String getAll(Model model) {

		List<Product> product = _productService.getAll();

		model.addAttribute("products", product);
		
		model.addAttribute("productTypes", ProductType.values());
		return "productListPage";
	}
	
	@GetMapping("/home/product")
	public String getProduct(Model model) {
		Page<Product> page = _productService.getPages(0, 8);
		model.addAttribute("page", page);
		model.addAttribute("productTypes", ProductType.values());
		return "productListPage";
	}

	@GetMapping("/product/{id}")
	public String detailPage(@PathVariable Integer id, Model model) {
		model.addAttribute("user", "Product Page");

		Product product = _productService.findById(id);

		model.addAttribute("products", product);
		return "detailProductPage";
	}

	@GetMapping("/login")
	public ModelAndView getLogin(Model model, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}

	@PostMapping("/login")
	public String postLogin(@ModelAttribute("loginForm") LoginForm loginForm, HttpServletRequest request,
			HttpServletResponse response) {
		User user = _userService.findUserByEmail(loginForm.getEmail());
		boolean checkPwd = HashUtil.verify(loginForm.getPassword(), user.getPassword());
		HttpSession session = request.getSession();
		if (user != null && checkPwd) {
			SessionUtils.add(request, "email", user.getEmail());

			if (loginForm.getRemember()) {
				cookieUtils.add("email", loginForm.getEmail(), 24, response);
				cookieUtils.add("role", "true", 24, response);
			}

			request.setAttribute("isLogin", true);
			return "redirect:/product";
		}

		session.setAttribute("user", user);
		request.setAttribute("error", "Error");
		return null;

	}

	@GetMapping("/registration")
	public ModelAndView getRegister(Model model) {
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		model.addAttribute("user", user);
		modelAndView.setViewName("register");
		return modelAndView;
	}

	@PostMapping("/registration")
	public String postRegister(Model model, @Valid User user, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView();
		User userExists = _userService.findUserByEmail(user.getEmail());
		if (userExists != null) {
			result.rejectValue("email", "error.user", "There is already a user registered with the email provided");
		}
		if (result.hasErrors()) {
			modelAndView.setViewName("register");
		} else {
			_userService.saveUser(user);
			modelAndView.addObject("successMessage", "User has been registered successfully");
			modelAndView.addObject("user", new User());
			modelAndView.setViewName("registration");

		}

		return "register";
	}

	@GetMapping("/forgot-password")
	public String forgotpassword(Model model) {
		return "forgot-password";
	}

	@GetMapping("/404")
	public String page404(Model model) {
		return "404";
	}

	@GetMapping("/product/cart")
	public String Cart(HttpServletRequest request, Model model) {

		List<CartForm> cartForm = new ArrayList<CartForm>();
		model.addAttribute("cartForm", new CartForm());
		model.addAttribute("customerForm", new CustomerForm());
		HttpSession session = request.getSession();
		List<OrderDetail> listItems = (List<OrderDetail>) session.getAttribute("item");
		session.setAttribute("item", listItems);

		return "cartProduct";
	}

	@GetMapping("/product/AddToCart/{productId}")
	public String addToCart(@PathVariable Integer productId, Model model, HttpServletRequest request) {
		int quantity = 1;
		if (productId != null) {
			Product product = _productService.findById(productId);
			if (product != null) {
				if (request.getParameter("quantity") != null) {

					quantity = Integer.parseInt(request.getParameter("quantity"));
				}
				HttpSession session = request.getSession();
				if (session.getAttribute("item") == null) {
					List<OrderDetail> listItems = new ArrayList<>();
					OrderDetail item = new OrderDetail();

					item.setQuantity(quantity);
					item.setProduct(product);
					item.setPrice(product.getPrice());

					listItems.add(item);

					session.setAttribute("item", listItems);
				} else {
					List<OrderDetail> listItems = (List<OrderDetail>) session.getAttribute("item");

					boolean check = false;

					for (OrderDetail item : listItems) {
						if (item.getProduct().getId() == product.getId()) {
							item.setQuantity(item.getQuantity() + quantity);
							check = true;
						}
					}
					if (check == false) {
						OrderDetail item = new OrderDetail();
						item.setQuantity(quantity);
						item.setProduct(product);
						item.setPrice(product.getPrice());

						listItems.add(item);
					}
					session.setAttribute("item", listItems);
				}
			}
		}
		return "redirect:/product/cart";
	}

	@GetMapping("/product/deleteCart/{productId}")
	public String deleteCart(@PathVariable Integer productId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		List<OrderDetail> listItems = (List<OrderDetail>) session.getAttribute("item");

		for (OrderDetail x : listItems) {
			System.out.print(x + "\n");
		}

		if (listItems != null) {

			for (OrderDetail x : listItems) {
				listItems.remove(x);
			}

		}

		session.setAttribute("item", listItems);

		for (OrderDetail x : listItems) {
			System.out.print(x + "\n");
		}

		return "redirect:/product/cart";

	}

	@GetMapping("/product/buy")
	public String buyProduct(HttpServletRequest request, Model model,
			@ModelAttribute("customerForm") CustomerForm customerForm) {
		HttpSession session = request.getSession();
		List<OrderDetail> listItems = (List<OrderDetail>) session.getAttribute("item");

		Order order = new Order();
		order.setOrderDetails(listItems);
		order.setOrderDate(new Date());
		order.setCustomer(customerForm.getName());
		order.setPhone(customerForm.getPhone());

		_orderService.save(order);

		for (OrderDetail item : order.getOrderDetails()) {

			Product product = _productService.findById(item.getProduct().getId());
			int productLeft = product.getQuantity() - item.getQuantity();
			product.setQuantity(productLeft);
			_productService.save(product);

			OrderDetail orderdetail = new OrderDetail();
			orderdetail.setOrder(order);
			orderdetail.setProduct(item.getProduct());
			orderdetail.setPrice(item.getPrice());
			orderdetail.setQuantity(item.getQuantity());

			System.out.print(orderdetail.getOrder().getId() + "\n");
			System.out.print(orderdetail.getQuantity() + "\n");
			System.out.print(orderdetail.getProduct().getId() + "\n");
			System.out.print(orderdetail.getId() + "\n");

			_orderDetailService.save(orderdetail);
		}

		listItems.removeAll(listItems);
		session.setAttribute("item", listItems);
		return "cartProduct";
	}

	@GetMapping("/product/update")
	public String getUpdateCart(HttpServletRequest request, Model model) {
		return "redirect:/product/cart";
	}

	@PostMapping("/product/update")
	public String postUpdateCart(HttpServletRequest request, @ModelAttribute("cartForm") CartForm cartForm,@RequestParam("quantity") Integer qt) {
		HttpSession session = request.getSession();


		List<OrderDetail> listItems = (List<OrderDetail>) session.getAttribute("item");

		for (OrderDetail x : listItems) {
				x.setQuantity(cartForm.getQuantity());
		}

		session.setAttribute("item", listItems);
		return "redirect:/product/cart";
	}
	
	@GetMapping("/product/find/{type}")
	public String getByType(@PathVariable ProductType type, Model model) {
		List<Product> product = _productService.findByType(type);
		model.addAttribute("products", product);
		return "redirect:/home/product";
	}
}
