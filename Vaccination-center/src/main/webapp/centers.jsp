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
	<h1>Centers</h1><br>
  <table border="1" align="center">
    <tr>
      <td colspan="4">
        <form action="addCenter.jsp" method="post" align="right">
          <input type="submit" value="Add new center">
        </form>
      </td>
    </tr>
    <tr>
      <th>Id</th>
      <th>Name</th>
      <th>City</th>
      <th>Action</th>
    </tr>
    <%
    	List<Center> centers=(List<Center>)request.getAttribute("centers");
    	for(Center c:centers){
    %>
    <tr>
    	<td><%=c.getId() %></td><td><%=c.getName() %></td><td><%=c.getLocation() %></td>
    	<td>
    	<div style="display:flex">
    	<form action="getCenter" method="post">
    		<input type="hidden" name="id" value="<%=c.getId() %>">
    		<input type="hidden" name="name" value="<%=c.getName() %>">
    		<input type="submit" value="view">
    	</form> 
    	<form action="editCenter.jsp" method="post">
	    	<input type="hidden" name="id" value="<%=c.getId() %>">
	    	<input type="hidden" name="name" value="<%=c.getName() %>">
	    	<input type="hidden" name="city" value="<%=c.getLocation() %>">
    		<input type="submit" value="edit">
    	</form> 
    	<form action="deleteCenter" method="post">
    		<input type="hidden" name="id" value="<%=c.getId() %>">
	    	<input type="hidden" name="name" value="<%=c.getName() %>">
	    	<input type="hidden" name="city" value="<%=c.getLocation() %>">
    		<input type="submit" value="delete">
    	</form></div>
    </tr>
    <%} %>
	<tr>
    	<td colspan="4" align="center">Total <%=centers.size() %> Vaccination Center(s) found</td></tr>
  </table>
</body>
</html>