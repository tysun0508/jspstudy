<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>script 읽어오기</title>
<style type="text/css">
	table{border: 1px solid red; width: 600px; }
	table,tr,th,td {border:1px solid red;}
</style>
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			$("#out").empty();
			$.getScript("script.js");
		});
		
	});
</script>
</head>
<body>
	<div id ="btn">script jQuery로 읽기</div>
	<hr />
	<div id="out"></div>
</body>
</html>