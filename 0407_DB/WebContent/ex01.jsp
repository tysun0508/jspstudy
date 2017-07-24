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
<style type="text/css">
	div{text-align: center;margin-top: 50px}
	table { width: 70%;  margin: auto; }
	table,th,td {border: 1px solid black; }
</style>
</head>
<body>
	<%
	    Connection conn = null;
	    PreparedStatement pstm = null;
	    ResultSet rs = null;
	  
	    try{
		   Class.forName("oracle.jdbc.OracleDriver");
		   String url = "jdbc:oracle:thin:@localhost:1521:xe";
		   String user = "hr";
		   String password = "1111";
		   conn = DriverManager.getConnection(url,user,password);
		   
		   String sql = "select * from hbmember order by idx";
		   pstm = conn.prepareStatement(sql);
		   rs = pstm.executeQuery();
	   %>
	   <div>
	      <h2> 전체보기</h2>
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
	      </div>
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

	<%-- 지시어 include :  해당 페이지의 소스를 가져와서 붙여넣기한 효과 --%>
	<%--  다른페이지의 소스를 가져와서 현재 페이지에서 해석  --%>
	    <%@include file="ex02.jsp" %>  
	<%-- 액션 include  --%>
	<%-- <jsp:include page="ex01.jsp"/><br /> --%>
</body>
</html>
