package com.test;

import static org.junit.Assert.*;

import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.dao.SupplierDao;
import com.model.SupplierModel;

public class SupplierTest {
    static SupplierDao supplierDao;
    
    @BeforeClass
    public static void initialize()
    {
    	AnnotationConfigApplicationContext appConfig = new AnnotationConfigApplicationContext();
		appConfig.scan("com");
		appConfig.refresh();
		SessionFactory sessionFactory = (SessionFactory) appConfig.getBean("sessionFactory");
		supplierDao = (SupplierDao)appConfig.getBean("Dao");
    }
	@Test
	public void test() {
	
		
		SupplierModel sm = new SupplierModel();
		sm.setSuppAddress("Bangalore");
		sm.setSuppId(23);
		sm.setSuppName("Shakthi");
		supplierDao.insertSupplier(sm);
	}

}
