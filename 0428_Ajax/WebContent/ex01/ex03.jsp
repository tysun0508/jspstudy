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
	 	// request.readyState => 데이터의 배달 결과 상태 표시;
	 	// 0(객체 생성, open안함), 1(open함, send안함)
	 	// 2(send 함, 데이터를 받지 않음) 3(데이터 일부만 받음)
	 	// 4(데이터 전부를 받음)
	 	
	 	// request.status => 200(성공), 4XX(클라이언트 오류), 5XX(서버 오류)
	 	   request.onreadystatechange = function(){
	 		   if(request.readyState==4 && request.status == 200){
	 			  document.body.innerHTML += request.responseText ;
	 		   }
	 	    }
	 	
	 	// 2. open("전송방식","경로","비동기여부");
	 	  request.open("GET","data.html",false);
	 	// 3. send() : 실행
	 	  request.send();
	 	// 4. 화면에 출력 : innerHTML
	 	//  document.body.append(request.responseText);
	 	//  document.body.innerHTML += request.responseText ;
	 	
	 	
	 </script>   
</body>
</html>





