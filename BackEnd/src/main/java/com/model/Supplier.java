package com.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class Supplier 
{
	@Id
	private int suppId;
	private String suppName;
	private String suppAddress;
	
	public int getSuppId() 
	{
		return suppId;
	}
	public void setSuppId(int suppId) 
	{
		this.suppId = suppId;
	}
	public String getSuppName() 
	{
		return suppName;
	}
	public void setSuppName(String suppName) 
	{
		this.suppName = suppName;
	}
	public String getSuppAddress()
	{
		return suppAddress;
	}
	public void setSuppAddress(String suppAddress) 
	{
		this.suppAddress = suppAddress;
	}

}
