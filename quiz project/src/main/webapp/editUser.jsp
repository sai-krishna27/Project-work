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
<body>
<div align="center">
<h2><a href="userList.jsp"><--Back</a></h2>
		<h1>Edit User Records</h1>
		<h1>Change User Name</h1>
		<form action="">
			<input type="hidden" name="email" value="<%=request.getParameter("email")%>">
			Enter new Name : <input type="text" name="name"><br><br>
			<input type="submit" name="updateName" value="update name">
		</form>
		<%
			if(request.getParameter("updateName")!=null){
				UserMain um=new UserMain();
				um.updateName(request.getParameter("email"),request.getParameter("name"));
				out.print("<h3 align='center' style='color:green'>User Name updated successfully</h3>");
			} 
		%> 
		<hr> 
		<h1>Change User Password</h1>
		<form action="">
			<input type="hidden" name="email" value="<%=request.getParameter("email")%>">
			Enter new password : <input type="text" name="pass"><br><br>
			<input type="submit" name="updatePass" value="update password">
		</form>
		<%
			if(request.getParameter("updatePass")!=null){
				UserMain um=new UserMain();
				um.updatePass(request.getParameter("email"),request.getParameter("pass"));
				out.print("<h3 align='center' style='color:green'>User Password updated successfully</h3>");
			} 
		%> 
		
		
		</div>
</body>
</html>