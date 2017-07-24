<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	table{border: 1px solid black; display: table;margin-left: auto;margin-right: auto; text-align: center;}
	table,th,td {border: 1px solid black; height: 30px}
</style>
<script type="text/javascript">
	function add_go(f) {
		f.action = "add_go.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<form>
		<table>
			<thead>
				<tr><th colspan="2"><h2>회원가입 페이지</h2></th></tr>
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
				<tr>
					<td colspan="2">
							<input type="button" value="회원가입" onclick="add_go(this.form)" />&nbsp; &nbsp;
							<input type="reset" value="다시작성" />&nbsp; &nbsp;
							
				</tr>	
			</tfoot>
		</table>
	</form>
	</div>	
</body>
</html>