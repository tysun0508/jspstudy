<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // request객체를 이용해서 파라미터값 받기
	String name = request.getParameter("name");
    String age = request.getParameter("age");
    String addr = request.getParameter("addr");
    String gender = request.getParameter("gender");
    String[] hobby = request.getParameterValues("hobby");
    String addr2 = request.getParameter("addr2");
    String[] play = request.getParameterValues("play");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본객체 : request </title>
</head>
<body>
	<h1> 파라미터 전송 결과보기</h1>
	<h2>
		<ul>
		    <li>요청 정보 인코딩 : <%=request.getCharacterEncoding() %></li>		
			<li>요청 정보 컨텐츠 타입 : <%=request.getContentType() %></li>		
			<hr />
			<li>이름 : <%=name %></li>
			<li>나이 : <%=age %></li>
			<li>주소 : <%=addr %></li>
			<li>성별 : <%=gender %></li>
			<li>취미 :  
				<% for(String k : hobby){
					out.print(k+"&nbsp;&nbsp;");	
				}%>
			</li>
			<li>거주지 :  <%=addr2 %></li>
			<li>운동 :  
				<% for(String k : play){
					out.print(k+"&nbsp;&nbsp;");
				 }%>	
			</li>
		</ul>
	</h2>
</body>
</html>