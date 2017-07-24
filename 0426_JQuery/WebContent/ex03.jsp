<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 요소의 속성을 이용한 addClass </title>
<style type="text/css">
	.c_red{color: red;}
	.c_orange{color: orange;}
	.c_silver{color: silver;}
	.c_purple{color: purple;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	// 요소[속성] : 해당 속성이 있는 요소
	// 요소[속성=값] : 해당 속성과 일치하는 요소
	// 요소[속성^=값] : ~ 시작하는 요소
	// 요소[속성$=값] : ~ 끝나는  요소
	// 요소[속성*=값] : 포함하는 요소
	// 요소[속성=값],[속성=값] : and 조건
	$(function() {
		$("a[href]").addClass("c_red");
		$("a[href='naver']").addClass("c_orange");
		$("a[href*='naver']").addClass("c_orange");
		$("a[href^='mailto']").addClass("c_silver");
		$("a[href$='net']").addClass("c_purple");
	});
</script>
</head>
<body>
	<a href="http://www.naver.com">네이버</a><br />
	<a href="http://www.nate.com">네이트</a><br />
	<a href="http://www.daum.net">다  음</a><br />
	<a href="mailto:nojm73@naver.com">네이버메일</a><br />
	<a href="mailto:nojm73@nate.com">네이트메일</a><br />
	<a href="mailto:nojm73@daum.net">다음메일</a><br />
</body>
</html>
