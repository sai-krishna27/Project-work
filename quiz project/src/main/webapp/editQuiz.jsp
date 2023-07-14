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
<h2><a href="quizList.jsp"><--Back</a></h2>
		<h1>Edit Quiz details</h1>
		<h1>Edit Question</h1>
		<form action="">
			<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
			Enter new Quiz Name : <input type="text" name="newTitle" value="<%=request.getParameter("title") %>"><br><br>
			<input type="hidden" name="category" value="<%=request.getParameter("category")%>">
			<input type="hidden" name="title" value="<%=request.getParameter("title")%>">
			<input type="submit" name="updateQuizTitle" value="update Quiz title">
		</form>
		<%
			if(request.getParameter("updateQuizTitle")!=null){
				QuizCrud qc=new QuizCrud();
				qc.updateQuizTitle(request.getParameter("newTitle"),request.getParameter("title"),request.getParameter("category"),request.getParameter("id"));
				response.sendRedirect("quizList.jsp"); 
			} 
		%>   
		</div>
</body>
</html>