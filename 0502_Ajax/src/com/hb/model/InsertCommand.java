package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class InsertCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		VO vo = new VO();
		vo.setId(request.getParameter("id"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setAge(request.getParameter("age"));
		vo.setAddr(request.getParameter("addr"));
		
		int res = DAO.getInsert(vo);
		return String.valueOf(res);
	}

}
