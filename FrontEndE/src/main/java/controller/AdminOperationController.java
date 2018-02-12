package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Validation.Validation;
import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.dao.SupplierDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
@ComponentScan("com")

@RequestMapping("/admin")
public class AdminOperationController {

	@Autowired
	Validation validation;
	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private SupplierDao supplierDao;

	// Category
	// Information================================================================================
	@RequestMapping("/save_update_delete-category")
	public String showCategory(Model m) {
		Category category = new Category();
		m.addAttribute(category);
		List<Category> list = categoryDao.retreiveCategory();
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		m.addAttribute("catlist", list);
		return "Category";
	}

	@RequestMapping(value = "/AddCategory", params = "add", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category, Model m) {
		Category category1 = new Category();
		m.addAttribute(category1);
		String name = category.getCatName();
		String desc = category.getCatDesc();
	
		boolean invalidName = validation.isNameValid(name);
		boolean invalidDesc = validation.isNameValid(desc);
		if(invalidName == false)
		{
			String error = "Enter valid name";
			m.addAttribute("invalidName",error);
		}
		if(invalidDesc == false)
		{
			String error = "Enter valid details";
			m.addAttribute("invalidDesc",error);
		}
		if(invalidName == true && invalidDesc == true)
		{
		categoryDao.insertCategory(category);
		}
		List<Category> list = categoryDao.retreiveCategory();
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		m.addAttribute("catlist", list);
		return "Category";
	}

	@RequestMapping(value = "/AddCategory", params = "update", method = RequestMethod.POST)
	public String upCategory(@ModelAttribute("category") Category category, Model m) {
		String name = category.getCatName();
		String desc = category.getCatDesc();

		boolean invalidName = validation.isNameValid(name);
		boolean invalidDesc = validation.isNameValid(desc);
		if(invalidName == false)
		{
			String error = "Enter valid name";
			m.addAttribute("invalidName",error);
		}
		if(invalidDesc == false)
		{
			String error = "Enter valid details";
			m.addAttribute("invalidDesc",error);
		}
		if(invalidName == true && invalidDesc == true)
		{
		categoryDao.updateCategory(category);
		}
		List<Category> list = categoryDao.retreiveCategory();
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		m.addAttribute("catlist", list);
		return "Category";
	}
	// ==================================================================================================

