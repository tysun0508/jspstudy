<%@page import="com.hb.mybatis.DAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf8");
%>
<jsp:useBean id="vo" class="com.hb.mybatis.VO" />
<jsp:setProperty property="*" name="vo"/>

<%
	int lev = Integer.parseInt(vo.getLev());
    int step = Integer.parseInt(vo.getStep());
    int groups = Integer.parseInt(vo.getGroups());
   
    // 댓글 쓰기 
    // 1, 0 , 0 => 1, 1, 1
     lev++;
     step++;
     
    // DB에서 groups,lev 사용 해서 업데이트 함(1,1)
    Map<String,Integer> map = new HashMap<>();
    map.put("groups", groups);
    map.put("lev",lev);
    DAO.getUp_lev(map);
    
    // 댓글 삽입
	vo.setFilename("");
    vo.setIp(request.getRemoteAddr());
    vo.setLev(String.valueOf(lev));
    vo.setStep(String.valueOf(step));
    
    DAO.getReInsert(vo);
    response.sendRedirect("list.jsp");
%>






















