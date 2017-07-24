<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
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
	
	VO vo = new VO();
	vo.setSeq(mr.getParameter("seq"));
	vo.setTitle(mr.getParameter("title"));
	vo.setWriter(mr.getParameter("writer"));
	vo.setContent(mr.getParameter("content"));
	vo.setPwd(mr.getParameter("pwd"));
	vo.setIp(request.getRemoteAddr());
	
	// 파일처리
	   if(mr.getFile("filename") != null){
		   vo.setFilename(mr.getFilesystemName("filename"));
	   }else{
		   vo.setFilename("");
	   }
		
	   int res = DAO.getUpdate(vo);
		if(res > 0){
		  response.sendRedirect("view.jsp?seq="+mr.getParameter("seq"));
		 }else{%>
		<script type="text/javascript">
			alert("삽입실패");
			history.go(-1);
		</script>
		<%}%>









