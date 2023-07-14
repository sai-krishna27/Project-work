<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<h1>Edit <%=request.getParameter("name") %></h1>
	<form action="editCenter" method="post">
		<input type="hidden" value="<%=request.getParameter("id") %>" name="id">
		<input type="hidden" value="<%=request.getParameter("name") %>" name="oldName">
		<input type="hidden" value="<%=request.getParameter("city") %>" name="oldCity">
		Center name : <input type="text" name="name" value="<%=request.getParameter("name") %>" required><br><br>
		Center city : <select name="city">
		<option value="<%=request.getParameter("city") %>"><%=request.getParameter("city") %></option>
      		<option value="Bangalore">Bangalore</option>
      		<option value="Pune">Pune</option>
      		<option value="Chennai">Chennai</option>
      		<option value="Hyderabad">Hyderabad</option>
      		<option value="Mumbai">Mumbai</option>
      	</select><br><br>
      	<input type="submit" value="submit">
      	
	</form>
	</div>
</body>
</html>