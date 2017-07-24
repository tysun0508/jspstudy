<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title> 기본 내장객체들 </title>
</head>
<body>
<%--
   1. pageContext
	다른 모든 내장 객체에 대한 프로그램적 접근 방법 제공한다.
    pageContext 기본 객체를 직접 사용하는 것은 드물다.
    1. getRequest()  2. getResponse() 
    3. getOut(),     4.getPage(), 
    5. getSession : 세션 얻기
    6. getServletContext() : application 객체 얻기 
  
     ** pageContext영역과 속성 **
    // 해당 페이지가 변경되면 pageContext도 생명주기 끝
     주요메소드 : pageContext.setAttribute("이름",값)
                 pageContext.getAttribute("이름")
                    
   2. application ; 웹 어플리케이션(컨텍스트) 전체를 관리하는 객체
                    해당 어플리케이션이 종료되면 생명주기 끝
     ** application영역과 속성 **               
                 application.setAttribute("이름",값)
                 application.getAttribute("이름")
   3. session : 서버와 클라이언트간의 접속을 유지 시켜주는 것
      사용자와 관련된 정보를 클라이언트측에 있으면 쿠키에 저장
      사용자와 관련된 정보를 서버측에 있으면 세션에 저장
      http는 데이터를 요청하고 결과를 받으면 연결이 바로 종료된다.
      클라이언트가 서비스를 서버에 요청할 경우, 서버측에서 클라이언트에게
      클라이언트를 알 수 있는 ID를 부여한다.
      서버는 세션ID로 클라이언트의 이전 접속 유무를 알 수 있다.
      세션ID는 웹 브라우저가 종료 되기 전까지 유지 된다.
      (단, 시간제한을 두는 경우도 있다.(은행))
      getID(), invalidate(), 
      
      ** session영역과 속성 **               
       session.setAttribute("이름",값)
       session.getAttribute("이름")
        
   4. page : jsp에서 자기 자신을 참조할때 사용, 
             jsp 페이지를 구현한 자바 클래스 객체
             jsp 컨테이너에서 생성된 서블릿 객체를 참조하는 참조변수  
   5. config : jsp 페이지 설정 정보
   6. excepion : 일반페이지에서는 사용안함, 오류페이지에서 사용
                                 
 --%>	
</body>
</html>