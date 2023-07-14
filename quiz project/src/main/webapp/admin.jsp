<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>Welcome Back !</h1>
		<form action="">
			Enter email id :<input type="email" name="email" required><br><br>
			Enter password :<input type="password" name="password" required><br><br>
			<input type="submit" value="login" name="admin" >
		</form>
	</div>
	<%
		if(request.getParameter("admin")!=null){
			if(request.getParameter("email").equals("admin@gmail.com") && request.getParameter("password").equals("admin")){
				response.sendRedirect("adminPortal.jsp");
			}
			else{
				out.print("<h3 align='center' style='color:red'>incorrect admin details !</h3>");
			}
		}
	%>
</body>
</html>