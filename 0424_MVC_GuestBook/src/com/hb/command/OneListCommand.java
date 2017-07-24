package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class OneListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		VO vo = DAO.getOneList(idx);
		
		// 자바에는 session이 없으므로 request를 이용해서 session을 불러와야 된다.
		HttpSession session = request.getSession();
		session.setAttribute("vo", vo);
		return "onelist.jsp";
	}

}
