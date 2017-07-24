<%@page import="com.hb.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="cvo" class="com.hb.mybatis.CVO" />
<jsp:setProperty property="*" name="cvo"/>
<%
	cvo.setIp(request.getRemoteAddr());
	DAO.getAns_Insert(cvo);
	response.sendRedirect("view.jsp?b_idx="+cvo.getB_idx());
%>
