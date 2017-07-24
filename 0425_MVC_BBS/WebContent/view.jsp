<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	function modify_go(f) {
		f.action="/0425_MVC_BBS/MyController?type=modify";
		f.submit();
	}
	function delete_go(f) {
		f.action="/0425_MVC_BBS/MyController?type=delete";
		f.submit();
	}
	function list_go(f) {
		f.action="/0425_MVC_BBS/MyController?type=list";
		f.submit();
	}

</script>
</head>
<body>
	<div id="bbs">
	<form method="post" >
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td>${bvo.subject }</td>
				</tr>
				<tr>
					<th>이름:</th>
					<td>${bvo.writer }</td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><pre>${bvo.content}</pre></td>
				</tr>
				<tr>
					<th>첨부파일: </th>
					<c:choose>
						<c:when test="${empty bvo.file_name}">
							<td><h3>첨부파일없음</h3></td>
						</c:when>
						<c:otherwise>
							<td>
							 <a href="down.hb?file_name=${bvo.file_name }"><img src="${upPath}" width="100px" height="100px"/></a>							
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="modify_go(this.form)"/>
						<input type="button" value="삭제" onclick="delete_go(this.form)" />
						<input type="button" value="목록" onclick="list_go(this.form)"/>
						<input type="hidden" name="cPage" value="${cPage}" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<br /><br />
	<form method="post" action="/0425_MVC_BBS/MyController?type=ans_write">
		<p>이름:<input type="text" name="writer"/></p>
		<p>내용:<textarea rows="4" cols="55" name="content"></textarea></p>
		<p>비밀번호:<input type="password" name="pwd"/></p>
		<input type="hidden" name="b_idx" value="${bvo.b_idx}">
		<input type="hidden" name="cPage" value="${cPage}" />
		<input type="submit" value="저장하기"/> 
	</form>
	<hr/>
		<div>
			<c:choose>
				<c:when test="${empty c_list}">
					<h3><li>댓글없음</li></h3>
				</c:when>
				<c:otherwise>
					<c:forEach items="${c_list}" var="k">
					<form method="post" action="/0425_MVC_BBS/MyController?type=ans_del">
						<li>이름 :  ${k.writer} </li>
						<li>날짜 :  ${k.write_date.substring(0,10)} </li>
						<li>내용 :  <pre>${k.content}</pre></li>
						<!--삭제를 위해서  -->
						<input type="hidden" name="c_idx" value="${k.c_idx}" />
						<!-- 제자리 오기 위해서 -->
						<input type="hidden" name="b_idx" value="${k.b_idx}">
						<input type="hidden" name="cPage" value="${cPage}" />
						<input type="submit" value="댓글삭제" />
						<hr />
					</form>	
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
	