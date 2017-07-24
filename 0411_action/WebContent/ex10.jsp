<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="vo" class="com.hb.am.VO2" />
	<jsp:setProperty property="*" name="vo" />
	<h2>
		<ul>
			<li>이름 : <%=vo.getName()%>	</li>
			<li>나이 : <%=vo.getAge()%></li>
			<li>주소 : <%=vo.getAddr()%></li>
			<li>성별 : <%=vo.getGender()%></li>
			<li>취미 :
			  <% 
			  	for(String k : vo.getHobby()){
			  		out.println(k + "&nbsp;&nbsp;");
			  	}
			  %>
			</li>
			<li>거주지 : <%=vo.getAddr2()%></li>
			<li>운동 :
			<% 
			  	for(String k : vo.getPlay()){
			  		out.println(k + "&nbsp;&nbsp;");
			  	}
			  %>
			</li>
		</ul>
	</h2>
</body>
</html>