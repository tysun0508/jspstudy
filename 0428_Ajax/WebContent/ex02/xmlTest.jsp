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
		  var request ;
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
	 	   request.onreadystatechange = function(){
	 		   if(request.readyState==4 && request.status == 200){
	 			 // html,txt는 그냥 가져와서 출력
	 			 // xml 가져와서 출력 할 때는 파싱 해야 된다.
	 			 // xml 자료를 html 변경 (DOM)
	 			  var xml = request.responseXML;
	 			  //  document.body.innerHTML = xml;
	 			  var names = xml.getElementsByTagName("name");
	 			  var prices = xml.getElementsByTagName("price");
	 			  for (var i = 0; i < names.length; i++) {
					 // 요소에서 텍스트 추출 ; childNodes[0].nodeValue
					 var name = names[i].childNodes[0].nodeValue;
					 var price = prices[i].childNodes[0].nodeValue;
					 document.body.innerHTML += "<h2>"+name+", "+price +"</h2>";
	 			  }
	 		   }
	 	    }
	 	  request.open("GET","data.xml",false);
	 	  request.send();
	 </script>   
</body>
</html>





















