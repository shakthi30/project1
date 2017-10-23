package com.dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDao;

import com.model.User;

@Repository("userDao")
public class UserDaoImplementaion implements UserDao
{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
    @Override
	public void addUser(User user)
	{
		
    	try
    	{
    	sessionFactory.getCurrentSession().saveOrUpdate(user);
    	
    	}
    	catch(Exception e)
    	{
    		
    	}
	}

	
	public List<User> retreiveuser() 
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery("from User");
		List<User> list = query.list();
		session.getTransaction().commit();
		return list;
	}



	

}