<%@page import="javax.websocket.SendResult"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String cPath = (String)session.getAttribute("cPath");
    String path = getServletContext().getRealPath("/member/"+cPath);
    MultipartRequest mr = new MultipartRequest(
    		request,
    		path,
    		500*1024*1024,
    		"utf-8",
    		new DefaultFileRenamePolicy());
  response.sendRedirect("mydisk.jsp?cPath="+cPath);  
%>






