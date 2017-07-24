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
    	String sql = "select * from hbmember where id =? and pwd =?";
    	pstm = conn.prepareStatement(sql);
    	pstm.setString(1, id);
    	pstm.setString(2, pwd);
    	rs = pstm.executeQuery();
    	
    	if(rs.next()){
    		out.println("<h2>"+rs.getString("name")+"님 로그인 성공. <br />");
    		out.println("<a href='list.jsp'>관리자 페이지로 이동 </a></h2>");
    		session.setAttribute("chk","login_ok") ;
    		
    		}else{%>
    		<script type="text/javascript">
				var chk = confirm("아이디나 패스워드가 틀렸습니다.\n다시 입력할까요?");
				if(chk){
					history.go(-1);
				}else{
					location.href="add.jsp";
				}
			</script>
    	<%}
    }catch(Exception e){
    	
    }finally{
    	try{
    		rs.close();
    		pstm.close();
    		conn.close();
    	}catch(Exception e){
    		
    	}
    }
%>    