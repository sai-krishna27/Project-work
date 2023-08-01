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
<body>
	<div align="center">
		<h1>Edit Citizen</h1><br>
		<%
			Optional<Citizen> citizen=(Optional<Citizen>)request.getAttribute("citizen");
			List<String> centers=(List<String>)request.getAttribute("centers"); 
		
		%>
		<form action="updateCitizen" method="post">
			<input type="hidden" value="<%=citizen.get().getId() %>" name="id">
			Citizen Name : <input type="text" value="<%=citizen.get().getName() %>" name="name"><br><br>
			Citizen city : <select name="city">
			<option value="<%=citizen.get().getCity() %>"><%= citizen.get().getCity()%></option>
	      		<option value="Bangalore">Bangalore</option>
	      		<option value="Pune">Pune</option>
	      		<option value="Chennai">Chennai</option>
	      		<option value="Hyderabad">Hyderabad</option>
	      		<option value="Mumbai">Mumbai</option>
	      	</select><br><br>
			No. of Doses : <select name="doses">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
	      	</select><br><br>
	      	Vaccination Center : <select name="center">
			<% for(String s:centers){ %>
			<option value="<%=s %>"><%=s %></option>
			<%} %>
	      	</select><br><br>
	      	<input type="submit" value="submit">
		</form>
	</div>
</body>
</html>