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
	<h1>Registration</h1>
	<form action="registerAdmin" method="post">
	Name : <input type="text" name="name" placeholder="Enter Name" required><br><br>
	Email : <input type="email" name="email" placeholder="Enter Email" required><br><br>
	Password : <input type="password" name="password" placeholder="Enter password" required><br><br>
	<input type="submit" value="Register">
	</form>
	<form action="login.jsp" method="post"><br><br>
	Already registered ?  <input type="submit" value="Login">
	</form>
	</div>
</body>
</html>