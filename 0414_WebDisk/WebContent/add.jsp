<%@page import="java.io.File"%>
<%@page import="com.hb.mybatis.VO"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="vo" class="com.hb.mybatis.VO" />
<jsp:setProperty property="*" name="vo"/>

<%
	int result = DAO.getInsert(vo);
	if(result>0){
		// 회원가입이 성공되면  member폴더 안에 아이디 폴더 생성
		String path = getServletContext().getRealPath("/member/"+vo.getId());
		File file = new File(path);
		file.mkdirs();
		response.sendRedirect("index.jsp");
	}else{%>
		<script>
			alert("회원가입실패");
			history.go(-1);
		</script>
	<%}%>


