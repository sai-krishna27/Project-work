<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.table.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<h2><a href="adminPortal.jsp"><--Back</a></h2>
	<div align="center">
		<h1>Add new User</h1>
		<form action="">
			Enter user name : <input type="text" name="name" required><br><br>
			Enter email id : <input type="email" name="email" required><br><br>
			Enter password : <input type="password" name="password" required><br><br>
			<input type="submit" name="signup" value="add user"> 
		</form>
		<%
			if(request.getParameter("signup")!=null){
				User user=new User();
				UserMain um=new UserMain();
				user.name=request.getParameter("name");
				user.email=request.getParameter("email");
				user.password=request.getParameter("password");
				try{
					um.insertUser(user);
					out.print("<h3 align='center' style='color:green'>User added successfully</h3>");
					
				}
				catch(Exception e){
					out.print("<h3 align='center' style='color:red'>User email id already exists</h3>");
				}
		
			}
		%>
	</div>
</body>
</html>