<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String cPath = request.getParameter("cPath");
%>
	<form action="newfolder_ok.jsp">
		폴더명 : <input type="text" name="folder_name" />
		         <input type="submit" value="폴더만들기" />
	             <input type="hidden" name="cPath" value="<%=cPath %>" />
	</form>
