<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.table.*"  %>
    <%@ page import="java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body align="center">
	<h2 align="left"><a href="adminPortal.jsp"><--back</a></h2>
	<h1>Select quiz to add question</h1>
	<%
		QuizCrud qc=new QuizCrud();
		List<QuizList> list=qc.getQuizList();%>
		<form action="">
		Enter Quiz title : <select name="title">
		<% for(QuizList ql:list){ %>
			<option><%= ql.title %></option>
		<%} %>
		</select><br><br>
		Enter Quiz Category : <select name="category">
			<option>maths</option>
			<option>science</option>
		</select><br><br>
		<input type="submit" value="Go to add question" name="check">
		</form>
	<% 
		if(request.getParameter("check")!=null){
			if(qc.hasCategory(request.getParameter("title"),request.getParameter("category"))){
				session.setAttribute("title",request.getParameter("title"));
				session.setAttribute("category",request.getParameter("category"));
				response.sendRedirect("AddNewQuestion.jsp");
			}
			else{
				out.print("<h3 style='color:red'>Quiz '"+request.getParameter("title")+"' with category '"+request.getParameter("category")+"' is not found </h3>");
			}
		}
	%>
</body>
</html>