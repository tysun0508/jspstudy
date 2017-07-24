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
<title>회원 목록</title>
<style type="text/css">
	table { width: 40%;  margin: auto;  text-align: center;}
	table, th, td {border: 1px solid black;}
	h1 { text-align: center;}
</style>
</head>
<body>
	<%
	    String res =(String)session.getAttribute("chk");
	if( res == null){%>
		<script type="text/javascript">
			alert("로그인 하세요");
			location.href="index.jsp";
		</script>	   
	<%}else if(res.equals("login_ok")){
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
    	String sql = "select * from hbmember order by idx";
    	pstm = conn.prepareStatement(sql);
    	rs = pstm.executeQuery();
    %>	
       <h1> 회원 정보 목록 </h1>
    	<table>
    		<thead>
    			<tr><th> 아이디 </th> <th> 이름 </th> <th> 삭제 여부 </th></tr>
    		</thead>
    	    <tbody>
    	    <%
    	    	while(rs.next()){
					out.println("<tr>");
					out.println("<td><a href='onelist.jsp?idx="+rs.getInt("idx")+"'>"+rs.getString("id")+"</a></td>");
					out.println("<td>"+rs.getString("name")+"</td>");
					out.println("<td><a href='dellist.jsp?idx="+rs.getInt("idx")+"'> 삭 제 </td>");
					out.println("</tr>");    	    		
    	    	}
    	    %>	
    	    </tbody>
    	</table>
    <%}catch(Exception e){
    	
    }finally{
    	try{
    		rs.close();
    		pstm.close();
    		conn.close();
    	}catch(Exception e){
    		
    	}
    }
	}
%>
</body>
</html>