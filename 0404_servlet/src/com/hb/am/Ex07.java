package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex07")
public class Ex07 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex07() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		out.println("<h2>");
		out.println("여기는 Ex07 페이지 입니다.<br />");
		out.println("ID : " + id);
		out.println("PW : " + pw);
		out.println("</h2>");
		
		// 웹 페이지 이동 : 포워딩, 리다이렉트, <a 링크>
	    // 1. <a 링크> : 
		// <a> 링크
			out.println("<hr />");
			out.println("<a href='/0404_servlet/Ex08'>빈 이동</a>");
			out.println("<a href='/0404_servlet/Ex08?id="+id+"&pw="+pw+"'>데이터 가지고 이동</a>");
		
		// 2. Redirect : 페이지 이동하면서, 
		//               ** request와 response가 새롭게 생성 **됨
		//               기존 파라미터값이 없어진다.
		//               request의 생명주기는 response하면 끝난다.	
		//               URL를 확인 했을 때 변경한다.
		// 사용법 :  response.sendRedirect("이동할 주소") ;
		//	System.out.println("Ex07페이지");
		// 	response.sendRedirect("Ex08");
			
		// 3. 포워딩	: 기존의 request와 response 사용
		//            기존의 파라미터값을 유지함
		//            URL를 확인하면 그대로 이다.
		// 사용법 :  request.getRequestDispatcher("이동할 주소")
		//	         .forward(request,response);	
		  request.getRequestDispatcher("Ex08").forward(request, response);
	}
}
