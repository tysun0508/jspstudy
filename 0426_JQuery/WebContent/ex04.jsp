<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 선택자를 이용한  addClass</title>
<style type="text/css">
	.c_red{color: red;}
	.c_orange{color: orange;}
	.c_silver{color: silver;}
	.c_purple{color: purple;}
	.b_red{background-color: red;}
	.b_orange{background-color: orange;}
	.b_silver{background-color: silver;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		// 자식 선택자를 이용
		   $("ul>li").addClass("c_red");
		// :first    첫번째 요소
		   $("div:first").addClass("c_orange")
		// :last     마지막 요소 
		   $("div:last").addClass("c_purple")
		// :even     짝수 요소 // 주의 사항 0요소는 부터(짝수부터)
		   $("div:even").addClass("b_silver")
		// :odd      홀수 요소
		  $("div:odd").addClass("b_red")
		  
		// 부모요소 > 자식요소
		// .addClass("클래스이름") == $(선택자).css("속성","값")
		$("body>ul>li").css("color","blue");
		$("body>ul>ul>ul>li").css("color","skyblue");
		$("body>ul>ul li").css("background", "silver");
	});
</script>
</head>
<body>
	<div class="red">
		<h3>Red영역</h3>
		<h3>Red2영역</h3>
	</div>
	<div>Green 영역
		<h3>Green2 영역</h3>
	</div>
	<div>Blue 영역</div>
	<span id="t">텍스트영역</span>
	<ul type="disc">
		<li>java</li>
		<li>jsp</li>
		<ul>
			<li>servlet</li>
			<ul type="circle">
				<li>EL</li>
				<li>JSTL</li>
			</ul>
			<li>spring</li>
		</ul>
		<li>Android</li>
	</ul>
</body>
</html>