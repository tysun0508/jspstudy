package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex09")
public class Ex09 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex09() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String cmd = request.getParameter("cmd");
		
		Ex09_1 test = null; // interface로 선언 후 사용
		switch (cmd) {
		case "1":    
		  // String ip= request.getRemoteAddr();
		  // out.println("<h2> 결과 : "+ip+"</h2>");
			test = new Ex09_2();
	       break;
		case "2":    
			//Calendar cal = Calendar.getInstance();
			//int year = cal.get(Calendar.YEAR);
			//int month = cal.get(Calendar.MONTH)+1;
			//int day = cal.get(Calendar.DATE);
			//out.println("<h2> 결과 : "+year+". "+month+". "+day+". </h2>");
			test = new Ex09_3();
		break;
		}
		String res = test.play(request, response);
		out.println("<h2>결과 : "+res);
	}
}














