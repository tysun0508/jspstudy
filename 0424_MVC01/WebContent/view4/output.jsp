<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적결과</title>
</head>
<body>
	<h1>결과보기</h1>
	<h2>
		<ul>
			<li>이름 : ${name } </li>
			<li>총점 : ${sessionScope.sum } </li>
			<li>평균 : <fmt:formatNumber value="${avg}" pattern=".0" /> </li>
			<li>학점 : ${sessionScope.hak } </li>
		</ul>
		<hr />
		<ul>
			<li>이름 : ${vo.name } </li>
			<li>총점 : ${vo.sum } </li>
			<li>평균 : ${vo.avg } </li>
			<li>학점 : ${vo.hak } </li>
		</ul>
		<hr />
		<ul>
			<li>이름 : ${map.name } </li>
			<li>총점 : ${map.sum } </li>
			<li>평균 : ${map.avg } </li>
			<li>학점 : ${map.hak } </li>
		</ul>
		<hr />
		<ul>
			<li>이름 : ${map2.name } </li>
			<li>총점 : ${map2.sum } </li>
			<li>평균 : ${map2.avg } </li>
			<li>학점 : ${map2.hak } </li>
		</ul>
		<hr />
		<ul>
			<c:forEach var="k" items="${map2}">
				<li>${k.key} : ${k.value}</li>
			</c:forEach>	
		</ul>
	</h2>
</body>
</html>