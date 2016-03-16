package com.BudgetSpoon.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class login {

	@RequestMapping(value = "userLogin", method = RequestMethod.POST)
	public ModelAndView userLogin(@RequestParam("username") String username,
			@RequestParam("password") String password) {

		try {

			String url = "jdbc:mysql://budgetspoondb.cm6l5hslk6or.us-west-2.rds.amazonaws.com:3306/BudgetSpoonDB";
			String user = "budgetspoon";
			String database_password = "gcbudgetspoon";
			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection myConn = DriverManager.getConnection(url, user, database_password);

			// Use prepared statement below: This allows us to leave the value
			// of email and password unspecified,
			// and take the input from the form fields to plug into the mySQL
			// statement
			PreparedStatement pst = myConn
					.prepareStatement("SELECT username,password FROM users WHERE username=? AND password=?");
			pst.setString(1, username);
			pst.setString(2, password);
			// Execute the mySQL prepared statement to query our table
			ResultSet myRs = pst.executeQuery();

			if (myRs.next()) {
				
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
				
				// Below just says to keep querying through to the next line
				// until
				// we find the match.
				// If there is a match, take the user to the loginSuccess page.
				// Else, send them to loginFailed page.

				return new ModelAndView("loginSuccess", "favRest", favRestResults);
				
			} else
				return new ModelAndView("loginFailed", "msg", "Login Failed");

		} catch (Exception e) {
			return new ModelAndView("loginFailed", "msg",
					"Connection Error! Please Check your database connection and try again.");
		}

	}

}
