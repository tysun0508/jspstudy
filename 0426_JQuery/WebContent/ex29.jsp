<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#content{
		width: 1200px;
		height: 600px;
		background-color: skyblue;
		padding-left: 20px;
		padding-right: 20px;
	}
	img{width: 200px; height: 250px}
	#movie{
		width: 200px;
		height: 300px;
		position: absolute;
		top: 200px;
		left:50px;
		padding: 20px;
		display: none;
	}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		 $("#show").click(function() {
			 $("#movie").css("display","block");
		})
		 $("#close").click(function() {
		    	$("#movie").css("display","none");
			})
	});
</script>
</head>
<body>
	<div id ="movie">
		<div id="close">
			<img alt="" src="img/image1.gif">
		</div>
	</div>
	<div id="content">
			<h2> 피카다리 영화관</h2>
			<p>
				망했냐? <br /> 몰라몰라몰라
			</p>
			<p id="show">영화보기</a>
	</div>
</body>
</html>