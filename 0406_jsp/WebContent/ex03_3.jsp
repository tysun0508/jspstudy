<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본객체 : request</title>
</head>
<body>
	<h1>헤더 정보 보기</h1>
	<h2>
		<%
			Enumeration headerEnum = request.getHeaderNames();
		    while(headerEnum.hasMoreElements()){
		    	String headerName = (String)headerEnum.nextElement();
		    	String headerValue = request.getHeader(headerName);
		    	out.println(headerValue+"<br />");
		    }
		%>
		
	</h2>
</body>
</html>