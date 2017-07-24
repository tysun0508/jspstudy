<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 기본내장객체 : response </title>
</head>
<body>
	<h1> 파라미터 결과 보기2 </h1>
	<h2> 이름 : <%=id %></h2>
	<h2> 비번 : <%=pw %></h2>
	
</body>
</html>