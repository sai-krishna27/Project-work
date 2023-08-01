<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<div align="center">
	<h1>Add new Vaccination Center</h1>
	<form action="addCenter" method="post">
		Center name : <input type="text" name="name" placeholder="Enter center name" required><br><br>
		Center city : <select name="city">
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