<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String addr = request.getParameter("addr");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> DB 연동 </title>
</head>
<body>
	<%
		Connection conn = null;
	    PreparedStatement pstm = null;
	    try{
	    	Class.forName("oracle.jdbc.OracleDriver");
	    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    	String user = "hr";
	    	String password = "1111";
	    	conn = DriverManager.getConnection(url, user, password);
	    	
	    	String sql = "insert into hbmember values(hbmember_seq.nextval,?,?,?,?,?)";
	    	pstm = conn.prepareStatement(sql);
	    	pstm.setString(1, id);
	    	pstm.setString(2, pwd);
	    	pstm.setString(3, name);
	    	pstm.setInt(4, Integer.parseInt(age));
	    	pstm.setString(5, addr);
	    			
	       int res = pstm.executeUpdate();
	       if(res >= 1){
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
</body>
</html>