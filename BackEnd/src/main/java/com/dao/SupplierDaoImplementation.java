package com.dao;

import java.util.List;
import com.model.Supplier;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("supplierDao")
public class SupplierDaoImplementation implements SupplierDao
{

	@Autowired
    SessionFactory sessionFactory;
	
	@Override
	public boolean insertSupplier(Supplier supplier)
	{
		
		try
		{
	    Session session = sessionFactory.openSession();
	    session.beginTransaction();
	    session.save(supplier);
	    session.getTransaction().commit();
	    return true;
		}
		catch(Exception e)
		{
		return false;
		}
	}

	@Override
	public List<Supplier> retreiveSupplier()
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Supplier");
		List<Supplier> list = query.list();
		session.getTransaction().commit();
		session.close();
		return list;
		
	}

	@Override
	public boolean deleteSupplier(Supplier supplier)
	{
		
		    Session session = sessionFactory.openSession();
		    session.beginTransaction();
		    session.delete(supplier);
		    session.getTransaction().commit();
		    session.close();
			return true;
	}

	@Override
	public Supplier getSupplier(int suppId)
	{
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
	    Supplier supplier = (Supplier) session.get(Supplier.class,suppId);
	    session.getTransaction().commit();
		return supplier;
	}

	@Override
	public boolean updateSupplier(Supplier supplier)
	{
	
		try
		{
			   Session session = sessionFactory.openSession();
			   session.beginTransaction();
			   session.saveOrUpdate(supplier);
			   session.getTransaction().commit();
			   return true;
		}
		catch(Exception e)
		{
		       return false;
		}
	}

}
