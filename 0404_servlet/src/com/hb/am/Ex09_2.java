package com.hb.am;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex09_2 implements Ex09_1{

	// IP구하기
	
	@Override
	public String play(HttpServletRequest request, HttpServletResponse response) {
		String ip= request.getRemoteAddr();
		return ip;
	}

}
