<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>    
<jsp:useBean id="vo5" class="com.hb.mybatis.VO" />
<jsp:setProperty property="*" name="vo5"/>
<%
	SqlSession ss = DBService.getFactory().openSession(false);
	 int result =  ss.update("update", vo5);
	 if(result>0){
		 response.sendRedirect("list.jsp");
	 }else{%>
		<script type="text/javascript">
			alert("삭제 실패");
			history.go(-1);
		</script> 
	 <%}
     ss.commit();
     ss.close();
%>
