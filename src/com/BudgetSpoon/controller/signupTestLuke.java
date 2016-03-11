package com.BudgetSpoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class signupTestLuke {
	
	@RequestMapping("Signupsuccess")
	public ModelAndView addRestaurantToDB(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("streetAddress") String streetAdd, @RequestParam("cityAddress") String cityAdd,
			@RequestParam("stateAddress") String stateAdd, @RequestParam("zipcodeAddress") String zipAdd,
			@RequestParam("emailAddress") String email, @RequestParam("website") String website,
			@RequestParam("cuisine") String cuisine, @RequestParam("breakfast_price") double breakfastPrice,
			@RequestParam("lunch_price") double lunchPrice, @RequestParam("dinner_price") double dinnerPrice){
		
		
		
		return null;
		
	}
	
}
