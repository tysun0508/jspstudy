<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send_go(f) {
		if(f.name.value==""){
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}
		if(f.age.value==""){
			alert("연락처를 입력하세요");
			f.age.focus();
			return;
		}
		
		f.action = "";
		f.submit();
	}
</script>
</head>
<body>
	<%@include file="topmenu.jsp" %>
	<h1>실시간 예약하기</h1>
	<form>
		<fieldset>
			<legend>예약</legend>
			<p>
				이름 : <input type="text" name="name" />
			</p>
			<p>
				연락처 : <input type="number" name="phone" />
			</p>

			<p>
				대여일시 : <select name="rYear">
					<option>선택</option>
					<option value="2017">2017</option>
				</select> 
				<select name="rMonth">
					<option>선택</option>
					<option value="1월">1월</option>
					<option value="2월">2월</option>
					<option value="3월">3월</option>
					<option value="4월">4월</option>
					<option value="5월">5월</option>
					<option value="6월">6월</option>
					<option value="7월">7월</option>
					<option value="8월">8월</option>
					<option value="9월">9월</option>
					<option value="10월">10월</option>
					<option value="11월">11월</option>
					<option value="12월">12월</option>
				</select> 
				<select name="rDay">
					<option>선택</option>
					<option value="1일">1일</option>
					<option value="2일">2일</option>
					<option value="3일">3일</option>
					<option value="4일">4일</option>
					<option value="5일">5일</option>
					<option value="6일">6일</option>
					<option value="7일">7일</option>
					<option value="8일">8일</option>
					<option value="9일">9일</option>
					<option value="10일">10일</option>
					<option value="11일">11일</option>
					<option value="12일">12일</option>
					<option value="13일">13일</option>
					<option value="14일">14일</option>
					<option value="15일">15일</option>
					<option value="16일">16일</option>
					<option value="17일">17일</option>
					<option value="18일">18일</option>
					<option value="19일">19일</option>
					<option value="20일">20일</option>
					<option value="21일">21일</option>
					<option value="22일">22일</option>
					<option value="23일">23일</option>
					<option value="24일">24일</option>
					<option value="25일">25일</option>
					<option value="26일">26일</option>
					<option value="27일">27일</option>
					<option value="28일">28일</option>
					<option value="29일">29일</option>
					<option value="30일">30일</option>
					<option value="31일">31일</option>
				</select>
			</p>
			<p>
				반납일시 : <select name="byear">
					<option>선택</option>
					<option value="2017">2017</option>
				</select> 
				<select name="bMonth">
					<option>선택</option>
					<option value="1월">1월</option>
					<option value="2월">2월</option>
					<option value="3월">3월</option>
					<option value="4월">4월</option>
					<option value="5월">5월</option>
					<option value="6월">6월</option>
					<option value="7월">7월</option>
					<option value="8월">8월</option>
					<option value="9월">9월</option>
					<option value="10월">10월</option>
					<option value="11월">11월</option>
					<option value="12월">12월</option>
				</select> 
				<select name="bDay">
					<option>선택</option>
					<option value="1일">1일</option>
					<option value="2일">2일</option>
					<option value="3일">3일</option>
					<option value="4일">4일</option>
					<option value="5일">5일</option>
					<option value="6일">6일</option>
					<option value="7일">7일</option>
					<option value="8일">8일</option>
					<option value="9일">9일</option>
					<option value="10일">10일</option>
					<option value="11일">11일</option>
					<option value="12일">12일</option>
					<option value="13일">13일</option>
					<option value="14일">14일</option>
					<option value="15일">15일</option>
					<option value="16일">16일</option>
					<option value="17일">17일</option>
					<option value="18일">18일</option>
					<option value="19일">19일</option>
					<option value="20일">20일</option>
					<option value="21일">21일</option>
					<option value="22일">22일</option>
					<option value="23일">23일</option>
					<option value="24일">24일</option>
					<option value="25일">25일</option>
					<option value="26일">26일</option>
					<option value="27일">27일</option>
					<option value="28일">28일</option>
					<option value="29일">29일</option>
					<option value="30일">30일</option>
					<option value="31일">31일</option>
				</select>
			</p>
			<p>
				지역선택: <select name="city">
					<option>지역선택</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="대전">대전</option>
				</select>
			</p>
			<p>			
				차종선택 : <select name="carchoice">
					<option>차종선택</option>
					<option value="소형차">소형차</option>
					<option value="중형차">중형차</option>
					<option value="대형차">대형차</option>
					<option value="수입차">수입차</option>
					<option value="승합차">승합차</option>

				</select>
			</p>
			<p style="color: #EB0000">옵션 : 예약확인전화 드리며 예약금 입금시에만 최종예약이 완료됩니다.</p>
			<p>
				<input type="button" value="보내기" onclick="send_go(this.form)" />
			</p>
			<p>
				<input type="reset" value="취소" />
			</p>
		</fieldset>
	</form>
</body>
</html>