<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery.load</title>
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#a").load("data2.jsp");
		$("#b").load("data2.jsp", {"result":$(this).val()})
		$.get("data2.jsp", function(data) {
			$("#c").html(data);
		});
		$.get("data2.jsp", function(data) {
			$("#d").append(data);
		});
		$.get("data2.jsp", function(data) {
			$("#e").html(data);
		});
		$.get("data2.jsp", function(data) {
			$("#f").append(data);
		});
	});
</script>
</head>
<body>
	<div id="a">1</div>
	<hr/>
	<div id="b">2</div>
	<hr/>
	<div id="c">3</div>
	<hr/>
	<div id="d">4</div>
	<hr/>
	<div id="e">5</div>
	<hr/>
	<div id="f">6</div>
	<hr/>
</body>
</html>