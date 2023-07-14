<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align='center'>
	<h1>Login</h1>
	<form action="checkLogin" method="post">
	Email: <input type="email" name="email" placeholder="Enter email" required><br><br>
	Password : <input type="password" name="password" placeholder="Enter password" required><br><br>
	<input type="submit" value="login">
	</form>
	<form action="register.jsp" method="post"><br><br>
	New User ?  <input type="submit" value="Registration">
	</form>
	</div>
</body>
</html>