<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본객체 : request </title>
</head>
<body>
	<h1> 클라이언트 및 서버 정보 </h1>
	<h2>
		<ul>
			<li>클라이어트 IP : <%= request.getRemoteAddr() %> </li>		
			<li>요청 정보 길이 : <%=request.getContentLength() %></li>		
			<li>요청 정보 인코딩 : <%=request.getCharacterEncoding() %></li>		
			<li>요청 정보 컨텐츠 타입 : <%=request.getContentType() %></li>		
			<li>요청 정보 프로토콜방식 : <%=request.getProtocol() %></li>		
			<li>요청 정보 전송방식 : <%=request.getMethod() %></li>		
			<li>요청 URI : <%=request.getRequestURL() %></li>		
			<li>컨텍스트 경로 : <%=request.getContextPath() %></li>	
			<li>컨텍스트 정보 : <%=request.getServletContext() %></li>			
			<li>서버 이름 : <%=request.getServerName() %></li>		
			<li>서버 포트 : <%=request.getServerPort() %></li>		
		</ul>
	</h2>
</body>
</html>