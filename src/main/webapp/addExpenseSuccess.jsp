<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expense Added</title>
</head>
<body>
    <h2>Expense has been added successfully!</h2>
    <%
    String username = (String) session.getAttribute("loggedInUser");
    if (username != null) {
%>
    <h3>Welcome, <%= username %>!</h3>
<%
    } else {
        response.sendRedirect("index.jsp?error=sessionExpired");
    }
%>


    <a href="Home.jsp">Add Another Expense</a>
    <br>
    <form action="/logout" method="get">
    <input type="submit" value="Logout" />
</form>
</body>
</html>