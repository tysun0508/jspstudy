<%@page import="com.hb.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="mvo" class="com.hb.mybatis.MVO" />
<jsp:setProperty property="*" name="mvo"/>
<% int res = DAO.getInsert(mvo);
	if(res>=1){%>
		<script>
			alert("회원가입 성공");
			location.href="login.jsp";
		</script>
	<%}else{%>
		<script>
			alert("회원가입 실패");
			history.go(-1);
		</script>
	<%}%>