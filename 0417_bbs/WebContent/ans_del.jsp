<%@page import="com.hb.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String c_idx = request.getParameter("c_idx");
    String b_idx = request.getParameter("b_idx");
    
    DAO.getAns_Delete(c_idx);
    response.sendRedirect("view.jsp?b_idx="+b_idx);
%>    
