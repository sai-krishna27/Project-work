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
	<%@include file="success.jsp" %>
	<h1>Citizens</h1><br>
  <table border="1" align="center">
    <tr>
      <td colspan="7">
        <form action="addCitizen" method="post" align="right">
          <input type="submit" value="Add new citizen">
        </form>
      </td>
    </tr>
    <tr>
      <th>Id</th>
      <th>Name</th>
      <th>City</th>
      <th>No. of doses</th>
      <th>Vaccination status</th>
      <th>Vaccination Center</th>
      
      <th>Action</th>
    </tr>
    <%
    	List<Citizen> citizens=(List<Citizen>)request.getAttribute("citizens");
    	for(Citizen c:citizens){
    %>
    <tr>
    	<td><%=c.getId() %></td><td><%=c.getName() %></td><td><%=c.getCity() %></td><td><%=c.getDoses() %></td>
    	<td><%=c.getStatus() %></td><td><%=c.getCenter()%>
    	<td>
    	<div style="display:flex">
    	<form action="viewCitizen.jsp" method="post">
    		<input type="hidden" name="id" value="<%=c.getId() %>">
    		<input type="hidden" name="name" value="<%=c.getName() %>">
    		<input type="hidden" name="city" value="<%=c.getCity() %>">
    		<input type="hidden" name="doses" value="<%=c.getDoses() %>">
    		<input type="hidden" name="status" value="<%=c.getStatus() %>">
    		<input type="hidden" name="center" value="<%=c.getCenter() %>">
    		<input type="submit" value="view">
    		
    	</form> 
    	<form action="getCitizen" method="post">
    		<input type="hidden" name="id" value="<%=c.getId() %>">
    		<input type="submit" value="edit">
    	</form> 
    	<form action="deleteCitizen" method="post">
    		<input type="hidden" name="id" value="<%=c.getId() %>">
    		<input type="submit" value="delete">
    	</form></div>
    </tr>
    <%} %><tr>
    	<td colspan="7" align="center">Total <%=citizens.size() %> Citizen(s) found</td></tr>
    </table>
  
</body>

</html>