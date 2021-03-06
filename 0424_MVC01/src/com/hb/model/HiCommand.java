package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HiCommand implements Command {

	// 요청 기능을 수행하는 메소드
	// 리턴은 뷰의 이름(jsp 이름)
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String name = "홍길동";
		int age = 17;
		
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		
		return "view01/view01.jsp";
	}

}
