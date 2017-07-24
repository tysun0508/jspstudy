package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;

public class AnsDelCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String c_idx = request.getParameter("c_idx");
		String cPage = request.getParameter("cPage");
		DAO.getAns_Delete(c_idx);
		return "MyController?type=view&b_idx="+request.getParameter("b_idx")+"&cPage="+cPage;
	}

}
