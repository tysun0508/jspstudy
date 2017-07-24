<%@page import="com.hb.mybatis.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% VO vo = (VO)session.getAttribute("vo"); %>
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
	function sendData(){
		for(var i=0 ; i<document.forms[0].elements.length ; i++){
			if(document.forms[0].elements[i].value == "" && i!=3){
				if(i==3) continue;
				alert(document.forms[0].elements[i].name+
						"를 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			}
		}
		// 비번 검사
		var pwd1 = document.myform.pwd.value;
		var pwd2 = "<%=vo.getPwd()%>";
		if(pwd1 != pwd2){
			alert("비번 틀림");
			document.myform.pwd.value="";
			document.myform.pwd.focus();
			return;
		}else{
			document.forms[0].submit();
		}
		
	}
	
	function list_go() {
		location.href="list.jsp";
	}
	
</script>
</head>
<body>
	<div id="bbs" align="center">
	<form action="modify_ok.jsp" method="post" 
	encType="multipart/form-data" name="myform">
		<table summary="수정">
			<caption>수정</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" name="title" size="45" value="<%=vo.getTitle() %>"  /></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" name="writer" size="12" value="<%=vo.getWriter() %>"  /></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea name="content" cols="50" 
							rows="8"><%=vo.getContent() %></textarea></td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<td><input type="file" name="filename"/>(<%=vo.getFilename() %>)</td>
				</tr>
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정"
						onclick="sendData()"/>
						<input type="reset" value="다시"/>
						<input type="button" value="목록" onclick="list_go()"/>
						<input type="hidden" name="seq" value="<%= vo.getSeq()%>">	
					</td>		
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>












