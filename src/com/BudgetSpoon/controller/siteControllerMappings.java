/**
 * 
 */
package com.BudgetSpoon.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.BudgetSpoon.dao.FavoriteDao;

/**
 * @author Priti
 *
 */
@Controller
public class siteControllerMappings {

	@RequestMapping("index")
	public String goToMainPage() {
		return "index";
	}
	
	@RequestMapping("search")
	public ModelAndView searchByMealType(@RequestParam("meal") String mealChoice,
			@RequestParam("price") double priceChoice, @RequestParam("numofdiners") int numberofdiners,
			HttpSession httpsession) {

		httpsession.setAttribute("price", priceChoice);
		httpsession.setAttribute("numberofdiners", numberofdiners);
		httpsession.setAttribute("mealChoice", mealChoice);
		
		ArrayList<Restaurants> results = new ArrayList<Restaurants>();

//			Session session = (new Configuration().configure().buildSessionFactory()).openSession();
//	
//			session.beginTransaction();
//			Criteria criteria = session.createCriteria(Restaurants.class);
//	
//			if (mealChoice.equalsIgnoreCase("breakfast")) {
//				if (priceChoice.equalsIgnoreCase("$10-20")) {
//					criteria.add(Restrictions.between("breakfast_price", 10.00, 20.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				} else if (priceChoice.equalsIgnoreCase("$20-30")) {
//					criteria.add(Restrictions.between("breakfast_price", 20.00, 30.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				} else if (priceChoice.equalsIgnoreCase("$30-40")) {
//					criteria.add(Restrictions.between("breakfast_price", 30.00, 40.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				} else if (priceChoice.equalsIgnoreCase("$40-50")) {
//					criteria.add(Restrictions.between("breakfast_price", 40.00, 50.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				}
//			} else if (mealChoice.equalsIgnoreCase("lunch")) {
//				if (priceChoice.equalsIgnoreCase("$10-20")) {
//					criteria.add(Restrictions.between("lunch_price", 10.00, 20.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				} else if (priceChoice.equalsIgnoreCase("$20-30")) {
//					criteria.add(Restrictions.between("lunch_price", 20.00, 30.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				} else if (priceChoice.equalsIgnoreCase("$30-40")) {
//					criteria.add(Restrictions.between("lunch_price", 30.00, 40.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				} else if (priceChoice.equalsIgnoreCase("$40-50")) {
//					criteria.add(Restrictions.between("lunch_price", 40.00, 50.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				}
//			} else if (mealChoice.equalsIgnoreCase("dinner")) {
//				if (priceChoice.equalsIgnoreCase("$10-20")) {
//					criteria.add(Restrictions.between("dinner_price", 10.00, 20.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				} else if (priceChoice.equalsIgnoreCase("$20-30")) {
//					criteria.add(Restrictions.between("dinner_price", 20.00, 30.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				} else if (priceChoice.equalsIgnoreCase("$30-40")) {
//					criteria.add(Restrictions.between("dinner_price", 30.00, 40.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				} else if (priceChoice.equalsIgnoreCase("$40-50")) {
//					criteria.add(Restrictions.between("dinner_price", 40.00, 50.00));
//					results = (ArrayList<Restaurants>) criteria.list();
//				}
//			}
		double pricePerDiner = priceChoice / numberofdiners;
		
		String mealOption = getResultForMeal(mealChoice);
		results = getResultsForPrice(pricePerDiner, mealOption);
		return new ModelAndView("resultspage", "restList", results);
	}
	
