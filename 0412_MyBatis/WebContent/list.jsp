<%@page import="com.hb.mybatis.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 전체검색 </title>
</head>
<body>
<jsp:include page="index.jsp" />
<br /><br />
<hr />
	<%-- MyBatis를 활용한 DB처리 --%>
	<%
		// 1 . SqlSession 만들기
		SqlSession ss = DBService.getFactory().openSession();
	   
	   // openSession(); => select문에 사용
       // openSession(true);openSession(false); => 모두 사용가능
       // openSession(true) => autocommit를 뜻한다.
       // openSession(false) => 수동커밋를 뜻한다.
       // 수동커밋은 반드시 나중에 커밋을 해줘야 된다.
	   // 트랜잭션을 하면 수동 커밋을 해줘야 된다.
	   
	   // select는 4가지 종류 사용
	   // 1. selectList(mapper의 id) : 결과가 여러개가 나올때 사용         
	   // 2. selectList(mapper의 id,파라미터); 결과가 여러개가 나올때 사용
	   // 3. selectOne(mapper의 id) : 결과가 하나만 나올때 
	   // 4. selectOne(mapper의 id,파라미터) : 결과가 하나만 나올때 
	   // ** 파라미터는 반드시 하나만 가능
	   //    여러개 일때는 VO 또는 Map형식으로 객체를 만들어 사용
	   
	   List<VO> list = ss.selectList("list");
	%>
	
		<h1> 전체 보기 </h1>
		 <%if(list.size()>0){%>
		 	<h2>
		 		<ul>
					<%for(VO k : list){%>
					 <li><%=k.getIdx()%>&nbsp;&nbsp;	
					 	 <%=k.getId()%>&nbsp;&nbsp;	
					 	 <%=k.getPwd()%>&nbsp;&nbsp;	
					 	 <%=k.getName()%>&nbsp;&nbsp;	
					 	 <%=k.getAge()%>&nbsp;&nbsp;	
					 	 <%=k.getAddr()%></li>	
					<%} %>	 		
		 		</ul>
		    </h2>
		 <%}else{ %> 
		 	<h2> 자료 없음 </h2>
		 <%}%>
		 
		 <% ss.close(); %>
	 
</body>
</html>










