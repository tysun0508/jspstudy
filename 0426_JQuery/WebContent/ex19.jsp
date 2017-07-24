<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css"></style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#myselect").change(function() {
			var su1 = parseInt($("#su1").val());
			var su2 = parseInt($("#su2").val());
			var op = $("option:selected").val();
			var res ="";
			if(op=="+"){
				res = su1 + su2 ;
			}else if(op=="-"){
				res = su1 - su2 ;
			}else if(op=="*"){
				res = su1 * su2 ;
			}else if(op=="/"){
				res = su1 / su2 ;
			}
			$("#result").val(res);
		});
	});
</script>
</head>
<body>
	<input type="text" id="su1" size="5" />
	<select id="myselect">
		<option>::선택::</option>
		<option>+</option>
		<option>-</option>
		<option>*</option>
		<option>/</option>
	</select>
	<input type="text" id="su2" size="5" />
	 =
	<input type="text" id="result" size="5" />
</body>
</html>