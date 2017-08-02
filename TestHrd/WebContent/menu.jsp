<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상단레이아웃</title>
		
		<style type="text/css">
        
            /* 헤더 */
			header{ background-color: blue; color: white; text-align: center;
				    font-family : 맑은 고딕; padding: 4px;}            
            
            /* 메뉴 */
			#menu{ background-color: lightblue; }            
            /* Link */   
			#menu a{text-decoration: none; font-weight:bold; color: white; 
              font-size: 16px; cursor: pointer; display: inline-block;  padding: 6px; font-family : 맑은 고딕;}	           
			#menu a.visited{ color : red;} 
			#menu a:hover{color : black; }                
           
            
		</style>
	</head>
	
	<body>
		<header contenteditable="">
			<h1>쇼핑몰 회원관리 ver1.0 김태양</h1>			
		</header>
        
		<nav id="menu">            
                <a href="insert.jsp">회원등록</a>
                <a href="list.jsp">회원목록조회/수정</a>
                <a href="sales.jsp">회원매출조회</a>
                <a href="index.jsp">홈으로</a>          		
		</nav>		    
       
	</body>
</html>