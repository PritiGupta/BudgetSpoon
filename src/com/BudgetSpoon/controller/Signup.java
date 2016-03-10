/**
 * 
 */
package com.BudgetSpoon.controller;

import java.util.ArrayList;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Priti
 *
 */
@Controller
public class Signup {
	
		
	@RequestMapping(value = "/Signup", method = RequestMethod.GET)
		public ModelAndView signUp(Model model) {
			
			ArrayList<Restaurants> results = new ArrayList<Restaurants>();
			Session session = (new Configuration().configure().buildSessionFactory()).openSession();

			session.beginTransaction();
			
			Criteria criteria = session.createCriteria(Restaurants.class);
			
//			
			return new ModelAndView("success", "message", new Signup());
		}

	}


