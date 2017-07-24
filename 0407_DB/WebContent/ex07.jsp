<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> DB 연동 </title>
</head>
<body>
	<div>
<h2> 검색 결과 </h2>
   	<%
		Connection conn = null;
	    PreparedStatement pstm = null;
	    try{
	    	Class.forName("oracle.jdbc.OracleDriver");
	    	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	    	String user ="hr";
	    	String password ="1111";
	        conn = DriverManager.getConnection(url, user, password)	;
	        String sql = "update hbmember set  name=? , age=?, addr=? where id = ?" ;
	        pstm = conn.prepareStatement(sql);
	        pstm.setString(1, request.getParameter("name"));
	        pstm.setInt(2, Integer.parseInt(request.getParameter("age")));
	        pstm.setString(3, request.getParameter("addr"));
	        pstm.setString(4, request.getParameter("id"));
	        
	        int res = pstm.executeUpdate();
	        if(res>=1){
				response.sendRedirect("ex01.jsp");	        	
	        }else{
	        	response.sendRedirect("ex01.jsp");
	        }
    	%>
	   
	<%}catch(Exception e){
		response.sendRedirect("ex01.jsp");
      }finally{
    	  try{
    		  pstm.close();
    		  conn.close();
    	  }catch(Exception e){
    		  
    	  }
      }
	%>
	<br />
	<hr />
	<%@include file="ex02.jsp" %>   
 </div>
</body>
</html>