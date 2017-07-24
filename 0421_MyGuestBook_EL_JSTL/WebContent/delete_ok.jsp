<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	int result = DAO.getDelete(request.getParameter("idx"));
	pageContext.setAttribute("result", result);
%>	
	
	<c:choose>
		<c:when test="${result>0 }">
			<c:redirect url="list.jsp"/>
		</c:when>
		<c:otherwise>
			<script>
				alert("삭제실패");
				history.go(-2);
			</script>
		</c:otherwise>
	</c:choose>
	

	