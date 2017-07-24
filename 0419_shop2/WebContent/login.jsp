<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	table{table;margin-left: auto;margin-right: auto; text-align: center;}
	table,th,td {border: 1px solid black; height: 30px}
</style>
<script type="text/javascript">
	function login_go(f) {
			f.action="login_ok.jsp";
			f.submit();
	}
</script>
</head>
<body>
	<div>
		<form>
		<table>
			<thead>
				<tr><th colspan="2"><h2>Login</h2></th></tr> 
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
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="2">
							<input type="button" value="로그인" onclick="login_go(this.form)" />&nbsp; &nbsp;
							<input type="button" value="회원가입" onclick="location.href='add.jsp'" />&nbsp; &nbsp;
							
				</tr>	
			</tfoot>
		</table>
	</form>
	</div>	
</body>
</html>