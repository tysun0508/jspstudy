<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EL(표현언어)</title>
</head>
<body>
<%--
	EL(표현언어) : JSP 에서 사용가능한 새로운 스크립트 언어
	- 4가지 영역의 속성 사용
	  (pageContext, request, session, application)
	 속성 이름이 같을 경우
	   pageContext > request > session > application
	 - 사용법 : 반드시 4가지 속성에 변수가 존재해야 사용가능   
	  <%=변수%>, <%=계산식%> 대신  ${변수},${계산식}
	  - 파라미터값은 별도로 속성에 저장하지 않아도 된다.
	    이유) EL 내장객체 중 param, paramValues을 사용
 --%>
 	<h2>표현식 산술연산 사용 예제</h2>
 	<h3>
 		<ul>
 			<li>15+7=<%=15+7 %></li>
 			<li>15-7=<%=15-7 %></li>
 			<li>15*7=<%=15*7 %></li>
 			<li>15/7=<%=15/7 %></li>
 			<li>15%7=<%=15%7 %></li>
 		</ul>
 	</h3>
 	<hr />
 	<h2>EL 산술연산 사용 예제</h2>
 	<h3>
 		<ul>
 			<li>15+7=${15+7}</li>
 			<li>15-7=${15-7}</li>
 			<li>15*7=${15*7}</li>
 			<li>15/7=${15/7}</li>
 			<li>15%7=${15%7}</li>
 		</ul>
 	</h3>
 	<hr />
 	<%! int su = 125 + 25 ; %>
 	<li> 125+25 = <%=su%> </li>
 	<%-- 4속성 중 하나에 변수를 저장 하고 사용해야 된다. --%>
 	<% pageContext.setAttribute("su", su) ;%>
 	<li> 125+25 = ${su} </li>
 	<HR />
 	<%-- 속성들의 이름은 같으나 값이 틀릴 경우,
 	     우선 순위 ;  pageContext > request > session > application
 	 --%>
 	<% pageContext.setAttribute("pc", "i3") ;
       request.setAttribute("pc", "i5")	;
       session.setAttribute("pc", "i7")	;%>
      <hr />
      <li> 그냥 호출 : ${pc} </li>
      <li> pageContext : ${pageScope.pc} </li>
      <li> request : ${requestScope.pc} </li>
      <li> session : ${sessionScope.pc} </li>
       
</body>
</html>




















