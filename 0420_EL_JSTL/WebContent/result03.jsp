<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%--EL은 파라미터값을 별도로 scope에 저장하지 않는다.
	     내장 객체 중 param, paramValues를 사용하면 된다.
	  --%> 
	<h2> 결과 보기 </h2>
	<h3>
		<ul>
			<li>이름 : ${param.name}</li>		
			<li>나이 : ${param.age}</li>		
			<li>성별 : ${param.gender}</li>		
			<li>취미 : ${paramValues.hobby[0]}${paramValues.hobby[1]}
			          ${paramValues.hobby[2]}${paramValues.hobby[3]}
			</li>		
			<li>거주지 : ${param.addr}</li>		
			<li>취미 : ${paramValues.ani[0]}${paramValues.ani[1]}
			          ${paramValues.ani[2]}${paramValues.ani[3]}
			</li>		
		</ul>
	</h3>
</body>
</html>