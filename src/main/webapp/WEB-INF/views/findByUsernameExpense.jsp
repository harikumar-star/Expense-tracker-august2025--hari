<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #6dd5ed, #2193b0);
	margin: 0;
	padding: 0;
}

.form-container {
	background-color: #ffffff;
	max-width: 400px;
	margin: 100px auto;
	padding: 30px 40px;
	border-radius: 12px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	color: #333333;
	margin-bottom: 30px;
}

label {
	font-weight: bold;
	display: block;
	margin-top: 15px;
}

input[type="text"], input[type="date"], input[type="number"], textarea,
	select {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 6px;
	box-sizing: border-box;
}

textarea {
	resize: vertical;
}

input[type="submit"] {
	background-color: #2193b0;
	color: white;
	border: none;
	padding: 12px;
	margin-top: 20px;
	width: 100%;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #1b7a99;
}
</style>
</head>
<body>


	<div class="form-container">
		<div style="text-align: right;">
			<a href="/logout" class="btn btn-logout">Logout</a>
		</div>
		<%
		String username = (String) session.getAttribute("loggedInUser");
		if (username != null) {
		%>
		<h3>
			Welcome To findByUsernameExpense Page
			<br>
			<%=username%>!
		</h3>


		<!-- Display Expense Table -->
<table border="1" cellpadding="10" cellspacing="0">
    <tr>
        <th>Date</th>
        <th>Amount</th>
        <th>Category</th>
        <th>Note</th>
    </tr>
    <c:forEach var="expense" items="${expenses}">
        <tr>
            <td><c:out value="${expense.date}" /></td>
            <td><c:out value="${expense.amount}" /></td>
            <td><c:out value="${expense.category}" /></td>
            <td><c:out value="${expense.note}" /></td>
        </tr>
    </c:forEach>
</table>
<c:if test="${empty expenses}">
    <p>No record found</p>
</c:if>

		<%
		} else {
		response.sendRedirect("index.jsp?error=sessionExpired");
		}
		%>
	</div>
</body>
</html>