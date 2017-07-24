<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.hb.mybatis.BVO"%>
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

	function modify_go(f){
		for(var i=0 ; i<document.forms[0].elements.length ; i++){
			if(document.forms[0].elements[i].value == ""){
				if(i==3) continue;
				alert(document.forms[0].elements[i].name+
						"를 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			}
		}
		var pwd1 = f.pwd.value;
		var pwd2 = "${bvo.pwd}";
		if(pwd1 != pwd2 ){
			alert('비번틀림');
			f.pwd.value="";
			f.pwd.focus();
			return;
		}else{
			f.action="/0425_MVC_BBS/MyController?type=modifyok";
			f.submit();	
		}
		
	}
	
	function list_go() {
		location.href="/0425_MVC_BBS/MyController?type=list";
	}
</script>
</head>
<body>
	<div id="bbs">
	<form method="post" 
	encType="multipart/form-data">
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" name="subject" size="45" value="${bvo.subject}"/></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" name="writer" size="12" value="${bvo.writer}"/></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea name="content" cols="50" 
							rows="8">${bvo.content}</textarea></td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<c:choose>
						<c:when test="${empty bvo.file_name }">
							<td>
								<h3>첨부파일 없음</h3>
								<input type="file" name="file_name" />
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<img src="${upPath}" width="100px" height="100px"/><br />
								<input type="file" name="file_name" />						
							</td>
						</c:otherwise>
					</c:choose>						
				</tr>
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="보내기" 	onclick="modify_go(this.form)"/>
						<input type="reset" value="다시"/>
						<input type="button" value="목록" onclick="list_go(this.form)"/>
						<input type="hidden" name="b_idx" value="${bvo.b_idx}" />
						<input type="hidden" name="cPage" value="${cPage}"  />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>

