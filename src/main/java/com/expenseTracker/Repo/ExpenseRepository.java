package com.expenseTracker.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.expenseTracker.model.Expense;

public interface ExpenseRepository extends JpaRepository<Expense, Long> {

	List<Expense> findByuserName(String username);

	@Query("SELECT e FROM Expense e WHERE e.userName = :userName AND e.category = :category")
	List<Expense> findByUserNameAndCategory(@Param("userName") String userName, @Param("category") String category);
}