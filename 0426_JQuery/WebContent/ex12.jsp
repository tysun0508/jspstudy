<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parseInt와 slice</title>
<style type="text/css"></style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		 $(".button").click(function() {
			var res = $(".res")
			var fs = res.css("fontSize"); // 클래스res의 글자크기 
			   alert(fs); // 16px
			var su = parseInt(fs); // 16
			var dan = fs.slice(-2) // px
			if(this.id == "goBic"){
				su = su * 1.5 ;
			}else if(this.id=="goSmall"){
				su = su / 1.5 ;
			}
			res.css("fontSize",su+dan);
		}) 
	});
</script>
</head>
<body>
	<div id="btn">
		<div class="button" id="goBic">늘리기</div>
		<div class="button" id="goSmall">줄이기</div>
	</div>
	<hr />
	<div class="res">안녕하세요</div>
</body>
</html>


