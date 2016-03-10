/**
 * 
 */
package com.BudgetSpoon.controller;

import java.util.ArrayList;

import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.Transaction;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.BudgetSpoon.dao.RestaurantDao;

/**
 * @author Priti
 *
 */
@Controller
public class Signup {
			
	@RequestMapping(value = "/Signup", method = RequestMethod.GET)
		public ModelAndView signUp(Model model) {
		
			return new ModelAndView("Signup", "command", new Restaurants());
		}

	@RequestMapping(value = "/Signupsuccess", method = RequestMethod.GET)
	public ArrayList<Restaurants> registerRestaurant(@ModelAttribute("SpringWeb")Restaurants rest, Model model ) {
		RestaurantDao restDao = new RestaurantDao();
		System.out.println(model.addAttribute(rest.getWebsite() +"this is it"));
		
     ArrayList<Restaurants> ls = new ArrayList<Restaurants>();
     ls.add(rest);
     
         restDao.addRestaurants(ls);
         return ls;
	}
	
}


