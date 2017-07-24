<%@page import="com.hb.mybatis.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String p_num = request.getParameter("p_num");
    
    // Cart cart = new Cart();
    // session.setAttribute("cart",cart);  
%>
<jsp:useBean id="cart" class="com.hb.mybatis.Cart" scope="session" />
<%
   cart.addProduct(p_num);
   response.sendRedirect("product_content.jsp?prod_num="+p_num);
%>    