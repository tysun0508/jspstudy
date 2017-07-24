<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 원래는 DB와 비교해서 로그인 성공 유무 확인
	
	if(false){
		session.setAttribute("id_chk", "ok");
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		response.sendRedirect("ex08_1.jsp");
	}else{
		session.setAttribute("id_chk", "err");
		response.sendRedirect("ex08_1.jsp");
	}


%>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>