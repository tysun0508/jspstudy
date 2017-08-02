<%@page import="DBPKG.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>    
<jsp:useBean id="vo" class="DBPKG.MemberVO"/>
<jsp:setProperty property="*" name="vo"/>

<% int res = DAO.getInstance().getUpdate(vo);
   if(res > 0){
	   response.sendRedirect("list.jsp");
	   %>
	    <script type="text/javascript">
			alert("회원수정에 성공하였습니다.");
		</script>
	   <%
   } else{%>
    <script type="text/javascript">
		alert("회원수정에 실패하였습니다.");
		history.go(-1);
	</script>
   <%} %>
   