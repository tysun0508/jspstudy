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
	div{text-align: center;margin-top: 20px}
	table { width: 50%;  margin: auto; }
	table,th,td {border: 1px solid black; height: 30px}
</style>
<script type="text/javascript">
	function update2_go(f) {
		f.action="ex07.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<div>
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
	        pstm.setString(1, request.getParameter("id"));
	        rs = pstm.executeQuery();
    	%>
		<form>
		<table>
			<thead>
				<tr><th colspan="2"> 개인 회원 정보</th></tr>
			</thead>
			<tbody>
			 	<% while(rs.next()){%>
			   <tr>
			   		<td> 아이디 </td>
			   		<td> <%=rs.getString(2)%> </td>
			   		<input type="hidden" name="id" value="<%=rs.getString(2)%>" />
			   </tr>
			   <tr>
			   		<td> 이름 </td>
			   		<td> <input type="text" name="name"  value="<%=rs.getString(4) %>" /> </td>
			   </tr>
			   <tr>
			   		<td> 나이 </td>
			   		<td> <input type="text" name="age"  value="<%=rs.getString(5) %>" /> </td>
			   </tr>
			   <tr>
			   		<td> 주소 </td>
			   		<td> <input type="text" name="addr"  value="<%=rs.getString(6) %>"/> </td>
			   </tr>
			   	<%} %>	
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="2">
						<input type="button" value="고치기" onclick="update2_go(this.form)" />&nbsp; &nbsp;
				</tr>	
			</tfoot>
		</table>
	</form>
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