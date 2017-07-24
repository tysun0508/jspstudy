package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class Dept_OkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String deptno = request.getParameter("deptno");
		List<VO> d_list = DAO.getDept(deptno);
		request.setAttribute("d_list", d_list);
		return "dept_ok.jsp";
	}

}
