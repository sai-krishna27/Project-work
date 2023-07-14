<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.sample.demo.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
  td,th { 
    font-size: 1.5rem;
    margin: 0px;
    padding: 0.5rem 2rem; 
    }
</style>
<body>
	<h2><a href="citizens">Go to citizens List</a></h2>
	<div align="center">
	<h1>Add new Citizen</h1>
	<form action="insertCitizen" method="post">
		Citizen name : <input type="text" name="name" placeholder="Enter center name" required><br><br>
		Citizen city : <select name="city">
      		<option value="Bangalore">Bangalore</option>
      		<option value="Pune">Pune</option>
      		<option value="Chennai">Chennai</option>
      		<option value="Hyderabad">Hyderabad</option>
      		<option value="Mumbai">Mumbai</option>
      	</select><br><br>
      	Vaccination Center name : <select name="center">
      	<%
      		List<String> centers=(List<String>)request.getAttribute("centers");
      		for(String s:centers){
      	%>
      	<option><%=s %></option>
      	<%} %>
      	
      	</select><br><br>
      	<input type="submit" value="submit">
      	
	</form>
	</div>
</body>
</html>