package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.hb.mybatis.BVO;
import com.hb.mybatis.CVO;
import com.hb.mybatis.DAO;

public class ViewCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		
		// 원글 상세보기 
		BVO bvo = DAO.getOnelist(b_idx);
		
		// 히트수 증가
		int hit = Integer.parseInt(bvo.getHit())+1;
		bvo.setHit(String.valueOf(hit));
		
		// 히트수 업데이트
		DAO.getHit(bvo);
		
		// 댓글 가져오기
		List<CVO> c_list = DAO.getAns_list(b_idx);
		
		// 수정,삭제를 위해서 session에 담자
		HttpSession session = request.getSession();
		session.setAttribute("bvo", bvo);
		
		// 업로드 파일에 대한 정보 담기
		String path = request.getSession().getServletContext().getRealPath("/upload");
	    path = path +"/"+bvo.getFile_name();
	    session.setAttribute("upPath", path);
	   	
	    // 댓글
		request.setAttribute("c_list", c_list);
		request.setAttribute("cPage", cPage);
		return "view.jsp";
	}

}
