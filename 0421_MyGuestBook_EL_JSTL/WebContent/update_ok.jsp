<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="u_vo" class="com.hb.mybatis.VO" />
<jsp:setProperty property="*" name="u_vo"/>

<%
    int result = DAO.getUpdate(u_vo);
	pageContext.setAttribute("result", result);
%>
    <c:choose>
		<c:when test="${result>0 }">
			<c:redirect url="onelist.jsp">
				<c:param name="idx" value="${vo.idx }"/>
			</c:redirect>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
      			alert("업데이트실패");
      			history.go(-1);
    		</script>	
		</c:otherwise>
	</c:choose>
    
    

