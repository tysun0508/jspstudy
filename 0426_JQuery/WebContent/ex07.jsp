<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>메소드를 동적으로 이벤트 부여 = bind</title>
<style type="text/css"></style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		// bind는 Deprecated in version 3.0. Use the on() 
		// $("#btn").click(function() { alert('Hi~~')});
		// $("#btn").bind("click",function(){ alert('Hello~~')});
		// $("#btn").on("click",function(){ alert('Hello~~')});
		// $("#btn").click(function() {  $("#img").hide();		});
		// $("#btn").bind("click",function() {$("#img").hide();});
		// $("#btn").on("click",function() {$("#img").hide();});
		
		// $("#btn").on("mouseover",function() { $("#img").hide();});
		// $("#btn").on("mouseout",function() { $("#img").show();});
		 
		 $("#btn").mouseover(function(){
			 $("#img").hide();
		 }); 
		 $("#btn").mouseout(function(){
			 $("#img").show();
		 }); 
	});
</script>
</head>
<body>
	<div id="btn">안녕</div>
	<img id="img" src="img/image1.gif" />
</body>
</html>