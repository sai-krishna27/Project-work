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
	<%@include file="success.jsp"%>
	<%
	Center center=(Center)request.getAttribute("center");
	List<Citizen> citizens=(List<Citizen>)request.getAttribute("citizens");
	%>
	<h1>Center Information</h1>
	<table border="1" align="center">
	<tr>
		<th colspan="2"><%=center.getName() %></th>
	</tr>
	<tr>
		<td>ID</td>
		<td><%=center.getId() %></td>
	</tr>
	<tr>
		<td>City</td>
		<td><%=center.getLocation() %></td>
	</tr>
	</table>
	<br><hr>
	<h1>All Citizens of this center</h1>
	<table border="1" align="center">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Action</th>
	</tr>
	<%
		for(Citizen citizen:citizens){
	%>
	<tr>
		<td><%=citizen.getId() %></td>
		<td><%=citizen.getName() %></td>
		<td>
			<form action="viewCitizen.jsp" method="post">
	    		<input type="hidden" name="id" value="<%=citizen.getId() %>">
	    		<input type="hidden" name="name" value="<%=citizen.getName() %>">
	    		<input type="hidden" name="city" value="<%=citizen.getCity() %>">
	    		<input type="hidden" name="doses" value="<%=citizen.getDoses() %>">
	    		<input type="hidden" name="status" value="<%=citizen.getStatus() %>">
	    		<input type="hidden" name="center" value="<%=citizen.getCenter() %>">
	    		<input type="submit" value="view">
    		
    	</form> 
		</td>
	</tr>
	
	<%} %>
	
	</table>
</body>
</html>