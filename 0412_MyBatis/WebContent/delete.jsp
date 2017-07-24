<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="vo3" class= "com.hb.mybatis.VO" />
	<jsp:setProperty property="*" name="vo3"/>
	
	<%
		SqlSession ss = DBService.getFactory().openSession(false);
		
		int result = ss.insert("delete", vo3);
		   
		if(result>0){
	    	response.sendRedirect("list.jsp");
	    }else{%>
		    <script type="text/javascript">
		    	alert("삭제 실패");
		    	location.href="list.jsp";
		    </script>	
	   <% } 
		ss.commit();
		ss.close();
	%>
</body>
</html>