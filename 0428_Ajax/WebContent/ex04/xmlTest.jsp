<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	table{border: 1px solid red; width: 600px; }
	table,tr,th,td {border:1px solid red;}
</style>
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			$("#out").empty(); //초기화
			var table ="<table>";
			table +="<thead><tr><th>제품명</th><th>가격</th></tr></thead>";
			table +="<tbody>";
			$.get("data.xml",function(data){
				$(data).find("product").each(function() {
					var name = $(this).find("name").text();
					var price = $(this).find("price").text();
					table += "<tr><td>"+name+"</td><td>"+price+"</td></tr>";         
				});
				table +="</tbody>";
				table += "</table>";
				$("#out").append(table);
			});
		});
	});
</script>
<title>xml를 jQuery로 읽기</title>
</head>
<body>
	<div id ="btn">xml jQuery로 읽기</div>
	<hr />
	<div id="out"></div>
</body>
</html>





