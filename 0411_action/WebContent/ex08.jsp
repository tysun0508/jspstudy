<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8") ;%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 일반적인 파리미터 처리</h2>
	이름 : <%= request.getParameter("name") %>
	나이 : <%= request.getParameter("age") %>
	<hr />
	<h2> 속성을 이용해서 파라미터 처리</h2>
	<%
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("age", request.getParameter("age"));
		session.setAttribute("name", request.getParameter("name"));
		session.setAttribute("age", request.getParameter("age"));
	%>
	이름 : <%= request.getAttribute("name") %>
	나이 : <%= request.getAttribute("age") %>
	<hr />
	이름 : <%= session.getAttribute("name") %>
	나이 : <%= session.getAttribute("age") %>
	<hr />
	<h2> 자바빈 이용해서 파라미터 처리</h2>
	<%-- 자바Bean이란 jsp에서 데이터를 저장할 목적으로 제공되는 저장공간 
	     사용순서 : 
	     1. 무조건 VO 만든다.(변수들 파라미터이름들과 같아야 한다.)
	     2. 자바빈 생성(<jsp:useBean>액션 이용)
	        // 마치 자바에서 VO vo = new VO(); 와 같은 효과
	        <jsp:useBean id="별칭" class="vo위치" scope="생명주기" />	
	      scope : page(기본) < request < session < application
	      
	      setter를 호출해서 파라미터값을 모두 넣었다.
	      : 파라미터이름과 변수이름을 같으며 property="*" 사용
	         name="vo"는 위에서 만든 useBean id 호출
	      3.<jsp:setProperty property="*" name="useBean의 id"/>
	      
	     
	      4. 값 불러오기 : 
	      <jsp:getProperty property="변수이름" name="useBean의 id"/>
	--%>
    <jsp:useBean id="vo" class= "com.hb.am.VO" scope="page" />
    <jsp:setProperty property="*" name="vo"/>
    
    이름 : <jsp:getProperty property="name" name="vo"/>
    나이 : <jsp:getProperty property="age" name="vo"/>
    <hr />
     이름 : <%=vo.getName() %>
     나이 : <%=vo.getAge() %>
</body>
</html>
