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
<style>
	* {text-align:center}
	
</style>
<body>
	<div>
		<h2 align="left"><a href="adminPortal.jsp"><--Back</a></h2>
		<h1>Quiz Table</h1>
		<% 
			QuestionCrud qc=new QuestionCrud();
			List<QuestionList> list=qc.getQuestionList((String)session.getAttribute("title"),(String)session.getAttribute("category"));%>
			<table border="1" align="center">
					<tr><th>Sr No.</th><th>Question</th><th>option A</th><th>option B</th><th>option C</th><th>option D</th><th>Correct option</th><th>Edit</th><th>Delete</th></tr>
			<% for(QuestionList q:list){%>
				<tr><td><%=q.id %></td><td><%=q.question %></td><td><%=q.op1 %></td><td><%=q.op2 %></td><td><%=q.op3 %></td><td><%=q.op4 %></td><td><%=q.correct %></td><td>
				<form action="editQues.jsp">
				<input type="hidden" name="title" value="<%=session.getAttribute("title") %>">
				<input type="hidden" name="category" value="<%=session.getAttribute("category") %>">
				<input type="hidden" name="id" value="<%=q.id %>">
				<input type="hidden" name="ques" value="<%=q.question %>">
				<input type="hidden" name="op1" value="<%=q.op1 %>">
				<input type="hidden" name="op2" value="<%=q.op2%>">
				<input type="hidden" name="op3" value="<%=q.op3 %>">
				<input type="hidden" name="op4" value="<%=q.op4 %>">
				<input type="submit" value="edit" name="editQues">
				</form>
				</td><td><form action=""><input type="hidden" name="id" value="<%=q.id %>"><input type="submit" value="delete" name="deleteQues"></form></td></tr>
				
				 
			<%}%>
			</table>
			
			<% 
				if(request.getParameter("deleteQues")!=null){
					QuestionCrud pm=new QuestionCrud();
					pm.deleteQues((String)session.getAttribute("title"),(String)session.getAttribute("category"),request.getParameter("id"));
					response.sendRedirect("QuesList.jsp");
				}
			%>
			
			
			 
	</div>
</body>
</html>