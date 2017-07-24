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
import com.hb.model.HiCommand;

@WebServlet("/MyCon02")
public class MyCon02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MyCon02() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		Command comm = new HiCommand();
		String path =  comm.exec(request, response);
		// 포워드
		RequestDispatcher  rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}