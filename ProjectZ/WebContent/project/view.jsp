<%@page import="com.hb.mybatis.CVO"%>
<%@page import="java.util.List"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.BVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
   BVO bvo = DAO.getOneList(request.getParameter("b_idx"));
   
   // 히트수
   int hit = Integer.parseInt(bvo.getHit())+1;
   bvo.setHit(String.valueOf(hit));
   
   // 히트 업데이트
   DAO.getHit(bvo);
   
   // 수정, 삭제를 위해서 bvo 저장
   session.setAttribute("bvo", bvo);
   
   // 댓글 가져오기
   List<CVO> c_list = DAO.getAns_List(request.getParameter("b_idx"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
		
</style>
<script type="text/javascript">
	function modify_go() {
		location.href="modify.jsp";
	}
	function delete_go() {
		location.href="delete.jsp";
	}
	function list_go() {
		location.href="list.jsp";
	}
</script>
</head>
<body>
	<div id="bbs" align="center" style="margin-bottom: 20px"> 
	<form method="post" >
		<table summary="게시판">
			<caption>게시판</caption>
			<tbody>
				<tr>
					<th>제목 : </th>
					<td><%=bvo.getSubject() %></td>
				</tr>

				<tr>
					<th>첨부파일 : </th>
					<td>
						<%if(bvo.getFile_name()!=null){%>
						  <a href="download.jsp?file_name=<%=bvo.getFile_name() %>" ><%=bvo.getFile_name() %></a>
						<%}else{ %>
						   <b> 첨부파일없음 </b>
						<%} %>
					</td>
				</tr>
				
				<tr>
					<th>이름 : </th>
					<td><%=bvo.getWriter() %></td>
				</tr>
				<tr>
					<th>내용 : </th>
					<td><pre><%=bvo.getContent() %></pre></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="modify_go()"/>
						<input type="button" value="삭제" onclick="delete_go()"/>
						<input type="button" value="목록" onclick="list_go()"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<br /><br />
	<form method="post" action="ans_write.jsp">
		<p>이름 : <input type="text" name="writer"/></p>
		<p>내용 : <textarea rows="4" cols="55" name="content"></textarea></p>
		<p>비밀번호 : <input type="password" name="pwd"/></p>
		
		<input type="hidden" name="b_idx" value="<%=bvo.getB_idx()%>">
		<input type="submit" value="저장하기"/> 
	</form>
	<hr/>
	댓글들
	<hr/>
	   <%for(CVO k : c_list){%>
	      <form action="ans_del.jsp" method="post">
		    <div>
				<p> 이름 : <%= k.getWriter()%></p> 
				<p> 날짜 : <%= k.getWrite_date().substring(0,10)%></p> 
				<p> 내용 : <%= k.getContent()%></p>
				<input type="hidden" name="c_idx" value="<%=k.getC_idx() %>" />
				<input type="hidden" name="b_idx" value="<%=k.getB_idx() %>" />
				<input type="submit" value="댓글 삭제" /> 
	 	    </div>
	 	    <hr />
	 	    </form>
	    <%} %>
	 
</body>
</html>
