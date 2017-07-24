package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.command.AnsDelCommand;
import com.hb.command.AnsWriteCommand;
import com.hb.command.Command;
import com.hb.command.DeleteCommand;
import com.hb.command.DeleteOkCommand;
import com.hb.command.ListCommand;
import com.hb.command.ModifyCommand;
import com.hb.command.ModifyOkCommand;
import com.hb.command.ViewCommand;
import com.hb.command.WriteCommand;
import com.hb.command.WriteokCommand;

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
		if(type.equals("list")){
			comm = new ListCommand();
		}else if(type.equals("write")){
			comm = new WriteCommand();
		}else if(type.equals("writeok")){
			comm = new WriteokCommand();
		}else if(type.equals("view")){
			comm = new ViewCommand();
		}else if(type.equals("modify")){
			comm = new ModifyCommand();
		}else if(type.equals("modifyok")){
			comm = new ModifyOkCommand();
		}else if(type.equals("delete")){
			comm = new DeleteCommand();
		}else if(type.equals("deleteok")){
			comm = new DeleteOkCommand();
		}else if(type.equals("ans_write")){
			comm = new AnsWriteCommand();
		}else if(type.equals("ans_del")){
			comm = new AnsDelCommand();
		}
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
}








