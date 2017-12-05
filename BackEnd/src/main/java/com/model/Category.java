package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Category
{
	@Id
	@GeneratedValue
	private int catId;
	private String catName;
	private String catDesc;
	
	public int getCatId()
	{
		return catId;
	}
	public void setCatId(int catId) 
	{
		this.catId = catId;
	}
	public String getCatName() 
	{
		return catName;
	}
	public void setCatName(String catName)
	{
		this.catName = catName;
	}
	public String getCatDesc()
	{
		return catDesc;
	}
	public void setCatDesc(String catDesc) 
	{
		this.catDesc = catDesc;
	}
	
	
	/*public int getCatId() {
		return CatId;
	}
	public void setCatId(int catId) {
		this.CatId = catId;
	}
	public String getCatName() {
		return CatName;
	}
	public void setCatName(String catName) {
		this.CatName = catName;
	}
	public String getCatDesc() {
		return CatDesc;
	}
	public void setCatDesc(String catDesc) {
		this.CatDesc = catDesc;
	}
*/
	

}
