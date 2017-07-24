<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본객체 : request </title>
</head>
<body>
	<%-- 
	     기본객체 : jsp가 가지고 있는 기본적인 지원기능
	               request, response,out,page,pageContext,session
	               application, config, exception 
	               
	     1. request : 클라이언트의 요청정보를 저장한다.(p73)
	        1) getRemoteAddr() : 클라이언트 IP주소 구한다.
	        2) getContentLenght() 
	        3) getCharacterEncoding()
	        4) getContentType()
	        5) getProtocol()
	        6) getMethod()
	        7) getRequestURI()
	        8) getContextPath()
	        9) getServerName()
	        10) getServerPort()
	       //////////////////////////////////////////////
	        ** 요청 파라미터 관련 메소드
	        1) getParameter(String name) : String
	        2) getParameterValues(String name) : String[]
	        3) getParameterMap() : Map
	        4) getParameterNames :  Enumeration(열거형) 
	        //////////////////////////////////////////////
	         ** 포워딩 :  
	         request.getRequestDispatcher("이동할곳")
	         .forward(request, response)
	         ////////////////////////////////////////////// 
	         ** 주요  메소드
	         request.getSession() => 세션 호출할때 사용  
	 		 request.setAttribute("이름", 값) => 속성지정 
	 		 request.getAttribute("이름") => 속성 호출
	        ////////////////////////////////////////////// 
	         헤더 관련 메소드(p89)
	         1) getHeader(String name) : 헤더값 구하기
	         2) getHeaders(Enumeration) :  헤더 목록 구하기
	         3) getNeaderNames() : Enumeration :모든 해더 이름 구하기
	         4) getIntHeader(String name) : int : 헤더 값을 정수 값으로 읽어옴
	         5) getDateHeader(String name) :long :  헤더 값을 시간 값을 읽어옴
	                        
	 --%>
	
</body>
</html>
