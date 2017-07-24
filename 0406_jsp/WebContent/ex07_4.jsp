<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>세션 초기화</title>
</head>
<body>
	<%--  세션 초기화 : session.invalidate();  --%>
	<% session.invalidate();
	response.sendRedirect("ex07_1.jsp");
	%>
</body>
</html>