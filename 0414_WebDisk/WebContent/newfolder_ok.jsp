<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cPath = request.getParameter("cPath");
	String  folder_name = request.getParameter("folder_name");
	String path = getServletContext().getRealPath("/member/"+cPath+"/"+folder_name);
	File file = new File(path);
	file.mkdirs();
	response.sendRedirect("mydisk.jsp?cPath="+cPath);
%>
