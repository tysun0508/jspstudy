<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>each,text,htm</title>
<style type="text/css"></style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		 // 반복 ; each(function(index, 요소){ })
		 // html(); 요소의 html를 get()
		 // text(); 모든 텍스트 요소를 get()
		 // attr(): 속성부여
	     // val() : 필드의 값
	     // css() : 스타일
	     // position() : 위치속성	
	     $("p").each(function(index) {
			$(this).attr({"id" : "param-"+index});
		})
		$("#btn1").click(function() {
			alert($("#param-1").text()); // 글자만 추출(get)
			alert($("#param-1").html()); // 글자와 태그 추출(get)
		})
		$("#btn2").click(function() {
			$("#param-3").text("<b>안녕하세요</b>"); //set
			$("#param-4").html("<b>안녕하세요</b>"); //set
		})
	});
</script>
</head>
<body>
	<p>이것은 하나의 단락이다.</p>
	<P><b>첫번째</b></P>
	<P>두번째</P>
	<P>세번째</P>
	<P>네번째</P>
	<P>다섯번째</P>
	<input type="button" id="btn1" value="동작1" />
	<input type="button" id="btn2" value="동작2" />
	<input type="button" id="btn3" value="동작3" />
</body>
</html>




