<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{border: 1px solid green; width: 50%;}
	table, th, tr, td { border: 1px solid red;}
</style>
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		 $("#btn1").click(function() {
			$("#mydiv").empty();
				$.ajax({
					url : "/0501_Ajax/MyController06",
					type : "get",
					dataType : "text",
					success : function(data) {
						   var table = "<table><thead><tr><th>지역</th><th>온도</th>"+
						               "<th>상태</th></tr></thead><tbody>";
						   var str = data.split("/");
						   var st = null;
						   for(var k in str){
							  table += "<tr>";
							    st = str[k].split(",");
							  	for (var i = 0; i < st.length; i++) {
								  	table +="<td>"+st[i] +"</td>";	
							  	}
							  table += "</tr>";
						   }
						   table += "</tbody></table>"
						   $("#mydiv").append(table);
					},
					error : function(){
						alert("실패");
					}
				});
		});
		 $("#btn2").click(function() {
			$("#mydiv").empty();
				$.ajax({
					url : "/0501_Ajax/MyController07",
					type : "get",
					dataType : "json",
					success : function(data) {
						var table = "<table><thead><tr><th>도서관이름</th><th>주소</th>"+
						            "<th>쉬는 날</th><th>전화</th></tr></thead><tbody>";
						$.each(data,function(data){
							$.each(this["row"],function(data2){
								table +="<tr>";
								table +="<td>"+this["LBRRY_NAME"] +"</td>";
								table +="<td>"+this["ADRES"]  +"</td>";
								table +="<td>"+this["FDRM_CLOSE_DATE"]  +"</td>";
								table +="<td>"+this["TEL_NO"]  +"</td>";
								table +="</tr>";
							});
						});
						table += "</tbody></table>"
						$("#mydiv").append(table);
					},
					error : function(){
						alert("실패");
					}
			});
		});
		 $("#btn3").click(function() {
			 $("#mydiv").empty();
			$.ajax({
				url : "/0501_Ajax/MyController08",
				type : "get",
				dataType : "xml",
				success : function(data) {
					   var table = "<table><thead><tr><th>지역</th><th>온도</th>"+
					               "<th>상태</th></tr></thead><tbody>";
					              
						  $(data).find("local").each(function() {
							table +="<tr>"; 
							   table +="<td>"+$(this).text() +"</td>"
							   table +="<td>"+$(this).attr("ta") +"</td>"
							   table +="<td>"+$(this).attr("desc") +"</td>"
							table +="</tr>";
						  });	
						  
					      table += "</tbody></table>"
					   $("#mydiv").append(table);
				},
				error : function(){
					alert("실패");
				}
			});
		});
	});
</script>
</head>
<body>
	<h3 id="btn1">날씨보기</h3>
	<h3 id="btn2">도서관보기</h3>
	<h3 id="btn3">날씨보기</h3>
	<div id="mydiv"></div>
</body>
</html>