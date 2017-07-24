<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id"); 
    String pwd = request.getParameter("pwd"); 
    String name = request.getParameter("name"); 
    int age =  Integer.parseInt(request.getParameter("age")); 
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
    	String sql = "insert into hbmember values(hbmember_seq.nextval,?,?,?,?,?)";
    	pstm = conn.prepareStatement(sql);
    	pstm.setString(1, id);
    	pstm.setString(2, pwd);
    	pstm.setString(3, name);
    	pstm.setInt(4, age);
    	pstm.setString(5, addr);
    	
    	int res = pstm.executeUpdate();
    	if(res >=1){%>
    		<script type="text/javascript">
				alert("회원가입 성공");
				location.href="index.jsp";
			</script>
    	<%}else{%>
    		<script type="text/javascript">
    		alert("회원가입 실패");
			location.href="add.jsp";
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
