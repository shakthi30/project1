package controller;


import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.dao.SupplierDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
@ComponentScan("com")

@RequestMapping("/admin")
public class AdminUpdateDeleteController {
	@Autowired
	ProductDao productDao;

	@Autowired
	SupplierDao supplierDao;

	@Autowired
	CategoryDao categoryDao;

	// Product Update/Delete=======================================
	@RequestMapping(value = "/updateProduct/{productId}")
	public String updateProduct(@PathVariable("productId") int productId, Model m) {
		Product product = productDao.getProduct(productId);
		m.addAttribute(product);
		List<Product> product1 = productDao.retreiveProduct();
		m.addAttribute(product1);
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		m.addAttribute("catlist", this.getCateg());
		m.addAttribute("supplist", this.getSupp());
		return "Product";
	}

	public LinkedHashMap<String, String> getSupp() {
		List<Supplier> listSupplier = supplierDao.retreiveSupplier();
		LinkedHashMap<String, String> supplierList = new LinkedHashMap<String, String>();

		for (Supplier supplier : listSupplier) {
			supplierList.put(supplier.getSuppName(), supplier.getSuppName());
			System.out.println(supplier.getSuppName());
		}
		return supplierList;

	}

	public LinkedHashMap<String, String> getCateg() {
		List<Category> listCategory = categoryDao.retreiveCategory();
		LinkedHashMap<String, String> categoryList = new LinkedHashMap<String, String>();

		for (Category category : listCategory) {
			categoryList.put(category.getCatName(), category.getCatName());
		}
		return categoryList;

	}

	@RequestMapping("/deleteProduct/{productId}")
	public String deleteProduct(@PathVariable("productId") int productId, Model m) {
		Product product1 = new Product();
		m.addAttribute(product1);
		Product product = productDao.getProduct(productId);
		productDao.deleteProduct(product);
		List<Product> list = productDao.retreiveProduct();
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		m.addAttribute("productList", list);
		m.addAttribute("catlist", this.getCateg());
		m.addAttribute("supplist", this.getSupp());
		return "Product";
	}
	// ========================================================

	// Supplier Update/Delete===================================
	@RequestMapping(value = "/updateSupplier/{suppId}")
	public String updateSupplier(@PathVariable("suppId") int suppId, Model m) {
		Supplier supplier = supplierDao.getSupplier(suppId);
		m.addAttribute(supplier);
		List<Supplier> supplier1 = supplierDao.retreiveSupplier();
		m.addAttribute("suppList", supplier1);
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		return "Supplier";
	}

	@RequestMapping("/deleteSupplier/{suppId}")
	public String returnPage(@PathVariable("suppId") int suppId, Model m) {
		Supplier supplierlist = new Supplier();
		m.addAttribute(supplierlist);
		Supplier supplier = supplierDao.getSupplier(suppId);
		supplierDao.deleteSupplier(supplier);
		List<Supplier> supplier1 = supplierDao.retreiveSupplier();
		m.addAttribute("suppList", supplier1);
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		return "Supplier";
	}
	// ===========================================================================

	// Category Update/Delete=====================================================

	@RequestMapping(value = "/updateCategory/{catId}", method = RequestMethod.GET)
	public String updateCategory(@PathVariable("catId") int catId, Model m) {
		Category category = categoryDao.getCategory(catId);
		m.addAttribute(category);
		List<Category> list = categoryDao.retreiveCategory();
		m.addAttribute("catlist", list);
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		return "Category";
	}

	@RequestMapping(value = "/deleteCategory/{catId}", method = RequestMethod.GET)
	public String deleteCategory(@PathVariable("catId") int catId, Model m) {
		Category category1 = new Category();
		m.addAttribute(category1);
		Category category = categoryDao.getCategory(catId);
		categoryDao.deleteCategory(category);
		List<Category> list = categoryDao.retreiveCategory();
		m.addAttribute("catList", list);
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		return "redirect:/admin/save_update_delete-category";
	}
	// ======================================================================

}
