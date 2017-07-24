<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter, end</title>
<style type="text/css">
	.redborder{border: 1px solid red;}
	.five{border-width: 5px;}
	.five2{background-color: blue;}
	.ten{border-width: 10px;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		// filter('선택기') => 선택기에 매치되는 jQuery집합을 읽어옴
		// end() => 이전상태로 되돌아감 ctrl+z
		// .removeClass(클래스이름):클래스 삭제
		$("img")
		.addClass("redborder")
		.filter("[title *= 'jsp']")
		.addClass("five")
		.addClass("five2")
		.end()
		.filter("[title $= 'a']")
		.addClass("ten")
		.end()
		.filter("[title ^= 'sp']") 
		.addClass("ten")
		.end()
		.filter("[title *= 'jsp']")
		.removeClass("five")
		.removeClass("five2")
		.css("border", "10px solid red")
		.end()
	});
</script>
</head>
<body>
	<img alt="JAVA" title="java" src="#">
	<img alt="JSP" title="jsp" src="#">
	<img alt="SPRING" title="spring" src="#">
</body>
</html>