<%@page import="com.hb.mybatis.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보 페이지</title>
</head>
<body>
	<%
		Boolean chk = false;
		chk = (Boolean) session.getAttribute("login_chk");
		if(chk == null){%>
			<script>
				alert("로그인 하고 오세요");
				location.href="index.jsp";
			</script>		
		<%}else{
			VO mvo = (VO)session.getAttribute("mvo");
		%>
		<div align="center">
			<h2>나의 정보 보기</h2>
			<table width="600px" cellpadding="5" cellspacing="0" border="1" style="text-align: center;">
				<tbody>
					<tr>
						<td bgcolor="#99ccff">번호</td>
						<td><%= mvo.getIdx() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">아이디</td>
						<td><%= mvo.getId() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">패스워드</td>
						<td><%= mvo.getPwd() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">이름</td>
						<td><%= mvo.getName() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">나이</td>
						<td><%= mvo.getAge() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">주소</td>
						<td><%= mvo.getAddr() %></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<a href="mydisk.jsp">MyDisk</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<%}%>
</body>
</html>
