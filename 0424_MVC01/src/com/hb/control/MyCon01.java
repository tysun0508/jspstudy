package com.hb.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Command;
import com.hb.model.HelloCommand;
import com.hb.model.HiCommand;


@WebServlet("/MyCon01")
public class MyCon01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public MyCon01() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		// 서블릿은 컨틀롤러의 역할을 한다.
		// 컨틀롤러는 요청을 수신하고 분석해서, 
		// 요청기능을 수행할 모델을 호출하고
		// 결과를 받아서 결과에 맞는 뷰를 호출
		
		// 요청 받기
		String type = request.getParameter("cmd");
		
		// 요청을 분석해서 요청기능수행할 모델을 호출
		Command comm = null;
		RequestDispatcher rd = null;
		if(type.equals("hi")){
			comm = new HiCommand();
		}else if(type.equals("hello")){
			comm = new HelloCommand();
		}
		
		// 결과에 맞게 뷰 호출
		String path = comm.exec(request, response);
		 
		// 포워딩, 리다이렉트 방식을 사용
		// 포워드 : request,response을 가지고 간다.
		//          request 속성 사용 가능		
		// 포워드
		// rd = request.getRequestDispatcher(path);
		// rd.forward(request, response);
		
		
		// 리다이렉트 :  새로운 request,response을 가지고 간다.
		//               request 속성 사용 불가
		response.sendRedirect(path);
	}
}














