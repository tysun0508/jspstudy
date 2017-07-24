<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{width: 500px}
	table, tr, td { border: 1px solid;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		// .find => 특정요소 찾기
		// .get  => 특정요소 가져오기
		// :eq(index) : 해당 인덱스 요소
		// :gt(index) : 해당 인덱스 요소 보다 큰요소
		// :lt(index) : 해당 인덱스 요소 보다 작은 요소	
		
		$("td:contains('jsp')")    // jsp 문자 찾기
		 .siblings()   // 형제 노드들(자기자신은 제외)
		 .css("color","red")
		 .parent()
		 .find("td:eq(0)") // td 중 0번째 
		 .css("color","blue")
		 
		 var name = $("#web").get(0).tagName;
		 alert(name+"태그")
	});
</script>
</head>
<body>
	<table>
		<tbody>
			<tr id="app">
				<td>java</td>
				<td>Basic</td>
				<td>8.0</td>
			</tr>
			<tr id="web">
				<td>jsp</td>
				<td>servlet</td>
				<td>2.3</td>
			</tr>
			<tr>
				<td>Spring</td>
				<td>Web</td>
				<td>4.0</td>
			</tr>
		</tbody>
</body>
</html>



