<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> ajax 사용하기</title>
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "ex01.js"     ,  // 정보위치(서버위치)
			dataType : "script",  // 응답결과의 데이터 형태
			type :  "get" ,  // 전송방식(get,post)
			success : function() {
				// 스크립트함수호출
				ok("성공");
			},  // 성공했을때 실행
			error : function() {
				alert("실패");
			}      // 실패했을때 실행
		});
	});
</script>
</head>
<body>
</body>
</html>