package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.CVO;
import com.hb.mybatis.DAO;

public class AnsWriteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CVO cvo = new CVO();
		cvo.setWriter(request.getParameter("writer"));
		cvo.setContent(request.getParameter("content"));
		cvo.setPwd(request.getParameter("pwd"));
		cvo.setB_idx(request.getParameter("b_idx"));
		cvo.setIp(request.getRemoteAddr());
		String cPage = request.getParameter("cPage");
		DAO.getAns_Insert(cvo);
		return "MyController?type=view&b_idx="+request.getParameter("b_idx")+"&cPage="+cPage;
	}

}
