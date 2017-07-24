<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>ajax로 컨트롤러 텍스트 파일 가져오기</title>
<style type="text/css">
	table{border: 1px solid green; width: 70%}
	table, th, tr, td { border: 1px solid green}
</style>
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn1").click(function() {
			$("#body").empty();
			$.ajax({
				url : "/0501_Ajax/MyController02",
				type : "get",
				dataType : "text",
				success : function(data) {
				   var table = "";
				   var str = data.split("/");
				   var st = null;
				   for(var k in str){
					  table += "<tr>";
					    st = str[k].split(",");
					  	for (var i = 0; i < st.length; i++) {
					  		if(i==2) continue ;
						  	table +="<td>"+st[i] +"</td>";	
					  	}
					  table += "</tr>";
				   }
				   $("#body").append(table);
				},
				error : function() {
					alert("실패");
				},
			});
		});
		$("#btn2").click(function() {
			$("#body").empty();
			$.ajax({
				url : "/0501_Ajax/MyController03",
				type : "get",
				dataType : "xml",
				success : function(data) {
					var str ="";
					$(data).find("member").each(function() {
						str +="<tr>";
						str += "<td>"+$(this).find("idx").text()+"</td>";
						str += "<td>"+$(this).find("id").text()+"</td>";
						str += "<td>"+$(this).find("name").text()+"</td>";
						str += "<td>"+$(this).find("age").text()+"</td>";
						str += "<td>"+$(this).find("addr").text()+"</td>";
						str +="</tr>";
					});
					$("#body").append(str);
				},
				error : function() {
					alert("실패");
				},
			});
		});
		$("#btn3").click(function() {
			$("#body").empty();
			$.ajax({
				url : "/0501_Ajax/MyController04",
				type : "get",
				dataType : "xml",
				success : function(data) {
					var str ="";
					$(data).find("member").each(function() {
						str +="<tr>";
						str += "<td>"+$(this).attr("idx")+"</td>";
						str += "<td>"+$(this).attr("id")+"</td>";
						str += "<td>"+$(this).attr("name")+"</td>";
						str += "<td>"+$(this).attr("age")+"</td>";
						str += "<td>"+$(this).attr("addr")+"</td>";
						str +="</tr>";
					});
					$("#body").append(str);
				},
				error : function() {
					alert("실패");
				},
			});
		});
		$("#btn4").click(function() {
			$("#body").empty();
			$.ajax({
				url : "/0501_Ajax/MyController05",
				type : "get",
				dataType : "json",
				success : function(data) {
					var str ="";
					$.each(data,function(data) {
						str +="<tr>";
						str += "<td>"+this["idx"]+"</td>";
						str += "<td>"+this["id"]+"</td>";
						str += "<td>"+this["name"]+"</td>";
						str += "<td>"+this["age"]+"</td>";
						str += "<td>"+this["addr"]+"</td>";
						str +="</tr>";
					});
					$("#body").append(str);
				},
				error : function() {
					alert("실패");
				},
			});
		});
	});
</script>
</head>
<body>
	<h3 id="btn1" align="center">텍스트파일 가져오기</h3>
	<h3 id="btn2" align="center">xml파일 가져오기</h3>
	<h3 id="btn3" align="center">xml_attr파일 가져오기</h3>
	<h3 id="btn4" align="center">json파일 가져오기</h3>
	<div id="mydiv" align="center">
		<table>
			<thead>
				<tr background="skyblue">
					<th>번호</th><th>아이디</th><th>이름</th><th>나이</th><th>주소</th>
				<tr>
			</thead>
			<tbody id="body">
			</tbody>
		</table>
	</div>
</body>
</html>