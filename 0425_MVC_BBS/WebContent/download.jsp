<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String f_name = request.getParameter("file_name");
	
	// 실제 파일이 있는 경로
	String r_path = getServletContext().getRealPath("/upload");
	
	// 다운로드 받을 할 수 있도록 클라이언트의 문서 타입 변경
	response.setContentType("application/x-msdownload");
	
	// 클라이언트의 헤더 정보를 첨부파일이 있는 것 처럼 변경
	response.setHeader("Content-Disposition", "attachment;filename="+f_name);
	
	////////////////////// 실제 입출력 스트림 하기 ////////////////////////////
	///////////////////////반드시 바이트 스트림 //////////////////////////////
	File file = new File(r_path+"/"+new String(f_name.getBytes(),"utf-8"));
	int b ;
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	BufferedOutputStream bos = null;
	
	try{
		if(file.isFile()){
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			
			bos = new BufferedOutputStream(response.getOutputStream());
			while((b=bis.read()) != -1){
				bos.write(b);
				bos.flush();
			}
			// jsp 출력 스트림과 servlet 출력 스트림 겹침 방지
			out.clear();
			out = pageContext.pushBody();
		}
	}catch(Exception e){
	}finally{
		try{
			bos.close();
			bis.close();
			fis.close();
		}catch(Exception e){
		}
	}
	
%>
















