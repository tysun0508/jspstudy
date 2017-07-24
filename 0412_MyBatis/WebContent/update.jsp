<%@page import="com.hb.mybatis.VO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트</title>
<script type="text/javascript">
	function update2_go(f) {
		f.action="update_ok.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="index.jsp" />
	<br />	<br />
	<hr />
	<form>
		<table>
			<thead>
				<tr><th colspan="2"> 개인 회원 정보</th></tr>
			</thead>
			<tbody>
			<% SqlSession ss = DBService.getFactory().openSession(); 
				VO vo4 = ss.selectOne("onelist", request.getParameter("id"));
				ss.close();
			%>
			   <tr>
			   		<td> 아이디 </td>
			   		<td><%=vo4.getId() %></td>
			   		<input type="hidden" name="id" value="<%=vo4.getId() %>" />
			   </tr>
			   <tr>
			   		<td> 이름 </td>
			   		<td><input type="text" size=20 name="name" value="<%=vo4.getName() %>" /></td>
			   </tr>
			   <tr>
			   		<td> 나이 </td>
			   		<td><input type="text" size=20 name="age" value="<%=vo4.getAge() %>" /></td>
			   </tr>
			   <tr>
			   		<td> 주소 </td>
			   		<td><input type="text" size=20 name="addr" value="<%=vo4.getAddr() %>" /></td>
			   </tr>
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="2">
						<input type="button" value="고치기" onclick="update2_go(this.form)" />&nbsp; &nbsp;
				</tr>	
			</tfoot>
		</table>
	</form>
</body>
</html>