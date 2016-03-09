package com.BudgetSpoon.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import com.BudgetSpoon.controller.Categories;

public class CategoriesDao {

	public List<Categories> getCategoriesList() {
		
		Session session = (new Configuration().configure().buildSessionFactory()).openSession();

		session.beginTransaction();
		
		Criteria criteria = session.createCriteria(Categories.class);
		
		List<Categories> categoriesList = (List<Categories>) criteria.list();
		return categoriesList;
	}
}
