package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.command.Command;
import com.hb.command.DeleteCommand;
import com.hb.command.Delete_okCommand;
import com.hb.command.ListCommand;
import com.hb.command.OneListCommand;
import com.hb.command.UpdateCommand;
import com.hb.command.Update_okCommand;
import com.hb.command.WriteCommand;
import com.hb.command.Write_okCommand;

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
		}else if(type.equals("write_ok")){
			comm = new Write_okCommand();
		}else if(type.equals("onelist")){
			comm = new OneListCommand();
		}else if(type.equals("update")){
			comm = new UpdateCommand();
		}else if(type.equals("update_ok")){
			comm = new Update_okCommand();
		}else if(type.equals("delete")){
			comm = new DeleteCommand();
		}else if(type.equals("delete_ok")){
			comm = new Delete_okCommand();
		}
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	
	}
}
