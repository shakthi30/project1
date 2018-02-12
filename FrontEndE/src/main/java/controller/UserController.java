package controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Validation.Validation;
import com.dao.CartDao;
import com.dao.CategoryDao;
import com.dao.OrderDao;
import com.dao.ProductDao;
import com.dao.UserDao;
import com.model.Cart;
import com.model.Category;
import com.model.Order;
import com.model.Product;
import com.model.User;

@Controller
@ComponentScan("com")
public class UserController {
	@Autowired
	private CategoryDao categoryDao;
     
	@Autowired
	private Validation validation;
	
	@Autowired
	private ProductDao productDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private CartDao cartDao;

	@Autowired
	private OrderDao orderDao;

	@RequestMapping(value = "/sortCategory/{catName}")
	public String sortCategory(@PathVariable("catName") String catName, Model m) {
		List<Product> product = productDao.getProductByCategoryName(catName);
		List<Category> list = categoryDao.retreiveCategory();
		m.addAttribute("addlist", list);
		m.addAttribute("productList", product);
		return "ProductDetails";
	}

	@RequestMapping(value = { "/", "/productDetails/home", "/home" })
	public String homePage(Model m, HttpServletRequest req) {
		List<Category> list = categoryDao.retreiveCategory();
		m.addAttribute("addlist", list);
		return "index";
	}

	@RequestMapping("/productdetails")
	public String display(Model m) {
		List<Product> list = productDao.retreiveProduct();
		List<Category> catlist = categoryDao.retreiveCategory();
		m.addAttribute("addlist", catlist);
		m.addAttribute("productList", list);
		return "ProductDetails";
	}

	@RequestMapping(value = "/productDetails/{productId}")
	public String productDetails(@PathVariable("productId") int productId, Model m) {
		Product product = productDao.getProduct(productId);
	    int stock = product.getStock();
	    m.addAttribute("stock",stock);
		List<Category> catlist = categoryDao.retreiveCategory();
		m.addAttribute("addlist", catlist);
		m.addAttribute("prod", product);
		return "ProductDescription";
	}

	@RequestMapping(value = "/cart")
	public String show(HttpServletRequest req, Model m) {
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
	
		List<Cart> cart1 = cartDao.findCartById(userEmail);
		m.addAttribute("cartInfo", cart1);
		return "Cart";
	}

	@RequestMapping(value = "/cart/{productId}", method = RequestMethod.POST)
	public String showCart(@PathVariable("productId") int productId, Model m, HttpServletRequest req) {
		try {
			Principal principal = req.getUserPrincipal();
			String userEmail = principal.getName();

			User user = userDao.getUserByEmail(userEmail);
			Product product = productDao.getProduct(productId);
			String cartProductName = product.getProductName();
			int stock = product.getStock();
			Double cartPrice = (double) product.getPrice();
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			if(quantity > stock)
			{
				String message = "Available stock is "+stock+"";
				m.addAttribute("error",message);
				List<Category> catlist = categoryDao.retreiveCategory();
				
				m.addAttribute("addlist", catlist);
				m.addAttribute("prod", product);
				return "ProductDescription";
			}
			else
			{
				Cart cart = new Cart(productId, user, cartPrice, quantity);
				cart.setCartProdName(cartProductName);
				cart.setCartImg(Integer.toString(productId));
				cartDao.insert(cart);
				int stockBalance = stock - quantity;
				product.setStock(stockBalance);
				productDao.updateProduct(product);
				List<Cart> cart1 = cartDao.findCartById(userEmail);
				List<Category> list = categoryDao.retreiveCategory();
				m.addAttribute("addlist", list);
				m.addAttribute("cartInfo", cart1);
				return "Cart";
			}
		
		} 
		catch (Exception e)
		{
			String error = "Please log-in to continue!";
			m.addAttribute("Error", error);
			return "login";

		}
	}

