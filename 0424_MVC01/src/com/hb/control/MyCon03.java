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

@WebServlet("/MyCon03")
public class MyCon03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 public MyCon03() {
	        super();
	    }
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			Command comm = new HelloCommand();
			String path =  comm.exec(request, response);
			// 포워드
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		}

}
