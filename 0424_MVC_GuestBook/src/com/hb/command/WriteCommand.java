package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		return "write.jsp";
	}

}
