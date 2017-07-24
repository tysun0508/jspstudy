package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.command.Command;
import com.hb.command.DeptCommand;
import com.hb.command.Dept_OkCommand;
import com.hb.command.ListCommand;
import com.hb.command.SearchCommand;

@WebServlet("/MyController")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MyController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String type = request.getParameter("type");
		Command comm = null;
		if(type.equals("all")){
			comm = new ListCommand() ;
		}else if(type.equals("dept")){
			comm = new DeptCommand() ;
		}else if(type.equals("dept_ok")){
			comm = new Dept_OkCommand();
		}else if(type.equals("search")){
			comm = new SearchCommand();
		}
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
}


