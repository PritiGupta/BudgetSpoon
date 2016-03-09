package com.BudgetSpoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class testFormFields {

	@RequestMapping("/resultsPage1")
	public ModelAndView listFormData(@RequestParam("meal") String meal) {
		
		return new ModelAndView("resultsPage1", "mealType", meal);
	}
}
