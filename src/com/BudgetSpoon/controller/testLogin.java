package com.BudgetSpoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.sql.*;

@Controller
public class testLogin {

	@RequestMapping(value= "/LoginForm", method = RequestMethod.GET)
	public ModelAndView validateLoginForm() {
		
		return new ModelAndView("LoginForm");
	}
	
	@RequestMapping(value="/loginSuccess.html", method = RequestMethod.POST)
	public ModelAndView submitAdmissionsForm(@RequestParam("email") String email, 
			@RequestParam("password") String password) {
		
		
		String infoFromDatabase = "Email: " + email 
				+ " Password: " + password;

		try {
			String url="jdbc:mysql://budgetspoondb.cm6l5hslk6or.us-west-2.rds.amazonaws.com:3306/BudgetSpoonDB";
			
			String user="budgetspoon";
			
			String database_password="gcbudgetspoon";
			
			Class.forName("com.mysql.jdbc.Driver"); //	MySQL database connection
			
			Connection myConn = DriverManager.getConnection(url, user, database_password);
			
			PreparedStatement pst = myConn.prepareStatement("SELECT email,password FROM business_users WHERE email=? AND password=?");
			
			pst.setString(1, email);
			pst.setString(2, password);
			
			
			ResultSet myRs = pst.executeQuery();
			if(myRs.next())
				return new ModelAndView("loginSuccess", "msg", "Information validated");
			else
				return new ModelAndView("loginSuccess", "msg", "Login Failed");
			
		} 
		catch(Exception e) {
			return new ModelAndView("loginSuccess", "msg", "Login Failed");
		}
		
	}
	
}
