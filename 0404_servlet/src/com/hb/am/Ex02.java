package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/index")
public class Ex02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex02() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실제 작업하는 공간
		// 무조건 3개 작성 (한글처리2개, 출력처리 1개)
		request.setCharacterEncoding("utf-8");
		// 응답시 한글처리
		response.setContentType("text/html; charset=utf-8");
		// 출력 처리 => outputStream => PrintWriter
		PrintWriter out = response.getWriter();
		
		// 브라우저에 마음대로 출력(응답하라 2017)
		
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("첫번째 서블릿");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h2> 서블릿 처음예제 </h2>");
		
		// 년,월,일 출력하기
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DATE);
		
		out.print("<h2>");
		out.println(year+". "+month+". "+ day+".");
		out.print("</h2>");
		// 요청정보에 대해서 출력하시오
		out.print("<h2>");
		out.print(request.getRemoteAddr()+"<br />");
		out.print(request.getRemoteHost()+"<br />");
		out.print(request.getRemoteUser()+"<br />");
		out.print(request.getRemotePort()+"<br />");
		out.print("</h2>");
		out.print("<body>");
		out.print("</body>");
		out.print("</html>");
		out.close();
		
	}

}
