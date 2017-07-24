<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

    String path = request.getServletContext().getRealPath("/upload");
    MultipartRequest mr = new MultipartRequest(
    		request,
    		path,
    		500*1024*1024,
    		"utf-8",
    		new DefaultFileRenamePolicy());
    VO vo =new VO();
    vo.setWriter(mr.getParameter("writer"));
    vo.setTitle(mr.getParameter("title"));
    vo.setContent(mr.getParameter("content"));
    vo.setPwd(mr.getParameter("pwd"));
    vo.setIp(request.getRemoteAddr());
    
    if(mr.getFile("filename") != null){
    	vo.setFilename(mr.getFilesystemName("filename"));
    }else{
    	vo.setFilename("");
    }
    
    DAO.getInsert(vo);
    response.sendRedirect("list.jsp");
%>
















