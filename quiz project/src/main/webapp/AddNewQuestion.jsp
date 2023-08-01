<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.table.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2><a href="adminPortal.jsp"><--Back</a></h2>
	<div align="center">
		<h1>Add New Question</h1><br>
		<form action="">
			Enter Question : <input type="text" maxlength="100" name="ques" required><br><br>
			Enter option A : <input type="text" maxlength="100" name="op1" required><br><br>
			Enter option B : <input type="text" maxlength="100" name="op2" required><br><br>
			Enter option C : <input type="text" maxlength="100" name="op3" required><br><br>
			Enter option D : <input type="text" maxlength="100" name="op4" required><br><br>
			Enter correct option : <select name="correct">
			<option>A</option>
			<option>B</option>
			<option>C</option>
			<option>D</option>
			</select><br><br>
			<input type="submit" value="add question" name="add">
		</form>
		<%
			if(request.getParameter("add")!=null){
				QuestionCrud qc=new QuestionCrud();
				QuestionList ql=new QuestionList();
				ql.question=request.getParameter("ques");
				ql.op1=request.getParameter("op1");
				ql.op2=request.getParameter("op2");
				ql.op3=request.getParameter("op3");
				ql.op4=request.getParameter("op4");
				ql.correct=request.getParameter("correct");
				qc.insert(ql,(String)session.getAttribute("title"),(String)session.getAttribute("category")); 
				out.print("<h3 align='center' style='color:green'>Question added Successfully</h3>");
				
			}
		%>
	</div>
</body>
</html>