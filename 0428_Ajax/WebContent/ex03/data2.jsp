<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
	<% Date now = new Date();
	   String str = "밥먹자";%>
	   
	   <%=now %><br />
	   <%=str %>
	</h2>   
</body>
</html>