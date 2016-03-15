package com.BudgetSpoon.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.BudgetSpoon.dao.FavoriteDao;

@Controller
public class LoginSuccess {

	@RequestMapping(value = "/resultspage", method = RequestMethod.GET)
	public ModelAndView Account(Model model) {
		
		return new ModelAndView("resultspage", "command", new Favorite());
	}
	
	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public ArrayList<Favorite> registerFavorite(@ModelAttribute("SpringWeb")Favorite f, Model model ) {
		FavoriteDao fDao = new FavoriteDao();
		System.out.println(model.addAttribute(f.getUser_id() +"this is it"));
		
	 ArrayList<Favorite> ls = new ArrayList<Favorite>();
	 ls.add(f);
	 
	     fDao.addFavorites(ls);
	     return ls;
	}
}
