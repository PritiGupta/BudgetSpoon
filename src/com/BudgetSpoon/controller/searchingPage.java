/**
 * 
 */
package com.BudgetSpoon.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Priti
 *
 */
@Controller
public class searchingPage {
	
	@RequestMapping("search")
	public ModelAndView searchByMealType(@RequestParam("meal") String mealChoice) {
		
		ArrayList<Restaurants> results = new ArrayList<Restaurants>();
		Session session = (new Configuration().configure().buildSessionFactory()).openSession();

		session.beginTransaction();
		
		Criteria criteria = session.createCriteria(Restaurants.class);
		
		if(mealChoice.equalsIgnoreCase("breakfast")) {
			criteria.add(Restrictions.isNotNull("breakfast_price"));
			results = (ArrayList<Restaurants>)criteria.list();
		}
		
		return new ModelAndView("resultspage", "restList", results);
	}

}
