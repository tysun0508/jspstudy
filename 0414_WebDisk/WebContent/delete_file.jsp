<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

    String cPath = request.getParameter("cPath");
    String filename = request.getParameter("filename");
    
    String path = getServletContext().getRealPath("/member/"+cPath+"/"+filename);
    File file = new File(path);
    // 안에 빈폴더가 있어도 삭제 안됨
    boolean  res = file.delete();
    if(res){
    response.sendRedirect("mydisk.jsp?cPath="+cPath);
    }else{%>
    	<script>
    		alert("안에 내용을 먼저 삭제해 주세요");
    		 response.sendRedirect("mydisk.jsp?cPath="+cPath);
    	</script>	
   <% } %>