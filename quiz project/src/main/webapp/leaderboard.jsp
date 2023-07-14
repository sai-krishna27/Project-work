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
	<h2 align="left"><a href="dashboard.jsp"><--Back</a></h2><br>
	<h1>Leader board of Quiz <i style="color:green"><%=session.getAttribute("title")%></i><br>
	Category <i style="color:green"><%=session.getAttribute("category")%></i>
	</h1>
	<%  
			TestCrud tc=new TestCrud();
			List<Test> list=tc.getLeaderBoardList((String)session.getAttribute("title"));
			int index=1;%> 
			<table border="1" align="center">
					<tr><th>Sr No</th><th>User</th><th>score</th></tr>
			<% for(Test t:list){%>
				
				<tr><td><%=index %></td><td><%=t.name %></td><td><%=t.score %></td>
				
				</tr>
			
			<%index++;}%>
			</table> 
</div>
	
</body>
</html>