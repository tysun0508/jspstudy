<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

    String idx = request.getParameter("idx");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String addr = request.getParameter("addr");
    
 // DB처리 할때 필요한 클래스
    Connection conn = null;
    PreparedStatement pstm = null;
    try{
    	Class.forName("oracle.jdbc.OracleDriver");
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String user = "hr";
    	String password = "1111";
    	conn = DriverManager.getConnection(url, user, password);
    	String sql = "update  hbmember set name=?, age=?, addr =? where idx =?   ";
    	pstm = conn.prepareStatement(sql);
    	pstm.setString(1, name);
    	pstm.setInt(2, Integer.parseInt(age));
    	pstm.setString(3, addr);
    	pstm.setInt(4, Integer.parseInt(idx));
    	
    	int res = pstm.executeUpdate();
    	if(res >=1){%>
    		<script type="text/javascript">
				alert("업데이트 성공");
				location.href="list.jsp";
			</script>
    	<%}else{%>
    		<script type="text/javascript">
    		alert("업데이트 실패");
			history.go(-1);
			</script>
    	<%}
    }catch(Exception e){
    	System.out.println(e);
    }finally{
    	try{
        	pstm.close();
        	conn.close();
        }catch(Exception e){
        	
        }
    }
%>    

