package com.expenseTracker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.expenseTracker.Repo.ExpenseRepository;
import com.expenseTracker.model.Expense;

@Service
public class ExpenseService  {

	@Autowired
	private ExpenseRepository repo;
	

	public List<Expense> getAllExpenses(String userName) {
		return repo.findByuserName(userName);
	}
	
	public List<Expense> getUsernameAndCategory(String userName,String category)
	{
		return repo.findByUserNameAndCategory(userName, category);
	}

}
