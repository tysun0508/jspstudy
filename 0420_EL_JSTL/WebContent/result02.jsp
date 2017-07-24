<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%-- 자바빈 사용 --%>
<jsp:useBean id="vo" class="com.hb.vo.VO" />
<jsp:setProperty property="*" name="vo"/>    
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
			<li>이름 : <%=vo.getName() %></li>		
			<li>나이 : <%=vo.getAge() %></li>		
			<li>성별 : <%=vo.getGender() %></li>		
			<li>취미 : 
			    <%for(String k:vo.getHobby()){%>
			        <%=k %> &nbsp;&nbsp;
			    <%} %>
			</li>		
			<li>거주지 : <%=vo.getAddr() %></li>		
			<li>취미 : 
			    <%for(String k:vo.getAni()){%>
			        <%=k %> &nbsp;&nbsp;
			    <%} %>
			</li>		
		</ul>
	</h3>
</body>
</html>
