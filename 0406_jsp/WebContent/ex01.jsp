<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title> 지시어() : 디렉티브(page, taglib, include)</title>
</head>
<body>
	<!-- html 주석 : 소스 보기에서 보인다. -->
	<%-- jsp주석 : 소스 보기에서 보이지 않는다.00 --%>
	<%--
		1. page 지시어 : 현재 페이지에 대한 정보를 지정
				   	톰켓이 page 지시어를 보고 해당 페이지를 판단해서 처리
		속성 : language = 스크립트코드에 사용되는 언어 지정.
			 contentType = jsp가 생성할 문서의 타입을 말한다.
			 pageEncoding = jsp 페이지 자체의 캐릭터 인코딩을 지정
			 import = 사용할 자바 클래스의 패키지 지정
			 session = 세션 사용여부 (true)
			 		 = 사용자 정보를 서버측에서 저장하고 있는 것
			 		 = 생명주기는 기본적으로 웹 브라우저가 종료하면 끝이다.
			 		   시간 조정가능(은행 사이트)
			 buffer = 출력 버퍼 크기 지정 (최소 8KB)
			 autoFlush = 버퍼가 다 찼을 경우 자동 출력
			 errorPage = 오류 페이지 지정
			 isErrorPage = 해당 페이지가 오류 페이지이면 true, 아니면 false(기본값은 false)
		
		2. taglib : 해당 페이지에서 사용할 태그 라이브러리 지정.
					JSTL 사용할 때 필요함
		3. include : 특정 영역에 다른 문서를 포함 시킬 때 사용
					 지정한 문서의 소스를 복사하여 현재 문서에 붙여넣기 한 후에 한번에 처리한다.
	 --%>
</body>
</html>











