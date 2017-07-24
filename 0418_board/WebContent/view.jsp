<%@page import="java.util.List"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
    
    VO vo = DAO.getOneList(request.getParameter("seq"));
    
 // 히트수
    int hit = Integer.parseInt(vo.getHit())+1;
    vo.setHit(String.valueOf(hit));
    
    // 히트 업데이트
    DAO.getHit(vo);
 	
 	// 수정, 삭제를 위해 vo 저장
 	session.setAttribute("vo", vo);
 	
 	// 댓글 가져오기
 	
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr {
		
	    text-align:center;
	    padding:4px 10px;
	    background-color: #F6F6F6;
	}
	
th {
		width:120px;
	    text-align:center;
	    padding:4px 10px;
	    background-color: #B2CCFF;
	}
</style>
<script type="text/javascript">
	function re_go(f,g,s,l) {
		f.action = "rewrite.jsp?groups="+g+"&step="+s+"&lev="+l;
		f.submit();
	}
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
	<div align="center">
		<h2>BBS 내용보기</h2>
		<form method="post">
		   	<table style="width: 700px">
			<tbody>
				<tr>
					<th bgcolor="#B2EBF4">작성자</th>
					<td><%=vo.getWriter() %></td>
				</tr>
				
				<tr>
					<th bgcolor="#B2EBF4">제목</th>
					<td><%=vo.getTitle() %></td>
				</tr>
				<tr>
					<th bgcolor="#B2EBF4">첨부파일</th>
					<%if(vo.getFilename()==null){%>
						<td><b>첨부파일없음</b></td>
					<%}else{%>
					    <td><a href="download.jsp?filename=<%=vo.getFilename()%>"><%=vo.getFilename()%></a></td>
					<%}%>	
				</tr>
				<tr>
					<th bgcolor="#B2EBF4">내용</th>
					<td><pre><%=vo.getContent() %></pre></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
			     <td colspan="2">
			        <input type="button" value="목록" onclick="list_go()" />
			        <input type="button" value="답글" onclick="re_go(this.form,<%=vo.getGroups() %>,<%=vo.getStep() %>,<%=vo.getLev() %>)" />
			        <input type="button" value="수정" onclick="modify_go()" />
			        <input type="button" value="삭제" onclick="delete_go()" />
			        <input type="reset" value="취소" />
			     </td>
				</tr>
			</tfoot>
			</table>
		</form>
	</div>
</body>
</html>