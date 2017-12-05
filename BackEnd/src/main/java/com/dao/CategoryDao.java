package com.dao;

import java.util.List;

import com.model.Category;

public interface CategoryDao 
{
	public boolean insertCategory(Category category);
	public List<Category> retreiveCategory();
	public boolean deleteCategory(Category category);
	public Category getCategory(int catId);
	public boolean updateCategory(Category category);
	
}
