//This file tests our Dao file out by seeing if it is connecting with the database and printing out results from 
//the corresponding table.

package com.BudgetSpoon.controller;

import java.util.ArrayList;
import java.util.List;

import com.BudgetSpoon.dao.AveragesDao;
import com.BudgetSpoon.dao.CategoriesDao;
import com.BudgetSpoon.dao.RestaurantDao;
import com.BudgetSpoon.dao.mealTypesDao;

public class testHibernate {

	public static void main(String[] args) {
		
		//Create an object for the RestaurantDao class (and each of the other ***Dao classes)
		RestaurantDao restDao = new RestaurantDao();
		CategoriesDao catsDao = new CategoriesDao();
		mealTypesDao mealsDao = new mealTypesDao();
		AveragesDao avgsDao = new AveragesDao();
		
		//use the getRestaurantList method which returns the list of restaurants. Store this list inside of a variable.
		List<Restaurants> resultsRestaurants = restDao.getRestaurantList();
		List<Categories> resultsCategories = catsDao.getCategoriesList();
		List<mealTypes> resultsMealTypes = mealsDao.getMealTypesList();
		List<Averages> resultsAverages = avgsDao.getAveragesList();
		
		//use the .get() method to obtain a restaurant object from the list, and then call the restaurant
		//object's getName() method to obtain the name of the restaurant.
		System.out.println("Running restaurants table....");
		
		System.out.println(resultsRestaurants.get(0).getName() + ", " + resultsRestaurants.get(0).getAddress());
		System.out.println();
		
		System.out.println("Running categories table....");
		
		System.out.println(resultsCategories.get(0).getCategories_id() + ", " + resultsCategories.get(0).getCategories_name());
		System.out.println();
		
		//Below tables are not populated yet. But once populated, will work to print out info from that table
		System.out.println("Running meal_types table....");
		
		System.out.println(resultsMealTypes.get(0).getType_id() + ", " + resultsMealTypes.get(0).getType_name());
		System.out.println();
		
		System.out.println("Running price_average table....");
		
		System.out.println("restaurant_id: " + resultsAverages.get(0).getRestaurant_id() + ", " + "\n"
				+ "base_average: " + resultsAverages.get(0).getBase_average() + ", " + "\n"
				+ "meal_average: " + resultsAverages.get(0).getMeal_average() + ", " + "\n" 
				+ "type_average: " + resultsAverages.get(0).getType_average()); 
		System.out.println();
		
		
		
		List<Restaurants> myList = new ArrayList<Restaurants>();
		myList.add(new Restaurants(1, "Bungy Food", "12808 Pentfield", "Mexican"));
		myList.add(new Restaurants(2, "Kohl's Kitchen", "4280 Griswold", "Asian"));
		
		
		restDao.addRestaurants(myList);
		
	}

}
