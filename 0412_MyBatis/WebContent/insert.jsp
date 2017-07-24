<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삽입</title>
</head>
<body>
	<jsp:useBean id="vo2" class="com.hb.mybatis.VO" />
	<jsp:setProperty property="*" name="vo2"/>
	
	<%
	   // insert, delete, update의 기본은 수동 커밋 => 반드시 commit()해야 됨
		SqlSession ss = DBService.getFactory().openSession(false);
		// insert, delete, update의 결과는 int 이다.
	    int result = ss.insert("insert", vo2);
	   
		if(result>0){
	    	response.sendRedirect("list.jsp");
	    }else{%>
	    <script type="text/javascript">
	    	alert("삽입실패");
	    	location.href="list.jsp";
	    </script>	
	   <% }
		ss.commit();
		ss.close();
	%>
</body>
</html>


