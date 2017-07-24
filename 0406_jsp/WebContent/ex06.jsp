<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 영역과 속성 : 데이터 저장과 호출 </title>
</head>
<body>
<%--
	웹 어플리케이션은 4가지 영역을 사용해서 데이터를 저장 / 호출한다.
	 pageContext 객체 : 하나의 페이지를 처리할때 사용되는 영역
	                'page영역'이라고함, 
	                 해당 페이지를 벗어나면 정보 삭제됨  
	 request 객체 : 하나의 요청을 처리할때 사용되는 영역
	               'request영역'이라고함
	               response를 하면 정보 삭제됨
	               포워드는 request영역이 같고
	               리다이렉트를 하면 request영역이 다른다.
	 session 객체 ; 하나의 웹 브라우저와 관련된 영역
	                'session영역'이라고함
	                웹브라우저가 종료되면 정보도 삭제됨
	 application 객체 : 하나의 웹 어플리케이션과 과련된 영역
	                   'application'영역이라고함,
	                   어플리케이션이 종료되면 정보도 삭제됨
	                   
    // 목적 :  페이지 사이에 정보를 주고 받거나 공유할 목적으로 사용
     데이터를 저장 :  객체.setAttribute("이름",값);
     데이터를 호출 :  객체.getAttribute("이름");                                                                
     
--%>	
</body>
</html>