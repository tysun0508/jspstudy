<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<% request.setAttribute("addr", "서울"); %>
	
	<%-- 세션에 데이터를 저장하자 --%>
	<%-- session.setAttribute("이름", 객체 --%>
	<%
		session.setAttribute("name", "이브이");
		session.setAttribute("age", "2");
		response.sendRedirect("ex07_1.jsp");
	%>
</body>
</html>