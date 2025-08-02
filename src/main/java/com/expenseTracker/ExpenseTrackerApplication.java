package com.expenseTracker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ExpenseTrackerApplication {

	public static void main(String[] args) {
		System.out.println("Expense Tracker Applicatio Starts");
		SpringApplication.run(ExpenseTrackerApplication.class, args);
	}

}
