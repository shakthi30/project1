package com.dao;

import java.util.List;

import com.model.Order;
import com.model.User;

public interface OrderDao 
{
   public void addOrder(Order order);
   public List<Order> getOrderById(String email);
}
