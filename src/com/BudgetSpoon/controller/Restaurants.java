package com.BudgetSpoon.controller;

public class Restaurants {

	private int id;
	private String name;
	private String address;
	private String cuisine;
	private double breakfast_price;
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

	private double lunch_price;
	private double dinner_price;
	public Restaurants() {}

	public Restaurants(int id, String name, String address, String cuisine) {
		this.id = id;
		this.name = name;
		this.address = address;
		this.cuisine = cuisine;
	}

	public String getCuisine() {
		return cuisine;
	}

	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

}
