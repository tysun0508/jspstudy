<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>animate</title>
<style type="text/css"></style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			$("#box").animate(
				{width:"400px"},
				{duration:5000, easing:"linear",
				  step:function(x){
					  $("#demo").text(Math.round(x * 100 / 400) + "%");
				  }}
			);
		});
	});
</script>
</head>
<body>
	<button id="btn">Start Progress Bar</button>
	<div style="border: 1px solid green; margin: 10px; width: 400px;">
		<div id="box" style="background-color: #98bf21; 
			height: 50px; width: 1px; border: 1px solid green"></div>
	</div>
	<p id="demo"></p>
</body>
</html>