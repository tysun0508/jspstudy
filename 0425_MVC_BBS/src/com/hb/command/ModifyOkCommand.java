package com.hb.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BVO;
import com.hb.mybatis.DAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ModifyOkCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		  String path = request.getSession().getServletContext().getRealPath("/upload");
		  String cPage = null;
		  String b_idx = null;
			try {
				MultipartRequest mr = new MultipartRequest(
						request, path, 500*1024*1024,"utf-8", new DefaultFileRenamePolicy());
		        
				BVO bvo = new BVO();
		        bvo.setSubject(mr.getParameter("subject"));
				bvo.setWriter(mr.getParameter("writer"));
				bvo.setContent(mr.getParameter("content"));
				bvo.setPwd(mr.getParameter("pwd"));
				bvo.setB_idx(mr.getParameter("b_idx"));
				bvo.setIp(request.getRemoteAddr());
				
					// 첨부파일은 있을 수도 있고 없을 수도 있다.
					if(mr.getFile("file_name") != null){
						bvo.setFile_name(mr.getFilesystemName("file_name"));
						DAO.getUpdate1(bvo);
					}else{ // 없는 경우 , 안하면 NullPointException
						DAO.getUpdate2(bvo);
					}
					
					 cPage = mr.getParameter("cPage");
					 b_idx = bvo.getB_idx();
				} catch (IOException e) {
				
			}
			   return "MyController?type=view&cPage="+cPage+"&b_idx="+b_idx;  // 가능
			
	}
}
