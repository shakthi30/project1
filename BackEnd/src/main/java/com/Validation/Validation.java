package com.Validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;
@Service("validation")
public class Validation
{
	
 public boolean isEmailValid(String email)
 {
	 Pattern VALID_EMAIL_ADDRESS_REGEX = 
			    Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
		Matcher valid = VALID_EMAIL_ADDRESS_REGEX.matcher(email);
		boolean b = valid.matches();
		return b;
 }
 public boolean isPasswordValid(String pass)
 {
	 Pattern VALID_PASSWORD_REGEX = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$");
	 Matcher valid = VALID_PASSWORD_REGEX.matcher(pass);
	 boolean b = valid.matches();
			 return b;
 }
 public boolean isNameValid(String name)
 {
	 Pattern VALID_NAME_REGEX = Pattern.compile("^[a-zA-Z\\s]+");
	 Matcher valid = VALID_NAME_REGEX.matcher(name);
	 boolean b = valid.matches();
	 return b;
 }
 public boolean isPhoneValid(String phone)
 {
	 Pattern VALID_PHONE_REGEX = Pattern.compile("\\d{10}");
	 Matcher valid = VALID_PHONE_REGEX.matcher(phone);
	 boolean b = valid.matches();
	 return b;
 }
 public boolean isAddressValid(String address)
 {
	 Pattern VALID_Address_REGEX = Pattern.compile("([a-zA-Z0-9\\,\\.\\-\\s]+[0-9]{5})+");
	 Matcher valid = VALID_Address_REGEX.matcher(address);
	 boolean b = valid.matches();
	 return b;
 }
 public boolean isNumberValid(String stock)
 {
	 Pattern VALID_NUMBER_REGEX = Pattern.compile("\\d{1,}+");
	 Matcher valid = VALID_NUMBER_REGEX.matcher(stock);
	 boolean b = valid.matches();
	 return b;
 }
 public boolean isPriceValid(String price)
 {
	 Pattern VALID_PRICE_REGEX = Pattern.compile("[0-9]+([,.][0-9]{1,2})?");
	 Matcher valid = VALID_PRICE_REGEX.matcher(price);
	 boolean b = valid.matches();
	 return b;
 }
}
