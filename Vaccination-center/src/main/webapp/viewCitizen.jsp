<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
  th,td { 
    font-size: 1.5rem;
    margin: 0px;
    padding: 0.5rem 2rem; 
    }
</style>
<body>
<h2><a href="citizens"><--Got to Citizens List</a></h2>
	<div align="center">
		<h1>Citizen information</h1>
		<table border="1" align="center">
			<tr>
				<th colspan="2"><h1><%= request.getParameter("name") %><h1></h1></th>
			</tr>
			<tr>
				<td>ID</td>
				<td><%=request.getParameter("id") %></td>
			</tr>
			<tr>
				<td>City</td>
				<td><%=request.getParameter("city") %></td>
			</tr>
			<tr>
				<td>Number of Vaccines</td>
				<td><%=request.getParameter("doses") %></td>
			</tr>
			<tr>
				<td>Vaccination Status</td>
				<td><%=request.getParameter("status") %></td>
			</tr>
			<tr>
				<td>Allocated Vaccination Center</td>
				<td>
				<form action="getCenter" method="post">
					<input type="hidden" name="name" value="<%=request.getParameter("center") %>">
					<input type="submit" value="<%=request.getParameter("center") %>">
				</form></td>
			</tr>
		</table>
	</div>
</body>
</html>