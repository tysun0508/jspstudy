<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FORM 요소</title>
<style type="text/css"></style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		var res = "";
		$(":input").each(function() {
			res += "태그명:"+$(this).get(0).tagName
			+", type명:"+$(this).attr("type")+"\n"; 
		});
		alert(res)
	});
</script>
</head>
<body>
	<input type="text" /><br />
	<input type="checkbox" /><br />
	<input type="button" /><br />
	<input type="radio" /><br />
	<input type="password" /><br />
	<input type="hidden" /><br />
	<input type="file" /><br />
	<input type="submit" /><br />
	<input type="reset" /><br />
	<select name="select">
		<option value="1">내용</option>
	</select>
	<textarea rows="" cols="">sodsdfsd</textarea>
</body>
</html>