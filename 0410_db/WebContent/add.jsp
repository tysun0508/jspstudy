<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 페이지 </title>
<style type="text/css">
	table { width: 40%;  margin: auto; height: 350px}
	table, th, td {border: 1px solid black;}
	div{text-align: center; }
</style>
<script type="text/javascript">
	function add_go(f) {
		/* 유효성 검사 */
		 if(f.id.value==""){
			 alert("ID를 입력하세요");
			 f.id.focus();
			 return;
		 }
		 if(f.pwd.value==""){
			 alert("비번를 입력하세요");
			 f.pwd.focus();
			 return;
		 }
		 if(f.name.value==""){
			 alert("이름를 입력하세요");
			 f.name.focus();
			 return;
		 }
		 if(f.age.value==""){
			 alert("나이를 입력하세요");
			 f.age.focus();
			 return;
		 }
		 if(f.addr.value==""){
			 alert("주소를 입력하세요");
			 f.addr.focus();
			 return;
		 }
		 f.action="add_ok.jsp";
		 f.submit();
	}
</script>
</head>
<body>
	<div>
		<form>
		 <table>
			<thead>
				<tr><th colspan="2">회원 정보</th></tr>
			</thead>
			<tbody>
			   <tr>
			   		<td> 아이디 </td>
			   		<td> <input type="text" name="id" /> </td>
			   </tr>
			   <tr>
			   		<td> 패스워드 </td>
			   		<td> <input type="password" name="pwd" /> </td>
			   </tr>
			   <tr>
			   		<td> 이름 </td>
			   		<td> <input type="text" name="name" /> </td>
			   </tr>
			   <tr>
			   		<td> 나이 </td>
			   		<td> <input type="text" name="age" /> </td>
			   </tr>
			   <tr>
			   		<td> 주소 </td>
			   		<td> <input type="text" name="addr" /> </td>
			   </tr>
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="2">
							<input type="button" value="회원가입" onclick="add_go(this.form)" />&nbsp; &nbsp;
							<input type="reset" value="취소" " />&nbsp; &nbsp;
							
				</tr>	
			</tfoot>
		</table>
	</form>
	</div>	
</body>
</html>