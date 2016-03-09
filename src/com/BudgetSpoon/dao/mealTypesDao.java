package com.BudgetSpoon.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import com.BudgetSpoon.controller.mealTypes;

public class mealTypesDao {

	public List<mealTypes> getMealTypesList() {
		
		Session session = (new Configuration().configure().buildSessionFactory()).openSession();

		session.beginTransaction();
		
		Criteria criteria = session.createCriteria(mealTypes.class);
		
		List<mealTypes> mealTypesList = (List<mealTypes>) criteria.list();
		return mealTypesList;
	}

}
