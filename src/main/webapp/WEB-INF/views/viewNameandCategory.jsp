<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
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

        input[type="text"],
        input[type="date"],
        input[type="number"],
        textarea,
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
     <a href="/logout" class="btn btn-logout">Logout</a>
</div>
        <h2>SELECT CATEGORY</h2>
        <form action="viewUserNameAndCategory" method="get">
           
            <label for="category">Category</label>
            <select id="category" name="category" required>
                <option value="">-- Select Category --</option>
                <option value="Food">Food</option>
                <option value="Transport">Transport</option>
                <option value="Shopping">Shopping</option>
                <option value="Health">Health</option>
                <option value="Other">Other</option>
            </select>

          

            <input type="submit" value="Add Expense">
                     <!-- 💡 Links to other features -->
   
        </form>
        <table border="1" cellpadding="10" cellspacing="0">
    <tr>
        <th>UserName</th>
        <th>Category</th>
       
    </tr>
    <c:forEach var="expense" items="${nameAndCategory}">
        <tr>
            <td><c:out value="${expense.userName}" /></td>
            <td><c:out value="${expense.category}" /></td>
          
        </tr>
    </c:forEach>
</table>
<c:if test="${empty nameAndCategory}">
    <p>No record found</p>
</c:if>
    </div>
    
</body>
</html>