<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
    
    // hit 업데이트
 
    VO vo = DAO.getOneList(request.getParameter("seq"));
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
			        <input type="button" value="목록" onclick="location.href='list.jsp'" />
			        <input type="button" value="답글" onclick="re_go(this.form,<%=vo.getGroups() %>,<%=vo.getStep() %>,<%=vo.getLev() %>)" />
			        <input type="button" value="수정" onclick="" />
			        <input type="button" value="삭제" onclick="" />
			        <input type="reset" value="취소" />
			     </td>
				</tr>
			</tfoot>
			</table>
		</form>
</body>
</html>