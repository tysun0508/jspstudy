<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	#box{width: 75px; height: 75px; background-color: pink;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("input[value='숨기기']").click(function() {
			$("#box").hide(400);
		});
		$("input[value='보이기']").click(function() {
			$("#box").show('slow');
		});
		$("input[value='토글1']").click(function() {
			$("#box").toggle(400);
		});
		$("input[value='위로숨기기']").click(function() {
			$("#box").slideUp(400);
		});
		$("input[value='아래로보이기']").click(function() {
			$("#box").slideDown(400);
		});
		$("input[value='토글2']").click(function() {
			$("#box").slideToggle(400);
		});
	});
</script>
</head>
<body>
	<input type="button" value="숨기기" />
	<input type="button" value="보이기" />
	<input type="button" value="토글1" />
	<input type="button" value="위로숨기기" />
	<input type="button" value="아래로보이기" />
	<input type="button" value="토글2" />
	<p>.</p><p>.</p><p>.</p><p>.</p><p>.</p>
	<div id="box"><img alt="java" src="img/image1.gif"></div>
</body>
</html>