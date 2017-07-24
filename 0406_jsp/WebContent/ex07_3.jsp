<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 삭제하기</title>
</head>
<body>
	<%-- 세션 속성 삭제하기 : removeAttribute("이름") --%>
	<% session.removeAttribute("age"); 
		response.sendRedirect("ex07_1.jsp");
	%>
</body>
</html>