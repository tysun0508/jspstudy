<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 요소</title>
<style type="text/css"></style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("[type=text]").css("background", "silver");
		$("#btn").click(function() {
			var v = $("#id").val();
			$("#id2").val(v);
		});

		$("#chk").change(function() {
			if ($(this).is(":checked")) {
				var v = $("#id").val();
				$("#id2").val(v);
			}
		});

		$(":radio").change(function() {
			var v2 = $("input:checked").val();
			$("#id3").val(v2);
		});

		$("select").change(function() {
			var v3 =$( "select option:selected" ).val();
			$("#id4").val(v3);
		});
		
	});
</script>
</head>
<body>
	아이디 :
	<input type="text" name="id" id="id" />
	<hr />
	<input type="button" value="상동" id="btn" />
	<input type="checkbox" id="chk" value="1" />상동
	<hr />
	아이디 :
	<input type="text" name="id2" id="id2" />

	<hr />

	<input type="radio" name="fruit" value="orange" id="orange">
	<label for="orange">orange</label>
	<input type="radio" name="fruit" value="apple" id="apple">
	<label for="apple">apple</label>
	<input type="radio" name="fruit" value="banana" id="banana">
	<label for="banana">banana</label> 아이디 :
	<input type="text" name="id3" id="id3" />

	<hr />
	<select name="garden" >
		<option>Flowers</option>
		<option >Shrubs</option>
		<option>Trees</option>
		<option >Bushes</option>
		<option>Grass</option>
		<option>Dirt</option>
	</select>
     <input type="text" name="id4" id="id4" />

</body>
</html>

