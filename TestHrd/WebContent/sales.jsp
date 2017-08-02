<%@page import="DBPKG.DAO"%>
<%@page import="DBPKG.SalesVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.one{
	height: 650px;
}
table, tr, td{
	border: 1px solid black;
	text-align: center;
	margin: auto;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="one">
	<h2 align="center">회원매출조회</h2>
	<div align="center">
		<table>
		<thead>
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
		</thead>
		<tbody>
			<% List<SalesVO> salelist = DAO.getInstance().getSales(); %>
			<% for(SalesVO k : salelist){ %>
			<tr>
				<td><%=k.getCustno()%></td>
				<td><%=k.getCustname()%></td>
				<td><%=k.getGrade()%></td>
				<td><%=k.getPrice()%></td>
			</tr>
			<%} %>
		</tbody>
		</table>
	</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>