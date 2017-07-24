<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int nowPage = 1 ; // 현재 페이지
	int nowBlock = 1 ; // 현재 블록
	int totalRecord = 0 ; // 총 게시물의 수
	int numPerPage = 3 ; // 한페이지에 게시되는 게시물의 수
	int pagePerBlock = 2  ; // 블록당 표현되는 페이지의 수
    int totalPage = 0 ; // 전체 페이지의 수
    int totalBlock = 0 ; // 전체 블록의 수
    int begin = 0 ; // 시작번호
    int end = 0;    // 끝번호

    // 전체 게시물의 수
    totalRecord = DAO.getCount();
    
    // 전체 페이지의 수
   totalPage = totalRecord / numPerPage ;
   if( totalRecord % numPerPage  != 0 ) totalPage++;
   
  // 현재페이지 구하기
  // list.jsp는 처음 빼고 무조건 cPage를 받자
  // cPage는 현재 페이지를 뜻한다.
  // cPage가 null이면 그냥 nowPage = 1를 사용하다. 
    String cPage = request.getParameter("cPage");
   if(cPage != null){
	   nowPage = Integer.parseInt(cPage);
   }
   // 페이지에 따른 시작번호와 끝번호 구하기
    begin = (nowPage-1) * numPerPage + 1 ;
    end = (begin-1) + numPerPage;
    
    Map<String,Integer> map = new HashMap<>();
    map.put("begin", begin);
    map.put("end",end);
    
    List<VO> list = DAO.getList(map);
   
   %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr {
	text-align: center;
	padding: 4px 10px;
	background-color: #f6f6f6;
}

th {
	text-align: center;
	padding: 4px 10px;
	background-color: #B2CCFF;
}
a{text-decoration: none;}
</style>
<script type="text/javascript">
	function send_go() {
		location.href="write.jsp";
	}
</script>
</head>
<body>
	<div align="center">
		<h2>BBS 리스트</h2>
		<table style="width: 700px">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<% if(list.size()<=0){%>
				<tr><td colspan="5"><h2>등록된 자료가 없습니다.</h2></td></tr>	
			<%}else{
			     for(VO k:list){ %>
					<tr>
						<td><%= k.getSeq()%></td>
						<td align="left">
							<%for(int i=0;i<Integer.parseInt(k.getStep());i++){ %>
						         &nbsp;&nbsp;[Re]
						     <%}%>
							<a href="view.jsp?seq=<%=k.getSeq()%>">
								<%= k.getTitle()%>
							</a>
						</td>
						<td><%= k.getWriter()%></td>
						<td><%= k.getRegdate().substring(0,10)%></td>
						<td><%= k.getHit()%></td>
					</tr>
			     <%}%>
			<%}%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
					  <%
				     	// 현재 페이지를 이용해서 블록시작번호와 블록 끝번호 구하기
				     	 int beginPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
					     int endPage = beginPage + pagePerBlock -1 ;
					    // 주의 사항 
					     if(endPage> totalPage) endPage = totalPage ;
					    
					     // 이전버튼
					     if(beginPage > pagePerBlock){%>
					      <a href="list.jsp?cPage=<%=beginPage-pagePerBlock%>"><img src="img/but_prev.gif" /></a>
					     <%} 
					     // 번호
					     for(int i=beginPage; i <= endPage; i++){
					       // 현재 페이지는 링크 X, 다른 페이지는 링크
					    	if(i == nowPage){%>
					    		&nbsp;<%=i%>&nbsp;
					    	<%}else{%>
					    		&nbsp;<a href="list.jsp?cPage=<%=i%>"><%=i%></a>&nbsp;
					    	<%}
					     }
					     // 다음버튼
					     if(endPage < totalPage){%>
					      <a href="list.jsp?cPage=<%=beginPage+pagePerBlock%>">
					         <img src="img/but_next.gif" />
					     </a>
					     <%}%>
					</td>
					<td> 
						<img src="img/but_write.gif" onclick="send_go()">
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>