package com.dao;

import java.util.List;

import com.model.Category;
import com.model.Product;

public interface ProductDao 
{
	public boolean insertProduct(Product product);
	public List<Product> retreiveProduct();
	public boolean deleteProduct(Product product);
	public Product getProduct(int catId);
	public boolean updateProduct(Product product);
	public List<Product> getProductByCategoryName(String catName);

}
