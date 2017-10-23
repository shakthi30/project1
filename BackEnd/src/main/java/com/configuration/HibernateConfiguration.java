package com.configuration;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.model.Category;
import com.model.Product;
import com.model.Supplier;
import com.model.User;

@Configuration
@EnableTransactionManagement
@ComponentScan("com")
public class HibernateConfiguration 
{
	@Bean("dataSource")
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
		sb.addAnnotatedClass(User.class);
		sb.addAnnotatedClass(Category.class);
		sb.addAnnotatedClass(Product.class);
		sb.addAnnotatedClass(Supplier.class);
		System.out.println(sb);
		SessionFactory sessionFactory = sb.buildSessionFactory();
		return sessionFactory;
	}
	@Bean(name="hibernatetransactionmanager")
	public HibernateTransactionManager getTransaction(SessionFactory sessionFactory) 
	{
	      HibernateTransactionManager tm = new HibernateTransactionManager(sessionFactory);
		  return tm;
    }
}