	// Product
	// Information===================================================================================
	@RequestMapping("/save_update_delete-Products")
	public String showProducts(Model m) {
		Product product = new Product();
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

	@RequestMapping(value = "/addProduct", params = "add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product,
			@RequestParam("pimag") MultipartFile FileDetail, Model m) 
	{
		String pName = product.getProductName();
		String pDesc = product.getProductDesc();
        String pStock = Integer.toString(product.getStock());
        String pPrice = Integer.toString(product.getPrice());
  
        boolean invalidPrice = validation.isPriceValid(pPrice);
        boolean invalidStock = validation.isNumberValid(pStock);
        boolean invalidName = validation.isNameValid(pName);
        boolean invalidDesc = validation.isNameValid(pDesc);
        
        if(invalidName == false)
        {
        	String error = "Enter valid name";
        	m.addAttribute("invalidName",error);
        }
        if(invalidDesc == false)
        {
        	String error = "Enter valid name";
        	m.addAttribute("invalidDesc",error);
        }
        if(invalidStock == false)
        {
        	String error = "Enter valid input";
        	m.addAttribute("invalidStock",error);
        }
        if(invalidPrice == false)
        {
        	String error = "Enter valid input";
        	m.addAttribute("invalidPrice",error);
        }
        if(invalidStock == true && invalidPrice == true && invalidName == true && invalidDesc == true)
        {
       
		productDao.insertProduct(product);
       
		String path = "D:\\eclipse-jee-oxygen-R-win32-x86_64\\eclipse-workspace\\FrontEndE\\src\\main\\webapp\\resources\\images\\";
		String totalFileWithPath = path + String.valueOf(product.getProductId()) + ".jpg";
		File productImage = new File(totalFileWithPath);
		if (!FileDetail.isEmpty()) {
			try {
				byte fileBuffer[] = FileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(productImage);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
        }
		List<Product> list = productDao.retreiveProduct();
	      List<Category> listcat = categoryDao.retreiveCategory();
			m.addAttribute("addlist", listcat);
		m.addAttribute("productList", list);
		m.addAttribute("catlist", this.getCateg());
		m.addAttribute("supplist", this.getSupp());
		return "Product";
	}

	@RequestMapping(value = "/addProduct", params = "update", method = RequestMethod.POST)
	public String upProduct(@RequestParam("pimag") MultipartFile FileDetail, @ModelAttribute("product") Product product,
			Model m) {
		String pName = product.getProductName();
		String pDesc = product.getProductDesc();
		
        boolean invalidName = validation.isNameValid(pName);
        boolean invalidDesc = validation.isNameValid(pDesc);
   
        if(invalidName == false)
        {
        	String error = "Enter valid name";
        	m.addAttribute("invalidName",error);
        }
        if(invalidDesc == false)
        {
        	String error = "Enter valid name";
        	m.addAttribute("invalidDesc",error);
        }
        if(invalidName == true && invalidDesc == true)
        {
       
		productDao.updateProduct(product);
		
		String path = "D:\\eclipse-jee-oxygen-R-win32-x86_64\\eclipse-workspace\\FrontEndE\\src\\main\\webapp\\resources\\images\\";
		String totalFileWithPath = path + String.valueOf(product.getProductId()) + ".jpg";
		File productImage = new File(totalFileWithPath);
		if (!FileDetail.isEmpty()) {
			try {
				byte fileBuffer[] = FileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(productImage);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
        }

		List<Product> list = productDao.retreiveProduct();
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		m.addAttribute("productList", list);
		m.addAttribute("catlist", this.getCateg());
		m.addAttribute("supplist", this.getSupp());
		return "Product";
	}
	// =======================================================================================================

	// Supplier
	// Information===================================================================================
	@RequestMapping(value = "save_update_delete-supplier", method = RequestMethod.GET)
	public String showSupplier(Model m) {
		Supplier supplier = new Supplier();
		m.addAttribute(supplier);
		List<Supplier> list = supplierDao.retreiveSupplier();
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		m.addAttribute("suppList", list);
		return "Supplier";
	}

	@RequestMapping(value = "/addSupplier", params = "add", method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier, Model m) {
		
		Supplier supplier1 = new Supplier();
		m.addAttribute(supplier1);

		String name = supplier.getSuppName();
		String address = supplier.getSuppAddress();
		String email = supplier.getSuppEmail();
		String phone = supplier.getSuppPhone();
		
		
		boolean nameTest = validation.isNameValid(name);
		boolean emailTest = validation.isEmailValid(email);
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
		if(nameTest == true && phoneTest == true && addressTest == true && emailTest == true)
		{
		supplierDao.insertSupplier(supplier);
		}
		List<Supplier> list = supplierDao.retreiveSupplier();
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		m.addAttribute("suppList", list);
		return "Supplier";

	}

	@RequestMapping(value = "/addSupplier", params = "update", method = RequestMethod.POST)
	public String upSupplier(@ModelAttribute("supplier") Supplier supplier, Model m) {
		Supplier supplier1 = new Supplier();
		m.addAttribute(supplier1);
	
		String name = supplier.getSuppName();
		String address = supplier.getSuppAddress();
		String email = supplier.getSuppEmail();
		String phone = supplier.getSuppPhone();
		
		
		boolean nameTest = validation.isNameValid(name);
		boolean emailTest = validation.isEmailValid(email);
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
		if(nameTest == true && phoneTest == true && addressTest == true && emailTest == true)
		{
		supplierDao.updateSupplier(supplier);
		}
		List<Supplier> list = supplierDao.retreiveSupplier();
		List<Category> listcat = categoryDao.retreiveCategory();
		m.addAttribute("addlist", listcat);
		m.addAttribute("suppList", list);
		return "Supplier";

	}
	// =======================================================================================================

	public LinkedHashMap<Integer, String> getCategories() {
		List<Category> listCategories = categoryDao.retreiveCategory();
		LinkedHashMap<Integer, String> categoriesList = new LinkedHashMap<Integer, String>();
		for (Category category : listCategories) {
			categoriesList.put(category.getCatId(), category.getCatName());
		}
		return categoriesList;

	}

}