	@RequestMapping(value = "/shipping")
	public String shipping(Model m, HttpServletRequest req) {
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();

		User listUser = userDao.getUserByEmail(userEmail);
		m.addAttribute("User", listUser);
		List<Cart> listCart = cartDao.findCartById(userEmail);
		m.addAttribute("Cart", listCart);
		
		if(listCart.isEmpty())
		{
			return "Cart";
		}
		else
		{
		List<Category> catlist = categoryDao.retreiveCategory();
		m.addAttribute("addlist", catlist);
		return "Shipping";
		}
	}

	@RequestMapping(value = "/invoiceProcess")
	public String invoice(HttpServletRequest req, @RequestParam("total") Double total,
			@RequestParam("payment") String payment, Model m) {
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
		User user = userDao.getUserByEmail(userEmail);

		Order order = new Order(user);
		order.setPayment(payment);
		order.setTotal(total);
		order.setUser(user);
		orderDao.addOrder(order);
		m.addAttribute("userList", user);
		m.addAttribute("orderList", order);
		List<Cart> listCart = cartDao.findCartById(userEmail);
		List<Category> list = categoryDao.retreiveCategory();
		m.addAttribute("addlist", list);
		m.addAttribute("Cart", listCart);
		return "Invoice";
	}

	@RequestMapping("orderHistory")
	public String orderHistory(Model m, HttpServletRequest req) {
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
		List<Category> list = categoryDao.retreiveCategory();
		m.addAttribute("addlist", list);
		List<Order> orderList = orderDao.getOrderById(userEmail);
		m.addAttribute("order", orderList);
		return "OrderHistory";
	}

	@RequestMapping("/ack")
	public String ackPage(Model m,HttpServletRequest req) {
		
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
		List<Cart> cart = cartDao.findCartById(userEmail);
		for(Cart list:cart)
		{
			cartDao.deleteCartOb(list);
		}
		return "Ack";
	}

	@RequestMapping("/Reg")
	public String nextPag(Model m) {
		List<Category> catlist = categoryDao.retreiveCategory();
		m.addAttribute("addlist", catlist);
		return "Register";
	}

	@RequestMapping("/register")
	public String addUser(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("address") String address,
			@RequestParam("phone") String phone, @RequestParam("role") String role, Model m) {
	
		boolean nameTest = validation.isNameValid(name);
		boolean emailTest = validation.isEmailValid(email);
		boolean passwordTest = validation.isPasswordValid(password);
		boolean phoneTest = validation.isPhoneValid(phone);
		boolean addressTest = validation.isAddressValid(address);
		
		if(nameTest == Boolean.FALSE)
		{
			String error = "Enter valid name";
			m.addAttribute("invalidName",error);
		}
		if(emailTest == Boolean.FALSE)
		{
			String error = "Enter valid email";
			m.addAttribute("invalidEmail",error);
		}
		if(passwordTest == Boolean.FALSE)
		{
			String error = "a digit must occur at least once, a lower case letter must occur at least once,an upper case letter must occur at least once" + "a special character must occur at least once no whitespace allowed";
			m.addAttribute("invalidPassword",error);
		}
		if(phoneTest == Boolean.FALSE)
		{
			String error = "Enter valid phone number";
			m.addAttribute("invalidPhone",error);
		}
		if(addressTest == Boolean.FALSE)
		{
			String error = "Enter valid address";
			m.addAttribute("invalidAddress",error);
		}
		if(nameTest == true && phoneTest == true && addressTest == true && passwordTest == true && emailTest == true)
		{
			User user = new User();
			user.setEmail(email);
			user.setName(name);
			user.setPassword(password);
			user.setAddress(address);
			user.setPhone(phone);
			user.setRole(role);
			userDao.addUser(user);
			return "Register";
		}
		return "Register";
		
	}
		
			
	@RequestMapping(value = "/deletePCart/{cartId}")
	public String deleteCart(@PathVariable("cartId") int cartId, Model m, HttpServletRequest req) {
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
		cartDao.deleteCart(cartId);
		List<Cart> cart1 = cartDao.findCartById(userEmail);
		m.addAttribute("cartInfo", cart1);
		return "Cart";
	}

}
