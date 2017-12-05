package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Order;
import com.model.User;

@Repository("orderDao")
public class OrderDaoImplementation implements OrderDao
{
	@Autowired
	SessionFactory sessionFactory;
	
	public OrderDaoImplementation(SessionFactory sessionFactory)
	{
		super();
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addOrder(Order order)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.persist(order);
		session.getTransaction().commit();
		
	}


	public List<Order> getOrderById(String email) 
	{
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Order where email = '"+email+"'");
        List<Order> orderList = query.list();
        session.getTransaction().commit();
		return orderList;
	}

}
