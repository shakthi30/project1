package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.SupplierModel;

@Repository("Dao")
public class SupplierDaoImpl implements SupplierDao
{
	@Autowired
	SessionFactory sessionFactory;
	
    @Transactional
	@Override
	public boolean insertSupplier(SupplierModel supplierModel) 
    {
    	try
    	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(supplierModel);
		session.getTransaction().commit();
		return true;
    	}
    	catch(Exception e)
    	{
		return false;
    	}
    	
    	}

}
