<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function login_go(f) {
			f.action="ex08_2.jsp";
			f.submit();
		}
	</script>
</head>
<body>
   <%
	   if(session.getAttribute("id_chk") != null){
		   	if(session.getAttribute("id_chk").equals("ok")){
		   		
		   	}else if(session.getAttribute("id_chk").equals("err")){
		   		session.invalidate();
		   		response.sendRedirect("ex08_3.jsp");
		   	}
	   }else{
	%>
	<form>
		<p> 아이디 : <input type="text" name="id" size="10" /></p>
		<p> 패스워드 : <input type="password" name="pw" size="10" /></p>
		<input type="button" value="로그인" onclick="login_go(this.form)"/>
	</form>
	<%} %>
</body>
</html>