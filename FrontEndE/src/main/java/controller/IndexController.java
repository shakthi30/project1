package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.dao.SupplierDao;
import com.dao.UserDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;
import com.model.User;


@Controller
@ComponentScan("com")
public class IndexController 
{
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SupplierDao supplierDao;
	
	/*@RequestMapping("/next")
	public String nextPage(Model m) 
	{
		AnnotationConfigApplicationContext con = new AnnotationConfigApplicationContext();
		con.scan("com");
		con.refresh();
		userDao = (UserDao)con.getBean("userDao");
		User user = new User();
		m.addAttribute(user);
		List<User> list = userDao.retreiveuser();
		m.addAttribute("UserList", list);
		return "User";
	}*/
	@RequestMapping("/Reg")
	public String nextPag(Model m) 
	{
		
		return "Register";
	}
	@RequestMapping("/category")
	public String showCategory(Model m)
	{
		Category category = new Category();
		m.addAttribute(category);
		List<Category> list = categoryDao.retreiveCategory();
		m.addAttribute("catlist",list);
		return "Category";
	}
	@RequestMapping(value="/deleteCategory/{catId}",method=RequestMethod.GET)
	public String deleteCategory(@PathVariable("catId")int catId,Model m)
	{
		
		Category category = categoryDao.getCategory(catId);
		categoryDao.deleteCategory(category);
		List<Category> list = categoryDao.retreiveCategory();
		m.addAttribute("catList",list);
		return "Category";		
	}
	@RequestMapping(value="/AddCategory", method=RequestMethod.GET)
	public String addCategory(@RequestParam("CatId")int catId,@RequestParam("CatName")String catName,@RequestParam("CatDesc")String catDesc, Model m)
	{
	    Category category = new Category();
	    category.setCatId(catId);
	    category.setCatName(catName);
	    category.setCatDesc(catDesc);
	    categoryDao.insertCategory(category);
	    List<Category> list = categoryDao.retreiveCategory();
		m.addAttribute("catList",list);
		return "Category";
	}

	 @RequestMapping("/Products")
	 public String showProducts(Model m)
	 {
		  Product product = new Product();
		  m.addAttribute(product);
		  List<Product> list = productDao.retreiveProduct(); 
		  m.addAttribute("productList",list);
		  m.addAttribute("categoryList",this.getCateg());
		  m.addAttribute("supplierList",this.getSupp());
		  return "Product";
	 }
	 @RequestMapping(value="/addProduct", method= RequestMethod.POST)
	 public String addProduct(@RequestParam("pimag")MultipartFile FileDetail,@RequestParam("catName")String catName,@RequestParam("suppName")String suppName,@RequestParam("productName")String productName,@RequestParam("productDesc")String productDesc,@RequestParam("stock")int stock,@RequestParam("price")int price,Model m)
	 {
		
		 Product product = new Product();
		 product.setCatName(catName);
		 product.setPrice(price);
		 product.setProductDesc(productDesc);
		 product.setProductName(productName);
		 product.setStock(stock);
		 product.setSuppName(suppName);
		 productDao.insertProduct(product);
		 String path= "D:\\eclipse-jee-oxygen-R-win32-x86_64\\eclipse-workspace\\FrontEndE\\src\\main\\webapp\\resources\\images\\";
		 String totalFileWithPath = path + String.valueOf(product.getProductId())+".jpg";
		 File productImage = new File(totalFileWithPath);
		 if(!FileDetail.isEmpty())
		 {
			 try
			 {
				 byte fileBuffer[] = FileDetail.getBytes();
				 FileOutputStream fos = new FileOutputStream(productImage);
				 BufferedOutputStream bs = new BufferedOutputStream(fos);
				 bs.write(fileBuffer);
				 bs.close();
			 }
			 catch(Exception e)
			 {
				 System.out.println(e);
			 }
		 }
	
		 List<Product> list = productDao.retreiveProduct(); 
		 m.addAttribute("productList",list);
		 return "Product";
	 }
	 public LinkedHashMap<Integer,String> getCategories()
	 {
		 List<Category> listCategories = categoryDao.retreiveCategory();
		 LinkedHashMap<Integer,String> categoriesList = new LinkedHashMap<Integer,String>();
		 for(Category category: listCategories)
		 {
			 categoriesList.put(category.getCatId(), category.getCatName());
		 }
		return categoriesList;
		 
	 }
	 public List<Category> getCateg()
	 {
		 List<Category> category = categoryDao.retreiveCategory();
		 return category;
	 }
	 public List<Supplier> getSupp()
	 {
		 List<Supplier> supplier = supplierDao.retreiveSupplier();
		 return supplier;
	 }
	 @RequestMapping(value="Supplier",method = RequestMethod.GET)
	 public String showSupplier(Model m)
	 {
	     return "Supplier";	 
	 }
	 @RequestMapping(value="addSupplier",method=RequestMethod.POST)
	 public String addSupplier(@RequestParam("suppid")int suppid,@RequestParam("suppname")String suppname,@RequestParam("suppadd")String suppadd,Model m)
	 {
		 Supplier supplier = new Supplier();
		 supplier.setSuppAddress(suppadd);
		 supplier.setSuppId(suppid);
		 supplier.setSuppName(suppname);
		 supplierDao.insertSupplier(supplier);
		 return "Supplier";
		 
	 }
	 @RequestMapping(value="List",method=RequestMethod.GET)
	 public String operationUpdation(Model m)
	 {
		 List<Product> list = productDao.retreiveProduct(); 
		 m.addAttribute("productList",list);
		 return "ProductUpdateDelete";
	 }
	 
}
