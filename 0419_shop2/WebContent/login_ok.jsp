<%@page import="com.hb.mybatis.MVO"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mvo" class="com.hb.mybatis.MVO" />
<jsp:setProperty property="*" name="mvo"/>

<script>
	function add_product_go() {
		location.href="admin.jsp";
	}
</script>
<%
	MVO m_vo = DAO.getLogin(mvo);
    if(m_vo != null){
    	session.setAttribute("m_vo", m_vo);
        if(m_vo.getId().equals("admin")&&m_vo.getPwd().equals("admin")){%>
        	<button onclick="add_product_go()">물품 등록 페이지</button>
        	<button onclick="location.href='product_list.jsp'">쇼핑몰</button>
        	<button onclick="location.href='logout.jsp'">Logout</button>
        <%}else{%>
        	<button onclick="location.href='product_list.jsp'">쇼핑몰</button>
        	<button onclick="location.href='logout.jsp'">Logout</button>
       <%}
    }else{%>
      <script>
   		alert('로그인 실패') ;
   		history.go(-1);
      </script>	
   <%}%>
   
   
   
   
   
   
   
   
   