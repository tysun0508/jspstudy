<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>animate</title>
<style type="text/css">
	.myDiv{position:absolute;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#go").click(function() {
			$(".myDiv").animate({left: "+=100",top:"+=100"},400);
		});
		$("#stop").click(function() {
			$(".myDiv").stop();
		});
		$("#back").click(function() {
			$(".myDiv").animate({left: "-=100",top:"-=100"},400);
		});
	});
</script>
</head>
<body>
	<button id="go">go</button>
	<button id="stop">stop</button>
	<button id="back">back</button>
	<div class="myDiv">
		<img alt="java" src="img/image1.gif" />
	</div>
</body>
</html>



