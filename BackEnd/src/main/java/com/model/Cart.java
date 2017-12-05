package com.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Cart implements Serializable
{
	private static final long serialVersionUID = 1L;
    
	@Id
	@GeneratedValue
	private int cartId;
	private int cartProductId;
	@JoinColumn(name="email")
	@OneToOne(fetch=FetchType.LAZY)
	private User cartUserDetails;
	private String cartProdName;
	private Double cartPrice;
	private int cartQnty;
	private String cartImg;
	
	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getCartProductId() {
		return cartProductId;
	}

	public void setCartProductId(int cartProductId) {
		this.cartProductId = cartProductId;
	}

	public User getCartUserDetails() {
		return cartUserDetails;
	}

	public void setCartUserDetails(User cartUserDetails) {
		this.cartUserDetails = cartUserDetails;
	}

	public String getCartProdName() {
		return cartProdName;
	}

	public void setCartProdName(String cartProdName) {
		this.cartProdName = cartProdName;
	}

	public Double getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(Double cartPrice) {
		this.cartPrice = cartPrice;
	}

	public int getCartQnty() {
		return cartQnty;
	}

	public void setCartQnty(int cartQnty) {
		this.cartQnty = cartQnty;
	}

	public String getCartImg() {
		return cartImg;
	}

	public void setCartImg(String cartImg) {
		this.cartImg = cartImg;
	}

	public Cart(int cartProductId,User cartUserDetails,Double cartPrice,int cartQnty)
	{
	
		this.cartPrice= cartPrice;
		this.cartProductId= cartProductId;
		this.cartQnty=cartQnty;
		this.cartUserDetails=cartUserDetails;
	}
	public Cart()
	{
		super();
		System.out.println("indefault constructor");
	}
}
