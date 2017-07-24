<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try{
	// 댓글 존재하면 원글 삭제시 Exception 발생된다.(무결정 참조조건)
	request.setCharacterEncoding("utf-8");
   	String b_idx = request.getParameter("b_idx");
   
   	DAO.getDelete(b_idx);
   	response.sendRedirect("list.jsp");
	}catch(Exception e){%>
		<script type="text/javascript">
			alert("댓글 먼저 삭제 하세요");
			history.go(-2);
		</script>
	<%}%>
	
