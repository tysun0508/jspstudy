<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자 및 날짜 처리</title>
</head>
<body>
	<h2> 여기는 JSTL02.jsp</h2>
	<p> 이름 : ${param.name} </p>
	<hr />
	<c:set var="k" value="12343.345" />
	${k } <br />
	<fmt:formatNumber value="${k}" pattern="#,##0" />    <br />
	<fmt:formatNumber value="${k}" pattern="#,##0.0" />  <br />
	<fmt:formatNumber value="${k}" pattern="#,##0.00" /> <br />
	<hr />
	<c:set var="k" value="43.345" />
	${k } <br />
	<fmt:formatNumber value="${k}" pattern="#,##0" />    <br />
	<fmt:formatNumber value="${k}" pattern="#,##0.0" />  <br />
	<fmt:formatNumber value="${k}" pattern="#,##0.00" /> <br />
	<hr />
	<fmt:formatNumber value="${k}" pattern="0,000" />    <br />
	<fmt:formatNumber value="${k}" pattern="0,000.0" />  <br />
	<fmt:formatNumber value="${k}" pattern="0,000.00" /> <br />
	<hr />
	<%Date now = new Date(); %>
	<%=now %>
	<%pageContext.setAttribute("now", now); %><br />
	${now }
	<hr/>
	<fmt:formatDate value="${now }"/><br/>
	<fmt:formatDate value="${now }" dateStyle="short"/><br/>
	<fmt:formatDate value="${now }" dateStyle="medium"/><br/>
	<fmt:formatDate value="${now }" dateStyle="long"/><br/>
	<fmt:formatDate value="${now }" dateStyle="full"/><br/>
	<hr />
	<fmt:formatDate type="time" value="${now}"/><br />
	<fmt:formatDate type="time" value="${now}" timeStyle="short"/><br />
	<fmt:formatDate type="time" value="${now}" timeStyle="medium"/><br />
	<fmt:formatDate type="time" value="${now}" timeStyle="long"/><br />
	<fmt:formatDate type="time" value="${now}" timeStyle="full"/><br />
	<hr />
	<fmt:formatDate type="both" value="${now}"/><br />
	<fmt:formatDate type="both" value="${now}" dateStyle="short" timeStyle="short"/><br />
	<fmt:formatDate type="both" value="${now}" dateStyle="short" timeStyle="long"/><br />
</body>
</html>



























