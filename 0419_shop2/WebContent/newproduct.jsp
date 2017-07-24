<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String path = getServletContext().getRealPath("/images");
    MultipartRequest mr = new MultipartRequest(
    		request,
    		path,
    		500*1024*1024,
    		"utf-8",
    		new DefaultFileRenamePolicy());
    VO vo = new VO();
    vo.setCategory(mr.getParameter("category"));
    vo.setP_num(mr.getParameter("p_num"));
    vo.setP_name(mr.getParameter("p_name"));
    vo.setP_company(mr.getParameter("p_company"));
    vo.setP_price(Integer.parseInt(mr.getParameter("p_price")));
    vo.setP_saleprice(Integer.parseInt(mr.getParameter("p_saleprice")));
    vo.setP_image_s(mr.getFilesystemName("p_image_s"));
    vo.setP_image_l(mr.getFilesystemName("p_image_l"));
    vo.setP_content(mr.getParameter("p_content"));
    
    DAO.getP_Insert(vo);
    response.sendRedirect("product_list.jsp?category="+mr.getParameter("category"));
%>
