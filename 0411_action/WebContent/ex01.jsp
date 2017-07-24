<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그</title>
</head>
<body>
  <%-- 
        액션 : jsp 페이지 간에 흐름제어, 자바 빈즈 컴포넌트와 상호지원
       <jsp:액션명령></액션명령> 
   --%>
	<h1> 여기는 ex01 페이지 입니다.</h1>
	<%-- include는 두가지가 있다. 지시어와 액션 --%>
	<h2>지시어 : 파라미터전달 안됨</h2>
	<hr />
	<%@ include file="ex02.jsp" %>
	<%@ include file="ex03.jsp" %> 
	<hr />
	<h2>액션 : 파라미터전달 가능</h2>
	<hr />
	<jsp:include page="ex02.jsp" />
	<jsp:include page="ex03.jsp">
		<jsp:param value="홍길동" name="name"/>
		<jsp:param value="18" name="age"/>
	</jsp:include>
	<hr />
	
	
	<h1> 여기는 ex01 페이지 입니다.</h1>
	
</body>
</html>






