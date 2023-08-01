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
<h2><a href="QuesList.jsp"><--Back</a></h2>
		<h1>Edit Question records</h1>
		<h1>Edit Question</h1>
		<form action="">
			<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
			Enter Question : <input type="text" name="question" value="<%=request.getParameter("ques") %>"><br><br>
			Enter option 1 : <input type="text" name="op1" value="<%=request.getParameter("op1") %>"><br><br>
			Enter option 2 : <input type="text" name="op2" value="<%=request.getParameter("op2") %>"><br><br>
			Enter option 3 : <input type="text" name="op3" value="<%=request.getParameter("op3") %>"><br><br>
			Enter option 4 : <input type="text" name="op4" value="<%=request.getParameter("op4") %>"><br><br>
			Enter correct option: <select name="correct">
			<option>A</option>
			<option>B</option>
			<option>C</option>
			<option>D</option>
			</select><br><br><br><br>
			<input type="submit" name="updateQuestion" value="update question">
		</form>
		<%
			if(request.getParameter("updateQuestion")!=null){
				QuestionCrud pm=new QuestionCrud();
				pm.updateQuestion((String)session.getAttribute("title"),(String)session.getAttribute("category"),request.getParameter("id"),request.getParameter("question"),request.getParameter("op1"),request.getParameter("op2"),request.getParameter("op3"),request.getParameter("op4"),request.getParameter("correct"));
				response.sendRedirect("QuesList.jsp");
			} 
		%>  
		</div>
</body>
</html> 