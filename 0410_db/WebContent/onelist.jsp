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
<title>상세정보보기</title>
<style type="text/css">
	table { width: 40%;  margin: auto;}
	table, th, td {border: 1px solid black; text-align: center;}
</style>
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
    	<table>
			<thead><tr><td colspan="2">개인정보 확인</td></tr></thead>
			<tbody>
		     <%
		     	while(rs.next()){
		     		out.println("<tr>");
		     		out.println("<td> 아이디 </td><td>"+rs.getString("id")+"</td>");
		     		out.println("</tr>");
		     		out.println("<tr>");
		     		out.println("<td> 이름 </td><td>"+rs.getString("name")+"</td>");
		     		out.println("</tr>");
		     		out.println("<tr>");
		     		out.println("<td> 나이 </td><td>"+rs.getInt("age")+"</td>");
		     		out.println("</tr>");
		     		out.println("<tr>");
		     		out.println("<td> 주소 </td><td>"+rs.getString("addr")+"</td>");
		     		out.println("</tr>");
		     	}
		     %>
			</tbody>   
			<tfoot>
				<tr><td colspan="2"><a href="list.jsp">리스트로 돌아가기</a></td></tr>
				<%-- 1.idx 넘겨서 DB처리 --%>
				<%-- 2.session.setAttribute를 이용해서 저장하는  --%>
				<tr><td colspan="2"><a href="update.jsp?idx=<%=idx%>">수정하기</a></td></tr>
				
			</tfoot> 	
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
      %>    
</body>
</html>