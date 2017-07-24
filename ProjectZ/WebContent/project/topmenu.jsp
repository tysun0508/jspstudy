<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {margin:0;}

.topnav {
  overflow: hidden;
  background-color: #0000CD;
  max-width : 100%;
  height : 50px;
}

.topnav a {
  
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 120px ;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>
	<header >
	<div style="float: right;">
		<a href="main.jsp">Home</a>&nbsp;|&nbsp;
		<a href="admin.jsp">Admin</a>&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div style="float: left;">
		&nbsp;&nbsp;&nbsp;<a href="main.jsp"><img style="width: 170px; height: 50px" src="../img/sun.JPG"></a>
	</div>
</header>
	<nav>
		<div class="topnav" style="clear: both;"> 
		
		  <b><a href="info.jsp">회사소개</a>
		  <a href="booking.jsp">실시간예약</a>
		  <a href="sRent.jsp">단기대여</a>
		  <a href="rentUse.jsp">렌트카 이용안내</a>
		  <a href="list.jsp">고객지원</a></b>
		</div>
	</nav>
</body>
</html>