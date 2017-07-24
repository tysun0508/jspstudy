<%@page import="com.hb.mybatis.BVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% BVO bvo = (BVO)session.getAttribute("bvo"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function delete_go() {
		if(document.form.pwd.value=="<%=bvo.getPwd()%>"){  
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				document.form.action ="delete_ok.jsp";
				document.form.submit();
			}else{
				history.go(-1);
			}
		}else{
			alert("비번 틀림");
			document.form.pwd.value="";
			document.form.pwd.focus();
			return;
		}
	}
</script>
</head>
<body>
	<form name="form">
		<input type="password" name="pwd" />
		<input type="button" value="삭제" onclick="delete_go()"/>
		<input type="hidden" name="b_idx" value="<%=bvo.getB_idx()%>" />
	</form>
</body>
</html>