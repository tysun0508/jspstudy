<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String idx = request.getParameter("idx");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용수정하기</title>
<style type="text/css">
	table { width: 40%;  margin: auto;}
	table, th, td {border: 1px solid black; text-align: center;}
</style>
<script type="text/javascript">
	function up_go(f) {
		f.action="update_ok.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<%    
 	// DB처리 할때 필요한 클래스
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    try{
    	Class.forName("oracle.jdbc.OracleDriver");
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String user = "hr";
    	String password = "1111";
    	conn = DriverManager.getConnection(url, user, password);
    	String sql = "select * from hbmember where idx =? ";
    	pstm = conn.prepareStatement(sql);
    	pstm.setInt(1, Integer.parseInt(idx));
    	rs = pstm.executeQuery();
        %> 	
        <form>
	    	<table>
				<thead><tr><td colspan="2">개인정보 수정</td></tr></thead>
				<tbody>
			     <%	while(rs.next()){%>
			     	<tr>
			     		<td> 아이디 </td>
			     		<td><%=rs.getString("id")%></td>
			     	</tr>
			     	<tr>
			     		<td> 이름 </td>
			     		<td><input type='text' name='name' value="<%=rs.getString("name")%>" /></td>
			     	</tr>
			     	<tr>
			     		<td> 나이 </td>
			     		<td><input type='text' name='age' value="<%=rs.getInt("age")%>" /></td>
			     	</tr>
			     	<tr>
			     		<td> 주소 </td>
			     		<td><input type='text' name='addr' value="<%=rs.getString("addr")%>" /></td>
			     	</tr>
			     	<%} %>
				</tbody>   
				<tfoot>
					<input type="hidden" name="idx" value="<%=idx %>" />
					<tr><td colspan="2"><a href="list.jsp">리스트로 돌아가기</a></td></tr>
					<tr><td colspan="2"><input type="button" value="업데이트" onclick="up_go(this.form)" />  </td></tr>
					
				</tfoot> 	
	    	</table>
    	</form>
      <%}catch(Exception e){
    	  
        }finally{
	      	try{
	    		rs.close();
	    		pstm.close();
	    		conn.close();
	    	}catch(Exception e){
	    		
	    	}
	    }
      %>    
</body>
</html>