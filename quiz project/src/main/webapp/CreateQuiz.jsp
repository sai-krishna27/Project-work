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
	<div align ="center">
	<h2 align="left"><a href="adminPortal.jsp"><--Back</a></h2>
		<h1>Create Quiz</h1>
		<form action="">
			Quiz title : <input type="text" name="title"><br><br>
			Category : <select name="category"><option>maths</option><option>science</option></select><br><br>
			<input type="submit" value="create quiz" name="createQuiz">
			
		</form>
	</div>
	<% 
		if(request.getParameter("createQuiz")!=null){
			QuizCrud qc=new QuizCrud();
			int row=qc.insert(request.getParameter("title"),request.getParameter("category"));
			if(row>0){
				out.print("<h3 align='center' style='color:green'>Quiz added Successfully</h3>");
			}
			else{
				out.print("<h3 align='center' style='color:red'>Quiz alreay exists</h3>");
			}
		}
	%>
</body>
</html>