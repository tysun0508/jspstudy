package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Ajax_TextCommand;
import com.hb.model.Ajax_XMLCommand;
import com.hb.model.Ajax_XML_AttrCommand;
import com.hb.model.Ajax_jsonCommand;
import com.hb.model.Command;
import com.hb.model.JsonCommand;
import com.hb.model.ListCommand;
import com.hb.model.XmlAttrCommand;
import com.hb.model.XmlCommand;

@WebServlet("/MyController05")
public class MyController05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyController05() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String result = null;
		Command comm =  new Ajax_jsonCommand();
		
		result = comm.exec(request, response);
		out.println(result);
	}

}
