<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 request.setCharacterEncoding("utf-8");
     String idx = request.getParameter("idx");
     
     // DB처리 할때 필요한 클래스
     Connection conn = null;
     PreparedStatement pstm = null;
     try{
     	Class.forName("oracle.jdbc.OracleDriver");
     	String url = "jdbc:oracle:thin:@localhost:1521:xe";
     	String user = "hr";
     	String password = "1111";
     	conn = DriverManager.getConnection(url, user, password);
     	String sql = "delete from hbmember where idx = ? ";
     	pstm = conn.prepareStatement(sql);
     	pstm.setString(1, idx);
     	
     	int res = pstm.executeUpdate();
     	if(res >=1){%>
     		<script type="text/javascript">
 				alert("삭제 성공");
 				location.href="list.jsp";
 			</script>
     	<%}else{%>
     		<script type="text/javascript">
     		alert("삭제 실패");
 			history.go(-1);
 			</script>
     	<%}
     }catch(Exception e){
     }finally{
     	try{
         	pstm.close();
         	conn.close();
         }catch(Exception e){
         	
         }
     }
%>