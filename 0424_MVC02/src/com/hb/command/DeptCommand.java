package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeptCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String deptno = request.getParameter("deptno");
		if(deptno==null){
			return "dept.jsp";
		}else{
			return "dept_ok.jsp";
		}
		
	}
}

