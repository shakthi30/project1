package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Category;
@Repository("categoryDao")
public class CategoryDaoImplementation implements CategoryDao
{
      @Autowired
      SessionFactory sessionFactory;
    
    @Transactional
	@Override
	public boolean insertCategory(Category category)
	{
		try
		{
		   Session session = sessionFactory.openSession();
		   session.beginTransaction();
		   session.save(category);
		   session.getTransaction().commit();
		   return true;
		}
		catch(Exception e)
		{
		   return false;
		}
	}


	@Override
	public List<Category> retreiveCategory() 
	{
		try
		{
	
		   Session session = sessionFactory.openSession();
		   session.beginTransaction();
		   Query query = session.createQuery("from Category");
		   List<Category> list = query.list();
		   session.getTransaction().commit();
		   session.close();
		   return list;
		}
		catch(Exception e)
		{
		   System.out.println(e);
		}
		return null;
		
	}
    @Transactional
	@Override
	public boolean deleteCategory(Category category) 
	{
		try
		{
			   Session session = sessionFactory.openSession();
			   session.beginTransaction();
			   session.delete(category);
			   session.getTransaction().commit();
			   return true;
		}
		catch(Exception e)
		{
		return false;
		}
	}

	@Override
	public Category getCategory(int catId)
	{
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 Category category = (Category) session.get(Category.class, catId);
		 session.getTransaction().commit();
		 return category;
	}
    @Transactional
	@Override
	public boolean updateCategory(Category category)
	{
		try
		{
			   Session session = sessionFactory.openSession();
			   session.beginTransaction();
			   session.saveOrUpdate(category);
			   session.getTransaction().commit();
			   return true;
		}
		catch(Exception e)
		{
		       return false;
		}

	}

}
