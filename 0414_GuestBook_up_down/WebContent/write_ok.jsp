<%@page import="com.hb.mybatis.VO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%-- 자바빈을 사용할 수 없다. request 사용안됨 --%>
<%
	String path = getServletContext().getRealPath("/upload");
    MultipartRequest mr = new MultipartRequest(
    					request,
    					path,
    					100*1024*1024,
    					"utf-8",
    					new DefaultFileRenamePolicy());
    VO vo = new VO();
    vo.setName(mr.getParameter("name"));
    vo.setSubject(mr.getParameter("subject"));
    vo.setContent(mr.getParameter("content"));
    vo.setPwd(mr.getParameter("pwd"));
    vo.setEmail(mr.getParameter("email"));
	// 파일 업로드 했을 때와 안했을 때의 차이
    if(mr.getFile("filename") != null){
    	vo.setFilename(mr.getFilesystemName("filename"));
    }else{
    	vo.setFilename("");
    }
    
    
    int result = DAO.getInsert(vo);
    if(result>0){%>
    <script type="text/javascript">
       alert("삽입성공");
       location.href="list.jsp";
    </script>	
    <%}else{%>
     <script type="text/javascript">
      alert("삽입실패");
      history.go(-1);
    </script>	
   <%} %>