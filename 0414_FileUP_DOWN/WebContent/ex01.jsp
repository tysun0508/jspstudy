
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<script type="text/javascript">
	function f_up(f) {
		f.action="ex02.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<%-- 파일 업로드 : cos.jar(servlets.com) 다운로드
		1. 반드시 form method = "post" enctype="multipart/form-data" 설정
	
	 --%>
	 <form method="post" enctype="multipart/form-data">
	 	<p>올린 사람 : <input type="text" name="name"/></p>
	 	<p>파일 : <input type="file" name="f_name"/></p>
	 	<input type="button" value="업로드" onclick="f_up(this.form)"/>
	 </form>
</body>
</html>