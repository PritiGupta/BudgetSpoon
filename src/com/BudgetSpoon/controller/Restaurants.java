package com.BudgetSpoon.controller;

public class Restaurants {

	private int id;
	private String name;
	private String streetAddress;
	private String cityAddress;
	private String zipcodeAddress;
	private String cuisine;
	private double breakfast_price;
	private double lunch_price;
	private double dinner_price;
	private String emailAddress;
	private String password;
	private String website;

	
	public Restaurants() {}

	public Restaurants(String name, String streetAddress, String cityAddress, String zipcodeAddress, String cuisine) {
		this.name = name;
		this.streetAddress = streetAddress;
		this.cityAddress = cityAddress;
		this.zipcodeAddress = zipcodeAddress;
		this.cuisine = cuisine;
	}
	
	public Restaurants(String name, String streetAddress, String cityAddress, String zipcodeAddress, String cuisine,
			double breakfast_price, double lunch_price, double dinner_price, 
			String emailAddress, String password, String website) {
		this(name, streetAddress, cityAddress, zipcodeAddress,cuisine);
		this.breakfast_price = breakfast_price;
		this.lunch_price = lunch_price;
		this.dinner_price = dinner_price;
		this.emailAddress = emailAddress;
		this.password = password;
		this.website = website;
	}
	
	
	public double getBreakfast_price() {
		return breakfast_price;
	}

	public void setBreakfast_price(double breakfast_price) {
		this.breakfast_price = breakfast_price;
	}

	public double getLunch_price() {
		return lunch_price;
	}

	public void setLunch_price(double lunch_price) {
		this.lunch_price = lunch_price;
	}

	public double getDinner_price() {
		return dinner_price;
	}

	public void setDinner_price(double dinner_price) {
		this.dinner_price = dinner_price;
	}

	public String getCuisine() {
		return cuisine;
	}

	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getCityAddress() {
		return cityAddress;
	}

	public void setCityAddress(String cityAddress) {
		this.cityAddress = cityAddress;
	}

	public String getZipcodeAddress() {
		return zipcodeAddress;
	}

	public void setZipcodeAddress(String zipcodeAddress) {
		this.zipcodeAddress = zipcodeAddress;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

}
