<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> DB 연동 </title>
<style type="text/css">
	div{text-align: center;}
	table { width: 70%;  margin: auto; }
	table,th,td {border: 1px solid black; }
</style>
</head>
<body>
<div>
<h2> 검색 결과 </h2>
   	<%
		Connection conn = null;
	    PreparedStatement pstm = null;
	    ResultSet rs = null;
	    try{
	    	Class.forName("oracle.jdbc.OracleDriver");
	    	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	    	String user ="hr";
	    	String password ="1111";
	        conn = DriverManager.getConnection(url, user, password)	;
	        String sql = "select * from hbmember where id = ?" ;
	        pstm = conn.prepareStatement(sql);
	        pstm.setString(1, id);
	        rs = pstm.executeQuery();
    	%>
	   <table>
	   		<thead>
	      		<tr><th>idx</th><th>id</th><th>pwd</th><th>name</th><th>age</th><th>addr</th></tr>
	      	</thead>
	      	<tbody>
	      	<% while(rs.next()){%>
	      		<tr>
	      			<td><%=rs.getInt("idx") %></td>
	      			<td><%=rs.getString(2) %></td>
	      			<td><%=rs.getString(3) %></td>
	      			<td><%=rs.getString(4) %></td>
	      			<td><%=rs.getInt(5) %></td>
	      			<td><%=rs.getString(6) %></td>
	      		</tr>
	      	<%} %>	
	      	</tbody>
	   </table>
	<%}catch(Exception e){
			System.out.println("DB오류");
      }finally{
    	  try{
    		  rs.close();
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