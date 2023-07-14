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
<style>
	th,td,tr {text-align:center}
</style>
<body>
	<div align="center">
		<h2 align="left"><a href="adminPortal.jsp"><--Back</a></h2>
		<h1>Quiz Table</h1>
		<% 
			QuizCrud qc=new QuizCrud();
			List<QuizList> list=qc.getQuizList();
			int index=1;%>
			<table border="1" align="center">
					<tr><th>Sr No.</th><th>Quiz Title</th><th>Category</th><th>Edit Quiz</th><th>Delete Quiz</th></tr>
			<% for(QuizList q:list){%>
				
				<tr><td><%=index %></td><td><%=q.title %></td><td><%=q.category %></td><td>
				<form action="editQuiz.jsp">
				<input type="hidden" name="title" value="<%=q.title %>">
				<input type="hidden" name="category" value="<%=q.category%>">
				<input type="hidden" name="id" value="<%=q.id %>">
				<input type="submit" value="edit" name="editQuiz">
				</form>
				</td><td><form action=""><input type="hidden" name="title" value="<%=q.title %>"><input type="hidden" name="category" value="<%=q.category%>"><input type="hidden" name="id" value="<%=q.id %>"><input type="submit" value="delete" name="deleteQuiz"></form></td></tr>
			
			<%index++;}%>
			</table>
			
			<%
				if(request.getParameter("deleteQuiz")!=null){
					qc.deleteQuiz(request.getParameter("title"),request.getParameter("category"),request.getParameter("id"));
					response.sendRedirect("quizList.jsp"); 
				}
			%>
	</div>
</body>
</html>