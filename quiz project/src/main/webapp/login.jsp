<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.table.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>Welcome to Quiz portal<br>Login</h1>
		<form action="">
			Enter email id : <input type="email" name="email" required><br><br>
			Enter password : <input type="password" name="pass" required><br><br>
			<input type="submit" name="signin" value="sign in" required> 
		</form>
		Do not have an Account ? <a href="candidate.jsp">sign up</a>
		<%
			UserMain um=new UserMain();
			if(request.getParameter("signin")!=null){
				String name=um.validate(request.getParameter("email"),request.getParameter("pass"));
				if(!name.equals("Error")){
					session.setAttribute("name",name);
					response.sendRedirect("dashboard.jsp");
				}
				else{%>
					<h3 style="color:red">Invalid user name or password!</h3>
				<%}
			}
		%>
	</div>
</body>
</html>