/**
 * 
 */
package com.BudgetSpoon.controller;

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

/**
 * @author Priti
 *
 */
@Controller
public class searchingPage {

	@RequestMapping("search")
	public ModelAndView searchByMealType(@RequestParam("meal") String mealChoice,
			@RequestParam("price") double priceChoice, @RequestParam("numofdiners") int numberofdiners,
			HttpSession httpsession) {

		ArrayList<Restaurants> results = new ArrayList<Restaurants>();

//			Session session = (new Configuration().configure().buildSessionFactory()).openSession();
//	
//			session.beginTransaction();
			httpsession.setAttribute("numberofdiners", numberofdiners);
			httpsession.setAttribute("mealChoice", mealChoice);
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
