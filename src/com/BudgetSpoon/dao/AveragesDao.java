package com.BudgetSpoon.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import com.BudgetSpoon.controller.Averages;

public class AveragesDao {

	public List<Averages> getAveragesList() {
		
		Session session = (new Configuration().configure().buildSessionFactory()).openSession();

		session.beginTransaction();
		
		Criteria criteria = session.createCriteria(Averages.class);
		
		List<Averages> averagesList = (List<Averages>) criteria.list();
		return averagesList;
	}
}
