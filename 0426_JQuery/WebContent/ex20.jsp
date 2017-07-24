<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setInterval/clearInterval 자바스크립트</title>
<style type="text/css"></style>
<script type="text/javascript">
		
		var news = ["LGU+, 1분기 영업익 급증…LTE 가입자, 전체 88.7%(상보)",
			"대선까지 D-12, 文-安 사이버보안 공약은?",
			"네이버, 1분기 영업이익 2908억원…전년비 13.2%↑",
			"우리은행도 O2O 플랫폼 구축…부산은행 주도한 O2O, 은행권 확산",
	        "반‧디 호황 제대로 누린 삼성전자…1분기 영업익 74% 부품(상보)",
			"LG화학 박진수 부회장 “호실적 안주 말고 성장 체질 강화”"]
		var timer;
		var index = 0 ;
		function start_news() {
			// 2초마다 실행, 콜백함수호출
			timer = setInterval(showNews, 3000);
		}
		function showNews() {
			var div	= document.getElementById("myDiv");
			div.innerHTML = news[index++];
			if(index == news.length){index=0}
		}
		function stop_news() {
			clearInterval(timer);
		}
		
</script>
</head>
<body>
	<div id="myDiv"></div>
	<input type="button" value="뉴스보기" onclick="start_news()" />
	<input type="button" value="뉴스중지" onclick="stop_news()" />
</body>
</html>