<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본내장객체 : response </title>
<script type="text/javascript">
	function send_go(f) {
		// 유효성 검사
		f.action="ex04_2.jsp";
		f.submit();
	}
	
</script>
</head>
<body>
<%--
	response : request의 반대 기능을 수행 (응답정보)
	  - 헤더 정보 입력 
	  - 리다이렉트 하기
	// 포워딩(페이지 이동) : a링크, 리다이렉트, 포워드
--%>
   	<form method="post">
   		<p> ID : <input type="text" name="id"/></p>
   		<p> PW : <input type="password" name="pw"/></p>
   		<input type="button" value="보내기" onclick="send_go(this.form)"/>
   		<input type="reset" value="취소" />
   	</form>
</body>
</html>