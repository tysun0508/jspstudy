<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.BVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String path = getServletContext().getRealPath("/upload");
	
	MultipartRequest mr = new MultipartRequest(
			request,
			path,
			500*1024*1024,
			"utf-8",
			new DefaultFileRenamePolicy());
	
	BVO bvo = new BVO(); 
	bvo.setSubject(mr.getParameter("subject"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setContent(mr.getParameter("content"));
	bvo.setPwd(mr.getParameter("pwd"));
	bvo.setIp(request.getRemoteAddr());
	// 파일처리
	if(mr.getFile("file_name") != null){
		bvo.setFile_name(mr.getFilesystemName("file_name"));
	}else{
		bvo.setFile_name("");
	}
	
	int res = DAO.getInsert(bvo);
	if(res>0){
		response.sendRedirect("list.jsp");
	}else{%>
		<script type="text/javascript">
		alert("삽입실패");
		history.go(-1);
		</script>
	<%} %>


























