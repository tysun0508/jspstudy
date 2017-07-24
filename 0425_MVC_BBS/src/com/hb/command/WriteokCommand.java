package com.hb.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mybatis.BVO;
import com.hb.mybatis.DAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteokCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
	// encType="multipart/form-data" 
	// request 사용 불가, MultipartRequest 사용 가능
		
	// 	MultipartRequest 무조건 위치값 부터 받기
	   String path = request.getSession().getServletContext().getRealPath("/upload");
	try {
		MultipartRequest mr = new MultipartRequest(
				request, path, 500*1024*1024,"utf-8", new DefaultFileRenamePolicy());
        
		BVO bvo = new BVO();
        bvo.setSubject(mr.getParameter("subject"));
		bvo.setWriter(mr.getParameter("writer"));
		bvo.setContent(mr.getParameter("content"));
		bvo.setPwd(mr.getParameter("pwd"));
		
		// 첨부파일은 있을 수도 있고 없을 수도 있다.
		if(mr.getFile("file_name") == null){
			bvo.setFile_name("");
		}else{
			bvo.setFile_name(mr.getFilesystemName("file_name"));
		}
		// 요청자의 IP 주소
		bvo.setIp(request.getRemoteAddr());
		
		// bvo DB 삽입처리
		DAO.getInsert(bvo);
		
		} catch (IOException e) {
	}
	    return "MyController?type=list";  // 가능
	
	}
}










