package com.expenseTracker.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@GetMapping("/Home")
	public String showHomePage() {
		return "Home"; // maps to /webapp/home.jsp
	}

	@PostMapping("/Login")
	public String handleLogin(@RequestParam String username, @RequestParam String password, Model model,
			HttpSession session) {

		Map<String, String> userNames = new HashMap<String, String>();
		userNames.put("hari", "123");
		userNames.put("sam", "123");

		for (Map.Entry<String, String> entry : userNames.entrySet()) {
			if (entry.getKey().equalsIgnoreCase(username)) {
				session.setAttribute("loggedInUser", username);
				return "redirect:/Home.jsp"; // Or your success page
			} 
		}
		return "redirect:/index.jsp?error=true";

	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // invalidate the session
		// return "redirect:/index.jsp?logout=true";
		return "redirect:/index.jsp";
	}
}
