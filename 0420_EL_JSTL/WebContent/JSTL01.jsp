<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>JSTL : jsp 표준 태그 라이브러리</title>
</head>
<body>
<%--
   1. jstl 라이브러리 다운 받기 : tomcat.apache.org
   2. 라이브러리 지시어 사용 : 
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 --%>
 <%-- 변수 태그 (set) ; <c:set var="변수이름" value="변수값"/> --%>
 <c:set var="test" value="Hello JSTL" />
 
 <%-- 출력 태그 (out) : <c:out value="출력값 or 변수명(EL방식)" /> --%>
 <h2>
 	<p> <c:out value="test" />  </p>
 	<p> <c:out value="${test }" />  </p>
 	<p> ${test } </p>
 	<hr />
 <%-- 변수삭제 :  <c:remove var="변수이름"/> --%>
  <c:remove var="test"/>
  	<p> 출력 :  <c:out value="${test }" />  </p>
 	<p> 출력 :  ${test } </p>
 	<hr />
 <%-- if문 : else가 존재하지않음, 조건이 참일때만 실행함 
    <c:if test="조건식(EL사용)" var="변수명"></c:if>	
 --%>
  <c:if test="${5==5}" var="k">
       <p>결과1 : ${k}</p> 
       <p>결과2 : <c:out value="${k }" /></p> 
  </c:if>
 <hr />	
 <c:if test="${6==5}" var="k">
       <p>결과3 : ${k}</p> 
       <p>결과4 : <c:out value="${k }" /></p> 
  </c:if>
  <hr />
  <c:set var="sum" value="80" />
  <c:if test="${sum>=60}" var="res" />
    <p>결과5 : ${res}</p>
   <hr />
   
  <%-- choose문  switch문과 비슷, (if~else 대용) 
   <c:choose>
   		<c:when test="조건"></c:when>  => case문
   		<c:when test="조건"></c:when>  => case문
   		<c:when test="조건"></c:when>  => case문
   		<c:otherwise></c:otherwise>    => default문 
   </c:choose>    
  --%>
 <%-- test가 60이상이면 합격, 아니면 불합격 --%>
    <c:set var="test" value="90" /> 
    <c:if test="${test>=60}">
    	<c:set var="result" value="합격" />
    </c:if>
    <c:if test="${test<60}">
    	<c:set var="result" value="불합격" />
    </c:if>
    결과 : ${result} , <c:out value="${result }" />
    <hr />
    <c:choose>
    	<c:when test="${test>=60 }">
    		<c:set var="result" value="합" />
    	</c:when>	
    	<c:otherwise>
    		<c:set var="result" value="불" />
    	</c:otherwise>
    </c:choose>
    <hr />
     결과 : ${result} , <c:out value="${result }" />
    <%-- 조건식에서
         list.size()== 0 || list.size==null 보다 empty 사용
     --%>
 <%-- total 이 90이상 A, 80이상 B, 70 이상 C, 나머지 F --%>
    <c:set var="total" value="77" />
    <c:choose>
    	<c:when test="${total>=90 }">결과 : A학점</c:when>
    	<c:when test="${total>=80 }">결과 : B학점</c:when>
    	<c:when test="${total>=70 }">결과 : C학점</c:when>
        <c:otherwise>
        	결과 : F 학점
        </c:otherwise>    
    </c:choose>
    <hr/>
    
    <!-- 일반 for문 -->
   <c:forEach begin="1" end="10" step="1" var="k">
   	   ${k } &nbsp; &nbsp;
   </c:forEach> 
   <hr />
   <c:forEach begin="1" end="10" step="1" var="k">
   	   <c:if test="${k%2==0}">
   	   		  ${k } &nbsp; &nbsp;
   	   </c:if>
   </c:forEach> 
   <hr />
   <c:forEach begin="0" end="10" step="1" var="k" varStatus="vs">
   	   ${k } / ${vs.index} /${vs.count}&nbsp; &nbsp;
   </c:forEach> 
   <hr/>
   <%-- 개선된 for문 --%>
   <%-- 강제로 배열 만들어서 속성 저장해야 사용 가능 --%>
	<% String[] arr = {"홍길동", "일지매","임꺽정","마루치","아라치"}; %>
	<% pageContext.setAttribute("arr", arr); %>
	<c:forEach var="k" items="${arr }">
		${k}&nbsp;&nbsp;
	</c:forEach>
	
	<%-- forTokens : 반복실행하면서 구문자에 의해서 구분하기 --%>
	<% String arr2 = "홍길동,둘리,마이콜,마이클"; %>
	<% pageContext.setAttribute("arr2", arr2); %>
	<c:forTokens var="k" items="${arr2 }" delims=",">
		${k }
	</c:forTokens>
	
	<!-- 리다이렉트 -->
	<%-- <c:redirect url="JSTL02.jsp">
		<c:param name="name" value="홍길동"/>
	</c:redirect> --%>
	
	<jsp:forward page="JSTL02.jsp">
  		<jsp:param value="태권브이" name="name"/>
  	</jsp:forward>
 </h2>
</body>
</html>













