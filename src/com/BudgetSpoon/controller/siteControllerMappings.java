/**
 * 
 */
package com.BudgetSpoon.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.BudgetSpoon.dao.FavoriteDao;

/**
 * @author Priti
 *
 */
@Controller
public class siteControllerMappings {

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
