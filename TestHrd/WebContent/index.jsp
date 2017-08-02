<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쇼핑몰 회원관리 ver1.0</title>
		
		<style type="text/css">
            
            /* 본문 */            
            #content{ font-family : 맑은 고딕; height: 650px; }
            
		</style>
	</head>
	
	<body>
		<jsp:include page="menu.jsp"/>
		
        <section id="content">
           <h2 align="center">쇼핑몰회원관리 프로그램</h2>               
           <p>쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구출하고 회원관리 프로그램을 작성하는 프로그램이다.</p>
           <p>프로그램작성순서</p>
           <p>1. 회원정보 테이블을 생성한다.</p>
           <p>2. 매출정보 테이블을 생성한다.</p>
           <p>3. 회원정보, 매출정보테이블에 제시된 문제지의 참조데이터를 추가생성한다.</p>
           <p>4. 회원정보 입력 화면프로그램을 작성한다.</p>
           <p>5. 회원정보 조회 프로그램을 작성한다.</p>
           <p>6. 회원매출정보 조회 프로그램을 작성한다.</p>                   
       </section>     
        
        <jsp:include page="footer.jsp"/>
		
	</body>
</html>