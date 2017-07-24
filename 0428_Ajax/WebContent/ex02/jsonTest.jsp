<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트로 읽기</title>
</head>
<body>
	<script type="text/javascript">
		function createRequest() {
			var request;
			try {
				request = new XMLHttpRequest();
			} catch (e) {
				try {
					request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					request = new ActiveXObject("Msxml3.XMLHTTP");
				}
			}
			return request;
		}
		var request = new createRequest();
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				// eval(내용) : 해당 내용을 자바스크립트 형태로 변경
				// var json = request.responseText;
				var json = eval("(" + request.responseText + ")");
				document.body.innerHTML = json;
				var output = "";
				for (var i = 0; i < json.length; i++) {
					for ( var key in json[i]) {
						output += json[i][key]
					}
					output += "<br/>";
				}
				document.body.innerHTML = output;
			}
		}
		request.open("GET", "data.js", false);
		request.send();
	</script>
</body>
</html>




