package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Category;
import com.model.Product;

@Repository("productDao")
public class ProductDaoImplementation  implements ProductDao
{
	@Autowired
    SessionFactory sessionFactory;
	
	@Override
	public boolean insertProduct(Product product) 
	{
		try
		{
	    Session session = sessionFactory.openSession();
	    session.beginTransaction();
	    session.saveOrUpdate(product);
	    session.getTransaction().commit();
	    return true;
		}
		catch(Exception e)
		{
		return false;
		}
	}

	@Override
	public List<Product> retreiveProduct() 
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Product");
		List<Product> list = query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}

	@Override
	public boolean deleteProduct(Product product) 
	{
	    Session session = sessionFactory.openSession();
	    session.beginTransaction();
	    session.delete(product);
	    session.getTransaction().commit();
	    session.close();
		return true;
	}

	@Override
	public Product getProduct(int catId)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
	    Product product = (Product) session.get(Product.class,catId);
	    session.getTransaction().commit();
		return product;
	}
    @Transactional
	@Override
	public boolean updateProduct(Product product)
	{
		try
		{
			   Session session = sessionFactory.openSession();
			   session.beginTransaction();
			   session.update(product);
			   session.getTransaction().commit();
			   return true;
		}
		catch(Exception e)
		{
		       return false;
		}
		
	}

	@Override
	public List<Product> getProductByCategoryName(String catName)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Product where catName = :Name");
		query.setParameter("Name", catName);
		List<Product> product = query.list();
		return product;
	}

}
