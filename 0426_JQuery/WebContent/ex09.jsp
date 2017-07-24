<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>slice(n,n2)</title>
<style type="text/css">
	.red{color: red;}
	.blue{color: blue;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		// n부터 n2 전까지(0부터시작)
		$("input").slice(1,3).addClass("red");
		  // -n은  오른쪽에서 몇개
		$("input").slice(-2).addClass("blue");
	});
</script>
</head>
<body>
	<input type="button" value="버튼1" />
	<input type="button" value="버튼2" />
	<input type="button" value="버튼3" />
	<input type="button" value="버튼4" />
	<input type="button" value="버튼5" />
</body>
</html>




