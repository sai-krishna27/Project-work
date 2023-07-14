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
<h3><a href="dashboard.jsp"><--Back</a></h2><br>
	<h1 align="center">Welcome to the Quiz <%=session.getAttribute("name") %></h1>
	<h3 align="center">Quiz Title - <%=session.getAttribute("title") %><br>Quiz Title - <%=session.getAttribute("category")%>
	</h3>
	
	<%QuestionCrud qc=new QuestionCrud();
		int result=0;
		int index=1;
		TestCrud tc=new TestCrud();
		List<QuestionList> list=qc.getQuestionList((String)session.getAttribute("title"),(String)session.getAttribute("category"));
		%><table border="0" cellspacing="10"><%
		for(QuestionList ql:list){%>
		<form action="">
			<tr><td><%=index%>.</td><td><%=ql.question %></td></tr>
			<tr><td></td><td><h3>options :</h3></td></tr>
			<tr><td></td><td><input type="radio" name="<%=ql.id %>" value="A"><%=ql.op1 %></td></tr>
			<td></td><td><input type="radio" name="<%=ql.id %>" value="B"><%=ql.op2 %></td></tr>
			<tr><td></td><td><input type="radio" name="<%=ql.id %>" value="C"><%=ql.op3 %></td></tr>
			<tr><td></td><td><input type="radio" name="<%=ql.id %>" value="D"><%=ql.op4 %></td></tr>
			<%
				if(request.getParameter(""+ql.id)!=null && request.getParameter(""+ql.id).equals(ql.correct)){
				  result++;
				}
			%>
		<%index++;}%>
		</table>
		<input type="submit" name="validate" value="submit"><br><br>
		</form>
		<% 
			if(request.getParameter("validate")!=null){
				tc.updateScore(result,(String)session.getAttribute("title"),(String)session.getAttribute("category"),(String)session.getAttribute("name"));
				response.sendRedirect("leaderboard.jsp");
			}
		%> 
	
</body>
</html>