package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex03() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 웹페이지 이동 : 리다이렉트, 포워딩
		// 페이지에서 페이지로 이동할때 정보를 가지고 이동한다.
		// 이때 이 정보를 파라미터라고 한다.
		// 파라미터이면 무조건 String, String[] 이다.
		// 파라미터 형식 : ?name=값&name=값&name=값&name=값
		// 파리미터값을 받는 메소드들 (request)
		// 1. getParameter() : 일반적인 하나의 파리미터값 받기
		// 2. getParameterValues() : 체크박스처럼, 배열형식받기
		// 3. getParameterMap() : 맵 형식의 파라미터값을 받을때
		// 4. getParameterNames() : 열거형 파라미터값을 받을때
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<h1>서블릿 두번째 예제 </h1>");
		// name, age라는 파라미터 값이 넘어왔을 때 처리방법
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		out.println("이름 : " + name+"<br />");
		out.println("나이 : " + age+"<br />");
		
	}
}