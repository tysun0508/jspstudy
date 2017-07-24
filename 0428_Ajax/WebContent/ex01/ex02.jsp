<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- ex01의 단점 : IE6 이하는 XMLHttpRequest 없다.
	      ActiveXObject 형태로 지원하는 것이 있다. --%>
	 <script type="text/javascript">
	   function createRequest() {
		  var request ;
		   try { // IE 7.0이상
			   request = new XMLHttpRequest();
			} catch (e) {
			   // IE6.0이하
			   try {
				  request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				  request = new ActiveXObject("Msxml3.XMLHTTP");   	
				}
			}  
			return request;
 	   }
	 
	 
	 	// 1. 객체 생성 (XMLHttpRequest 객체 생성)
	 	var request = new createRequest();
	 	// 2. open("전송방식","경로","비동기여부");
	 	request.open("GET","data.html",false);
	 	// 3. send() : 실행
	 	  request.send();
	 	// 4. 화면에 출력 : innerHTML
	 	//  document.body.append(request.responseText);
	 	  document.body.innerHTML += request.responseText ;
	 </script>   
</body>
</html>






