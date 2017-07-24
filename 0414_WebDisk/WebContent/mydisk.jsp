<%@page import="com.hb.mybatis.VO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 로그인 검사
	Boolean chk = false;
	chk = (Boolean) session.getAttribute("login_chk");
	if(chk == null){%>
	<script>
		alert("로그인 하고 오세요");
		location.href="index.jsp";
	</script>		
	<%}else{
		VO mvo = (VO)session.getAttribute("mvo");	
	%>
	<%-- 용량을 구하기 위한 선언부 --%>
	<%!
	    int totalSize = 500*1024*1024 ; // 개인당 총용량 (500MB)
	    int userSize ; // 사용한 용량
	    String cPath ; // **현재 위치
	    
	    // 개인 사용량 계산 하는 메소드
	    public int userSizeCount(File dir){
	    	int size = 0 ;
	    	// 매개변수 dir의 모든 파일과 폴더를 배열로 저장한다.
	    	 File[] list = dir.listFiles();
	    	 for(int i=0; i<list.length; i++){
				if(list[i].isFile()){ // 파일이냐? => 용량이 존재
					size += list[i].length();
				}else{ // 폴더이냐? =>용량이 존재 하지 않음
					// 재귀함수(자기가 자기자신을 호출)	
					size += userSizeCount(list[i]);
				}
	    	 }
	    	return size;
	    }
	%>
	<%
	  // 맨처음 페이지를 들어오면 파라미터값에 cPath 없으므로 null  
		cPath = request.getParameter("cPath");
	    String path = null;
	    if(cPath == null){
			// 로그인 후 처음 
			path = getServletContext().getRealPath("/member/"+mvo.getId());
			userSize = userSizeCount(new File(path));
			cPath = mvo.getId(); // 최상위 폴더
	    }else{
	    	path = getServletContext().getRealPath("/member/"+cPath);
			userSize = userSizeCount(new File(path));
	    }
	    // 폴더 안에 또 다른 폴더를 선택 했을 때 사용하는 경로
	    File select_file = new File(path);
	%>	
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>MyDisk 페이지</title>
	<style type="text/css">
	table,div {
		width: 600px;
		border: 1px solid skyblue;
		border-collapse: collapse;
		text-align: center;
	}
	
	th,td {
		border: 1px solid skyblue;
	}
	
	.dt {
		background-color: #dedede;
		width: 25%;
		text-align: center;
	}
	
	li.item {
		float: left;
		width: 160px;
		margin-bottom: 20px;
	}
	
	hr {
		clear: both;
	}
	
	ul.menu {
		list-style: none;
	}
	
	li a {
		display: block;
		font-size: 22px;
		line-height: 35px;
		margin-right: 10px;
		color: #00b3dc;
		font-weight: bold;
		padding: 0px 8px;
		border: 2px solid #00b3dc;
		text-decoration: none;
		text-align: center;
	}
	</style>
	<script type="text/javascript">
		function newFolder() { // 폴더 만들기
			document.myForm.action="newfolder.jsp";
		    document.myForm.submit();
		}
		function newFile() { // 파일 업로드
			document.myForm.action="upload.jsp";
		    document.myForm.submit();
		}
		function delete_file(f) { // 파일삭제
			document.myForm.filename.value = f ;
			document.myForm.action="delete_file.jsp";
		    document.myForm.submit();
		}
		function down_go(f) { // 파일 다운로드
			document.myForm.filename.value = f ;
			document.myForm.action="download.jsp";
		    document.myForm.submit();
		}
		function remydisk_go(f) { // 폴더이름
			document.myForm.cPath.value ="<%=cPath%>/"+f ;
			document.myForm.action="mydisk.jsp";
		    document.myForm.submit();
		}
	</script>
	</head>
	<body>
		<h1>MyDisk Service</h1>
		<!-- 용량 표시하는 테이블  -->
		<table cellpadding="4" cellspacing="0">
			<tbody>
				<tr>
					<td class="dt">전체용량</td>
					<td> <%=totalSize/1024 %>KB</td>
				</tr>
				<tr>
					<td class="dt">사용용량</td>
					<td><%=userSize/1024 %>KB</td>
				</tr>
				<tr>
					<td class="dt">남은용량</td>
					<td><%=(totalSize - userSize)/1024 %>KB</td>
				</tr>
			</tbody>
		</table>
		<HR />
		<ul class="menu">
			<li class="item"><a onclick="newFolder()">폴더만들기</a></li>
			<li class="item"><a onclick="newFile()">파일올리기 </a></li>
		</ul>
		<hr />
		현재위치 : <%=cPath %>
		<p />
		<!-- 현재 위치의 폴더 내용을 출력하는 테이블 -->
		<table>
			<thead>
				<tr>
					<td class="dt">구분</td>
					<td class="dt">폴더 및 파일명</td>
					<td class="dt">삭제여부</td>
				</tr>
			</thead>
			<tbody>
				<%
					// 현재위치가 id와 같다면 최상위 폴더
					// id와 같지 않다면 (ex) hong/a1/aa1 상위폴더로 이동 가능
					if(! cPath.equals(mvo.getId())){
						String up_path = cPath.substring(0,cPath.lastIndexOf("/"));
				%>
				 <tr>
				 	<td><img src ="images/go_up.jpg"></td>
				 	<td colspan="2"><a href="mydisk.jsp?cPath=<%=up_path %>">상위로..</a></td>
				 </tr>
				<%}
				File[] s_list = select_file.listFiles();
				for(int i=0; i<s_list.length; i++){%>
				<tr>
				    <%-- 파일과 폴더 그림 선택 --%>
					<td>
						<% if(s_list[i].isFile()){%>
							<img src="images/file.jpg">		
						<%}else{%>
							<img src="images/folder.jpg">	
						<%}%>	
					</td>
					<%--파일이면 다운로드, 폴더이면 하위폴더로 이동 --%>	
					<td> 
						<% if(s_list[i].isFile()){%>
							<a onclick="down_go('<%=s_list[i].getName() %>')"><%=s_list[i].getName() %></a>		
						<%}else{%>
							<a onclick="remydisk_go('<%=s_list[i].getName() %>')"><%=s_list[i].getName() %></a>	
						<%}%>	
					</td>	
					<%-- 삭제 유무 선택 --%>
					<td><%--파일은 삭제, 폴더는 비어 있을때만 삭제 --%>
						<% if(s_list[i].isFile()){%>
							  <button onclick="delete_file('<%=s_list[i].getName() %>')">파일삭제</button>
						<%}else{
						       File[] ch = s_list[i].listFiles();
								if(ch.length==0){%>						    
						    		<button onclick="delete_file('<%=s_list[i].getName() %>')">폴더삭제</button>
						    <% }
						 }%>	
					</td>	
				</tr>
				<%}%>	
			</tbody>
		</table>
		<%-- 항상 가지고 다니는 파라미터값들 --%>
		<form method="get" name="myForm">
			<input type="hidden" name="cPath" value="<%=cPath %>" />
			<input type="hidden" name="filename"  />
		</form>
<%} %>
</body>
</html>







