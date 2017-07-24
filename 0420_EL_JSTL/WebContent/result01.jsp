<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String addr = request.getParameter("addr");
    String[] hobby = request.getParameterValues("hobby");
    String[] ani = request.getParameterValues("ani");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 결과 보기 </h2>
	<h3>
		<ul>
			<li>이름 : <%=name %></li>		
			<li>나이 : <%=age %></li>		
			<li>성별 : <%=gender %></li>		
			<li>취미 : 
			    <%for(String k:hobby){%>
			        <%=k %> &nbsp;&nbsp;
			    <%} %>
			</li>		
			<li>거주지 : <%=addr %></li>		
			<li>취미 : 
			    <%for(String k:ani){%>
			        <%=k %> &nbsp;&nbsp;
			    <%} %>
			</li>		
		</ul>
	</h3>
</body>
</html>
