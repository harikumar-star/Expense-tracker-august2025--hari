package com.expenseTracker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.expenseTracker.Repo.ExpenseRepository;
import com.expenseTracker.model.Expense;

import jakarta.servlet.http.HttpSession;

@Controller
public class ExpenseController {

	@Autowired
	private ExpenseRepository expenseRepository;

	@GetMapping("/viewUserNameAndCategory")
	public ModelAndView viewByUserNameAndCategory(@RequestParam String category, HttpSession session) {
		System.out.println("call");
		String username = (String) session.getAttribute("loggedInUser");
		ModelAndView modelAndView = new ModelAndView();
		List<Expense> nameAndCategory = expenseRepository.findByUserNameAndCategory(username, category);
		System.out.println(nameAndCategory);
		modelAndView.addObject("nameAndCategory", nameAndCategory);
		modelAndView.setViewName("viewNameandCategory");

		return modelAndView;

	}

	@GetMapping("/viewExpenses")
	public ModelAndView viewExpenses(Model model, HttpSession session, String status) {
		ModelAndView modelAndView = new ModelAndView();
		String username = (String) session.getAttribute("loggedInUser");
		if (status.equalsIgnoreCase("1")) {

			
			List<Expense> expenses = expenseRepository.findByuserName(username);
			System.out.println(expenses != null ? expenses.size() : null);
			modelAndView.addObject("expenses", expenses);
			modelAndView.setViewName("findByUsernameExpense");
			return modelAndView;
		} else if (status.equalsIgnoreCase("2")) {
			modelAndView.setViewName("viewNameandCategory");
			return modelAndView;
		}
		return modelAndView;

	}

	@PostMapping("/saveExpense")
	public String saveExpense(@ModelAttribute Expense expense, HttpSession session) {

		String username = (String) session.getAttribute("loggedInUser");
		if (username == null) {
			return "redirect:/index.jsp?error=sessionExpired";
		}
		expense.setUserName(username);
		expenseRepository.save(expense);
		return "redirect:/addExpenseSuccess.jsp"; // Create this JSP for confirmation
	}

}
