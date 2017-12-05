package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Supplier {
	@Id
	@GeneratedValue
	private int suppId;
	
	private String suppName;
	private String suppAddress;
	private String suppEmail;
	private String suppPhone;

	public String getSuppName() {
		return suppName;
	}

	public void setSuppName(String suppName) {
		this.suppName = suppName;
	}

	public String getSuppPhone() {
		return suppPhone;
	}

	public void setSuppPhone(String suppPhone) {
		this.suppPhone = suppPhone;
	}

	public String getSuppEmail() {
		return suppEmail;
	}

	public void setSuppEmail(String suppEmail) {
		this.suppEmail = suppEmail;
	}

	public int getSuppId() {
		return suppId;
	}

	public void setSuppId(int suppId) {
		this.suppId = suppId;
	}

	public String getSuppAddress() {
		return suppAddress;
	}

	public void setSuppAddress(String suppAddress) {
		this.suppAddress = suppAddress;
	}

}
