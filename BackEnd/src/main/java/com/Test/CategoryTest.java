/*package com.Test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.dao.CategoryDao;
import com.model.Category;

public class CategoryTest 
{
	
	static CategoryDao categoryDao;
	
	@BeforeClass
	public static void initialize()
	{
		AnnotationConfigApplicationContext config = new AnnotationConfigApplicationContext();
		config.scan("com");
		config.refresh();
		categoryDao = (CategoryDao)config.getBean("categoryDao");
		
	}
    @Ignore
	@Test
	public void test() 
	{
		Category cat = new Category();
		cat.setCatDesc("slim");
		cat.setCatId(102);
		cat.setCatName("Blackberry z3");
		categoryDao.insertCategory(cat);
	}
    @Ignore
	@Test
	public void test1() 
	{
		List<Category> list = categoryDao.retreiveCategory();
		for(Category ist : list)
		{
			System.out.println(ist.getCatDesc());
			System.out.println(ist.getCatId());
			System.out.println(ist.getCatName());
		}
	}
	@Test
	@Ignore
	public void test2() 
	{
		Category category = new Category();
		category = categoryDao.getCategory(101);
	    System.out.println(category.getCatDesc());
	   // System.out.println(category.getCatId());
	    System.out.println(category.getCatName());
	}
	@Test
	public void test3() 
	{
		Category category = new Category();
		category.setCatId(101);
	    categoryDao.deleteCategory(category);
	}

}
*/