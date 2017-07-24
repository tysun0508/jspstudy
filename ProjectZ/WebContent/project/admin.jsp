<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전용페이지</title>
<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.flower {
    width: 15%;
    border-radius: 20%;
}

.container {
    padding: 5px;
}

span.pwd {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 200px) {
    span.pwd {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
	    //로그인
	    $("#login").click(function() {
	       $.ajax({
	          url : "/ProjectZ/MyController01",
	          type : "get",
	          data : $("#myform").serialize(),//파라미터값 직렬전송
	          dataType : "text",
	          success : function(data) {
	             //var datatrim = data.trim();
	             //alert(datatrim);
	             if(data == "y"){
	                 alert("관리자로 로그인하셨습니다")
	            	 location.href="main.jsp";
	             }else{
					alert("로그인실패");
	             }
	          },
	          error : function(data) {
	             alert("실패");
	          }
	       });
	    });
	 });
</script>
</head>
<body>

<h2>관리자 로그인</h2>

<form id="myform" name="myform" method="post">
  <div class="imgcontainer">
    <img src="../img/flower.gif" class="flower">
  </div>

  <div class="container">
    <label><b>아이디</b></label>
    <input type="text" placeholder="Enter Username" name="id" id="id">

    <label><b>비밀번호</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" id="pwd">
        
    <button type="button" value="로그인" name="login" id="login" >Login</button>
    <input type="checkbox" checked="checked"> Remember me
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <a href="main.jsp"><button type="button" class="cancelbtn">Cancel</button></a>
  </div>
</form>

</body>
</html>