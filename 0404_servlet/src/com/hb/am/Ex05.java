package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex05")
public class Ex05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex05() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 반드시 해야 될 3가지
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();	
		
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		int sum  = kor + eng + math ;
		double avg = sum / 3.0 ;
		avg = (int)(avg*10)/10.0 ;
		String hak = "";
		if(avg>=90){
			hak ="A 학점";
		}else if(avg>=80){
			hak ="B 학점";
		}else if(avg>=70){
			hak ="C 학점";
		}else{
			hak ="F 학점";
		}
		
		
		out.print("<h2>성적발표</h2>");
		out.print("<h3><ul>");
		out.print("<li> 이름 : "+name+"</li>");
		out.print("<li> 총점 : "+sum+"</li>");
		out.print("<li> 평균 : "+avg+"</li>");
		out.print("<li> 학점 : "+hak+"</li>");
		out.print("</ul></h3>");
	}

}











