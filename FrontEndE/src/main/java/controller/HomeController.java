package controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CategoryDao;
import com.dao.UserDao;
import com.model.Category;
import com.model.User;

@Controller
@ComponentScan("com.dao")
public class HomeController {
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	UserDao userDao;

	@RequestMapping("/login")
	public String loggin(Model m) 
	{
		List<Category> catlist = categoryDao.retreiveCategory();
		  m.addAttribute("addlist",catlist);
		return "login";
	}

	@RequestMapping("/getLogin")
	public String getLoginDetails(@RequestParam("email") String email, @RequestParam("password") String password,
			Model m) {
		User user = userDao.getUserByEmail(email);
		String Email = user.getEmail();
		String Password = user.getPassword();
		if (Email.equals(email) && Password.equals(password)) {
			return "ProductDetails";
		} else {
			return "login";

		}
	}

	@RequestMapping("/login_success")
	public String loggedin(HttpServletRequest req, Model m) {
		Principal principal = req.getUserPrincipal();
		String name = principal.getName();
		List<Category> list = categoryDao.retreiveCategory();
		List<Category> catlist = categoryDao.retreiveCategory();
		m.addAttribute("addlist",catlist);
		m.addAttribute("list", list);
		m.addAttribute("name", name);
		return "index";
	}
}
