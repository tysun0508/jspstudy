<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr {
	padding: 4px 10px;
	background-color: #d6d6d6;
}
</style>
<script type="text/javascript">
	function sendData() {
		for (var i = 0; i < document.forms[0].elements.length; i++) {
			if (document.forms[0].elements[i].value == "") {
				if (i == 3) continue;
				alert(document.forms[0].elements[i].name + "를 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			}
		}
		document.forms[0].submit();
	}
</script>
</head>
<body>
	<div align="center">
	<h2>BBS 글쓰기</h2>
	<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
		<table style="width: 600px; height: 350px;">
			<colgroup>
				<col width="25%">
			</colgroup>
			<tbody>
				<tr>
					<th bgcolor="#B2CCFF" align="center">작성자</th>
					<td ><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th bgcolor="#B2CCFF" align="center">제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th bgcolor="#B2CCFF" align="center">내용</th>
					<td><textarea rows="10" cols="50" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<th bgcolor="#B2CCFF" align="center">첨부파일</th>
					<td><input type="file" name="filename"></td>
				</tr>
				<tr>
					<th bgcolor="#B2CCFF" align="center">비밀번호</th>
					<td><input type="text" name="pwd"></td>
				</tr>
				</tbody>
			<tfoot>
				<tr>
					<td colspan="2" align="center" height="40px">
					<input type="button" value="입력" onclick="sendData()" /> 
					<input type="button" value="목록" onclick="location.href='list.jsp'"/>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	</div>
</body>
</html>