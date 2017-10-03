package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.User;
import com.dao.Dao;
@Repository
public class DaoImplementation implements Dao
{
@Autowired
SessionFactory sessionFactory;

@Transactional
@Override
public void insertUser(User user)
{
	// TODO Auto-generated method stub
	try
	{
	sessionFactory.getCurrentSession().saveOrUpdate(user);
	
	}
	catch(Exception e)
	{
		
	}
}
}
