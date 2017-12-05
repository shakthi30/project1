package com.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.model.User;


public interface UserDao 
{	
	public void addUser(User user);
	public List<User> retreiveuser();
	public User getUserByEmail(String email); 
}
