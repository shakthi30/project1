package com.configuration;

import java.util.Properties;


import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.dao.Dao;
import com.dao.DaoImplementation;
import com.model.User;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.configuration")

public class HibernateConfig 
{
	
	
	public DataSource getH2()
	{

		DriverManagerDataSource dt = new DriverManagerDataSource();
		dt.setDriverClassName("org.h2.Driver");
		dt.setUrl("jdbc:h2:tcp://localhost/~/test");
		dt.setUsername("sa");
		dt.setPassword("");
		System.out.println("connection established!!");
		return dt;
	}

	
	@Bean(name="sessionFactory")
	public SessionFactory getSessionFac()
	{
		System.out.println("in session factory");
		Properties hibernateProperties = new Properties();
		hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
		hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		
		LocalSessionFactoryBuilder sb = new LocalSessionFactoryBuilder(getH2());
		sb.addProperties(hibernateProperties);
		SessionFactory sessionFactory = sb.buildSessionFactory();
		sb.addAnnotatedClass(User.class);
		System.out.println("war"+sessionFactory);
		return sessionFactory;
	}


	
	//@Bean(name="hibernatetransactionmanager")
	//public HibernateTransactionManager getTransaction(SessionFactory sessionFactory) 
//	{
	//	HibernateTransactionManager tm = new HibernateTransactionManager(sessionFactory);
		//return tm;
	//}
}
