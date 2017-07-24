<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hover(mouesover, mouseout)</title>
<style type="text/css">
	.bgyellow{background-color: yellow;}
	.bgblue{background-color: blue;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		/* 
		$("table tr:gt(0)").on("mouseover",function(){
			$(this).addClass("bgyellow")
		})
		$("table tr:gt(0)").on("mouseout",function(){
			$(this).removeClass("bgyellow")
		})
		 */
		$("table tr:gt(0)").hover(
		   function(){$(this).addClass("bgblue")},
		   function(){$(this).removeClass("bgblue")}			
		)
	});
</script>
</head>
<body>
	<table border="1" style="width: 350px; text-align: center;" >
		<tbody>
			<tr> <td>제목</td> </tr>
			<tr> <td>java</td> </tr>
			<tr> <td>jsp</td> </tr>
			<tr> <td>spring</td> </tr>
		</tbody>
	</table>
</body>
</html>



