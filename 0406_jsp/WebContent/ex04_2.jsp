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
<script type="text/javascript">
	function send_go() {
		location.href="ex04_3.jsp";
	}
	<%--form이 없으므로 action 사용 못함 --%>
	function send_go2() {
		location.href="ex04_3.jsp?id=<%=id%>&pw=<%=pw%>";
	}
</script>
</head>
<body>
	<h1> 파라미터 결과 보기 </h1>
	<h2> 이름 : <%=id %></h2>
	<h2> 비번 : <%=pw %></h2>
	<hr />
	<h2><a href="ex04_3.jsp"> a 태그를 이용한 다른페이지로 이동1 </a> </h2>
	<h2><a href="ex04_3.jsp?id=<%=id%>&pw=<%=pw%>"> a 태그를 이용한 다른페이지로 이동2 </a></h2></body>
	<%-- 자바스크립트를 이용한 이동 --%>
	<button onclick="send_go()">이동1</button>
	<input type="button" value="이동2" onclick="send_go2()" />
	
	<%-- 리다이렉트 : response 객체 사용 --%>
	<%-- request와 response가 새로 생성됨(ex04_3.jsp) --%>
	<%-- <% response.sendRedirect("ex04_3.jsp"); %> --%>	
	
	<%-- 포워드 : request 객체 사용 --%>
	     <% request.getRequestDispatcher("ex04_3.jsp").forward(request, response); %>
</html>
