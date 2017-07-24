<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 명 록</title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 500px; border-collapse:collapse; }
	table,th,td{border: 1px solid black;}
</style>
</head>
<body>
	<div align="center">
		<h2>방명록</h2>
		<hr />
		<p>[<a href="/0424_MVC_GuestBook/MyController?type=write"> 방명록쓰기 </a>]</p>
		<table>
			<thead>
				<tr bgcolor="#99ccff">
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:choose>
					<c:when test="${empty list}">
						<tr>
				  			<td colspan="4"><h2>해당 자료가 존재하지 않습니다.</h2></td>
				  		</tr>
					</c:when>			
				    <c:otherwise>
				    	<c:forEach var="k" items="${list}" varStatus="vs">
				  	  	<tr>
				  	  		<td>${list.size() -vs.index} </td>
				  	  		<td>${k.name} </td>
				  	  		<td><a href="/0424_MVC_GuestBook/MyController?type=onelist&idx=${k.idx}">${k.subject}</a></td>
				  	  		<td> ${k.regdate.substring(0,10)}</td>
				  	  	</tr>
				    	</c:forEach>
				    </c:otherwise>
				 </c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>






