<%@page import="com.hb.mybatis.VO"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="com.hb.mybatis.VO" />
<jsp:setProperty property="*" name="vo"/>
<script type="text/javascript">
	function logout_go() {
		location.href = "logout.jsp";
	}
	function myinfo_go() {
		location.href = "myinfo.jsp";
	}
	function mydisk_go() {
		location.href = "mydisk.jsp";
	}
</script>
<%
	VO mvo = DAO.getLogin(vo);
   if(mvo != null){%>
         <% session.setAttribute("mvo", mvo);%>
         <% session.setAttribute("login_chk", true); %>
	   <h2><%=mvo.getName()%>(<%=mvo.getId()%>)님 환영합니다.</h2>
	   <button onclick="logout_go()">logout</button>
	   <button onclick="myinfo_go()">MyInfo</button>
	   <button onclick="mydisk_go()">MyDisk</button>
   <%}else{%>
	 <script type="text/javascript">
	 	alert("로그인 실패");
	 	history.go(-1);
	 </script>  
   <%}%>