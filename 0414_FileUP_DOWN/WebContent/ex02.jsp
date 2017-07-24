<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- request.setCharacterEncoding("utf-8"); 
	String name = request.getParameter("name");
	String f_name = request.getParameter("f_name");
--%>
	
	<%-- ex01.jsp post 방식이면 null, get방식이면 값나옴 --%>
	
	<%-- request.getParameter를 사용해서 파라미터값을 받으면 안됨
		<jsp:useBean> 안됨
	--%>
	
	<%-- 	<h2>이름 : <%=name %></h2>
			<h2>파일이름 : <%=f_name %> </h2> 
	--%>	

<%
    // 실제 저장위치 디렉토리 구하기(톰켓 어디가에 존재?)
   String path = getServletContext().getRealPath("/upload");
   //System.out.println(path);
	
   MultipartRequest mr = new MultipartRequest(
			 request, // MultipartRequest와 servlet의  request 연결
			 path,    // 실제 저장 위치 디렉토리
			 100*1024*1024, // 업로드 할 수 있는 용량 100MB
			 "utf-8",  // 인코딩
			 new DefaultFileRenamePolicy()); // 파일이름 중복일때 처리 방법
			 
// MultipartRequest 주요메소드
// getParameter(String) : String
// getParameterValues(String) : String[]
// getOriginalFileName(String) : 업로드 당시 파일 이름
// getFilesystemName(String) : 저장 당시 파일 이름
// getContentType(String) : 업로드된 파일 MIME타입
// getFile(String) : 업로드된 파일 자체를 파일 클래스로 처리
			 
%>	
	<h1>결과 보기</h1>
	<h2>
		<ul>
			<li>올린 사람 : <%=mr.getParameter("name") %></li>
			<li>파일 원본 제목 : <%=mr.getOriginalFileName("f_name") %></li>
			<li>파일 저장 제목 : <%=mr.getFilesystemName("f_name") %></li>
			<li>파일 타입 : <%=mr.getContentType("f_name") %></li>
			<hr/>
			<%
				File file = mr.getFile("f_name");
			%>
			<li>파일이름 : <%=file.getName() %></li>
			<li>파일크기 : <%=file.length()/1024 %>KB</li>
			<%
				SimpleDateFormat day = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초 E요일");
			%>
			<li>파일마지막수정날짜 : <%=file.lastModified() %></li>
			<li>파일마지막수정날짜 : <%=day.format(file.lastModified())%></li>
			<li>다운로드 : <a href ="download.jsp?path=upload&f_name"> <%=mr.getFilesystemName("f_name")%>
			<%=file.getName() %></a></li>
		</ul>
	
	</h2>












 