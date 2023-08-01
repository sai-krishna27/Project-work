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
	<div align="right">
		<h1>Welcome <%=session.getAttribute("name") %>    </h1>
		<form action="">
			<input type="submit" name="logout" value="log out">
		</form>
		<hr>
	</div>
		<%
			if(request.getParameter("logout")!=null){
				response.sendRedirect("index.jsp");
			}
		%>
		<h1 align="center">Quiz Table</h1>
		<% 
			QuizCrud qc=new QuizCrud();
			Test test=new Test(); 
			TestCrud tc=new TestCrud();
			List<QuizList> list=qc.getQuizList();
			int index=1;%>
			<table border="1" align="center">
					<tr><th>Sr No.</th><th>Quiz Title</th><th>Category</th><th>Action</th></tr>
			<% for(QuizList q:list){%>
				
				<tr><td><%=index %></td><td><%=q.title %></td><td><%=q.category %></td>
				<td><form action="">
					<input type="hidden" name="title" value="<%=q.title %>">
					<input type="hidden" name="category" value="<%=q.category %>">
					<input type="hidden" name="name" value="<%=session.getAttribute("name")%>">
					<input type="hidden" name="score" value="-1">
					<input type="submit" value="start" name="startTest">
				</form>
				</tr>
			
			<%index++;}%>
			</table>  
			<%
				if(request.getParameter("startTest")!=null){
					tc.addUserTest(request.getParameter("title"),request.getParameter("category"),request.getParameter("name"),request.getParameter("score"));
					session.setAttribute("title",request.getParameter("title"));
					session.setAttribute("category",request.getParameter("category"));
					response.sendRedirect("takeTest.jsp");
					
				}
			%> 
		
	 
</body>
</html>