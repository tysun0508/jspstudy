<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, tr, td{border: 1px solid blue ; }
	.red{background-color: red;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("tr:odd").addClass("red");
		$("tr:even").css("background","skyblue");
		// :contains(포함하는 단어)
		$("td:contains('Web')").css("background","green");
	});
</script>
</head>
<body>
	<table>
		<tbody>
			<tr><td>Window Server</td></tr>
			<tr><td>DB Server</td></tr>
			<tr><td>Web Server</td></tr>
			<tr><td>node.js</td></tr>
			<tr><td>Window Server</td></tr>
			<tr><td>DB Server</td></tr>
			<tr><td>Web Server</td></tr>
			<tr><td>node.js</td></tr>
		</tbody>
	</table>
</body>
</html>

