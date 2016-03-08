/**
 * 
 */
package com.BudgetSpoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Priti
 *
 */
@Controller
public class firstPage {
	@RequestMapping("/welcome")
	public ModelAndView login() {
		return new ModelAndView("welcome", "message", "BudgetSpoons is here");
	}

}
