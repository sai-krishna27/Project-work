<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.table.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
	* {text-align:center}
	
</style>
<body>
	<div align="center">
		<h2 align="left"><a href="adminPortal.jsp"><--Back</a></h2>
		<h1>User Table</h1>
		<% 
			UserMain qc=new UserMain();
			List<User> list=qc.getUserList();%>
			<table border="1" align="center">
					<tr><th>User Name</th><th>User Email</th><th>User Password</th><th>Edit User</th><th>Delete User</th></tr>
			<% for(User user:list){%>
				
				<tr><td><%=user.name %></td><td><%=user.email %></td><td><%=user.password %></td><td><form action="editUser.jsp"><input type="hidden" name="email" value="<%=user.email %>"><input type="submit" value="edit" name="editUser"></form></td><td><form action=""><input type="hidden" name="email" value="<%=user.email %>"><input type="submit" value="delete" name="deleteUser"></form></td></tr>
			
			<%}%>
			</table>
			<% 
				if(request.getParameter("deleteUser")!=null){
					UserMain um=new UserMain();
					um.deleteUser(request.getParameter("email"));
					response.sendRedirect("userList.jsp"); 
				}
			%>
		
	</div>
</body>
</html>