	@RequestMapping("addFavorite")
	public ModelAndView addRestToFavs(@RequestParam("favorite") int restaurantId, HttpSession httpsession) {
		
		String username = (String) httpsession.getAttribute("username");
		Connection myConn = establishDatabaseConnection();
		
		try {
			PreparedStatement pst = myConn.prepareStatement("SELECT username,restaurant_id FROM favorite WHERE username=? AND restaurant_id=?");
			pst.setString(1, username);
			pst.setInt(2, restaurantId);
			// Execute the mySQL prepared statement to query our table
			ResultSet myRs = pst.executeQuery();
			
			if(!myRs.next()) {
				FavoriteDao favDao = new FavoriteDao();
				Favorite userFav = new Favorite(username, restaurantId);
				favDao.addFavorites(userFav);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		double priceChoice = (double) httpsession.getAttribute("price");
		int numberofdiners = (int) httpsession.getAttribute("numberofdiners");
		String mealChoice = (String) httpsession.getAttribute("mealChoice");
		
		ArrayList<Restaurants> results = new ArrayList<Restaurants>();
		double pricePerDiner = priceChoice / numberofdiners;
		
		String mealOption = getResultForMeal(mealChoice);
		results = getResultsForPrice(pricePerDiner, mealOption);
		return new ModelAndView("resultspage", "restList", results);
	}

	
	@RequestMapping(value = "userLogin", method = RequestMethod.POST)
	public ModelAndView userLogin(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession httpsession) {
		
		httpsession.setAttribute("username", username);
		Connection myConn = establishDatabaseConnection();
		

//			String url = "jdbc:mysql://budgetspoondb.cm6l5hslk6or.us-west-2.rds.amazonaws.com:3306/BudgetSpoonDB";
//			String user = "budgetspoon";
//			String database_password = "gcbudgetspoon";
//			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
//			Connection myConn = DriverManager.getConnection(url, user, database_password);

			// Use prepared statement below: This allows us to leave the value
			// of email and password unspecified,
			// and take the input from the form fields to plug into the mySQL
			// statement
			
		try {
			PreparedStatement pst = myConn
					.prepareStatement("SELECT username,password FROM users WHERE username=? AND password=?");
			pst.setString(1, username);
			pst.setString(2, password);
			// Execute the mySQL prepared statement to query our table
			ResultSet myRs = pst.executeQuery();

			if (myRs.next()) {
				
//				ArrayList<Favorite> results = new ArrayList<Favorite>();
//				
//				Session session = (new Configuration().configure().buildSessionFactory()).openSession();
//				session.beginTransaction();
//				Criteria criteria = session.createCriteria(Favorite.class);
//
//				//username = "bryan"; // whatever you want here.
//				criteria.add(Restrictions.like("username", username));
//				results = (ArrayList<Favorite>) criteria.list();
//
//				ArrayList<Integer> favoritedRestaurants = new ArrayList<Integer>();
//				for (int i = 0; i < results.size(); i++) {
//					favoritedRestaurants.add(results.get(i).getRestaurant_id());
//				}
//
//				ArrayList<Restaurants> favRestResults = new ArrayList<Restaurants>();
//				
//			
//				
//						
//				Statement pst1 = myConn.createStatement();
//				String favRest = favoritedRestaurants.toString();
//				int end = favRest.lastIndexOf("]");
//				favRest = favRest.substring(1, end);
//				
//				ResultSet restResults = pst1.executeQuery("select * from restaurants where id in ("+favRest+")");
//				
//				while (restResults.next())
//				{
//					
//					Restaurants favRestObject = new Restaurants(restResults.getString(2), restResults.getString(3), restResults.getString(4),
//							restResults.getString(5), restResults.getString(6), restResults.getString(7), restResults.getDouble(8),
//							restResults.getDouble(9), restResults.getDouble(10), restResults.getString(11), restResults.getString(12),
//							restResults.getString(13));
//					favRestResults.add(favRestObject);
//					
//					
//				}
				
				// Below just says to keep querying through to the next line
				// until
				// we find the match.
				// If there is a match, take the user to the loginSuccess page.
				// Else, send them to loginFailed page.

				return new ModelAndView("index", "favRest", username);
				
			} else
				return new ModelAndView("loginFailed", "msg", "Login Failed");

		} catch (Exception e) {
			return new ModelAndView("loginFailed", "msg",
					"Connection Error! Please Check your database connection and try again.");
		}

	}

	@RequestMapping(value = "userFavorites")
	public ModelAndView showFavorites(HttpSession httpsession) {
		
		String username = (String) httpsession.getAttribute("username");
		Connection myConn = establishDatabaseConnection();
		
		ArrayList<Favorite> results = new ArrayList<Favorite>();
		
		Session session = (new Configuration().configure().buildSessionFactory()).openSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Favorite.class);

		//username = "bryan"; // whatever you want here.
		criteria.add(Restrictions.like("username", username));
		results = (ArrayList<Favorite>) criteria.list();

		ArrayList<Integer> favoritedRestaurants = new ArrayList<Integer>();
		for (int i = 0; i < results.size(); i++) {
			favoritedRestaurants.add(results.get(i).getRestaurant_id());
		}

		ArrayList<Restaurants> favRestResults = new ArrayList<Restaurants>();
		
	
		
				
		try {
			Statement pst1 = myConn.createStatement();
			String favRest = favoritedRestaurants.toString();
			int end = favRest.lastIndexOf("]");
			favRest = favRest.substring(1, end);
		
			ResultSet restResults = pst1.executeQuery("select * from restaurants where id in ("+favRest+")");
		
			while (restResults.next())
			{
				Restaurants favRestObject = new Restaurants(restResults.getString(2), restResults.getString(3), restResults.getString(4),
						restResults.getString(5), restResults.getString(6), restResults.getString(7), restResults.getDouble(8),
						restResults.getDouble(9), restResults.getDouble(10), restResults.getString(11), restResults.getString(12),
						restResults.getString(13));
				
				favRestResults.add(favRestObject);
			}
			
			return new ModelAndView("userFavorites", "favRest", favRestResults);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public Connection establishDatabaseConnection() {
		try {
			String url = "jdbc:mysql://budgetspoondb.cm6l5hslk6or.us-west-2.rds.amazonaws.com:3306/BudgetSpoonDB";
			String user = "budgetspoon";
			String database_password = "gcbudgetspoon";
			Class.forName("com.mysql.jdbc.Driver");
			Connection myConn = DriverManager.getConnection(url, user, database_password);
			return myConn;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	public String getResultForMeal(String mealChoice) {
		
		if (mealChoice.equalsIgnoreCase("breakfast")) {
			return "breakfast_price";
		} else if (mealChoice.equalsIgnoreCase("lunch")) {
			return "lunch_price";
		} else if (mealChoice.equalsIgnoreCase("dinner")) {
			return "dinner_price";
		} else {
			return null;
		}

	}
	
	public ArrayList<Restaurants> getResultsForPrice (double pricePerDiner, String meal) {
		ArrayList<Restaurants> results = new ArrayList<Restaurants>();
		Session session = (new Configuration().configure().buildSessionFactory()).openSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Restaurants.class);
		
//		if (priceChoice.equalsIgnoreCase("$10-20")) {
			criteria.add(Restrictions.between(meal, 0.01, pricePerDiner));
			results = (ArrayList<Restaurants>) criteria.list();
//		} else if (priceChoice.equalsIgnoreCase("$20-30")) {
//			criteria.add(Restrictions.between(meal, 20.00, 30.00));
//			results = (ArrayList<Restaurants>) criteria.list();
//		} else if (priceChoice.equalsIgnoreCase("$30-40")) {
//			criteria.add(Restrictions.between(meal, 30.00, 40.00));
//			results = (ArrayList<Restaurants>) criteria.list();
//		} else if (priceChoice.equalsIgnoreCase("$40-50")) {
//			criteria.add(Restrictions.between(meal, 40.00, 50.00));
//			results = (ArrayList<Restaurants>) criteria.list();
//		}
		return results;
	}
	
	
}
