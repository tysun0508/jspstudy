<%@page import="com.hb.mybatis.Paging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.BVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th,#bbs table td {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
		
</style>
<script type="text/javascript">
	function send_go() {
		location.href="write.jsp";
	}
</script>
</head>
<body>
   <%
       Paging pvo = new Paging();     
      // 1. 전체 게시물의 수 구하기
       pvo.setTotalRecord(DAO.getTotalCount()) ;
       pvo.setTotalPage();
       
      // 3. 현재 페이지 구하기
      // list.jsp는 처음 빼고 무조건 cPage를 받자
      // cPage는 현재 페이지를 뜻한다.
      // cPage가 null이면 그냥 nowPage = 1를 사용하다.
        String cPage = request.getParameter("cPage");
        if(cPage != null){
        	pvo.setNowPage(Integer.parseInt(cPage));
        }
        
        // 4. 현재 페이지에 따른 시작 번호와 끝번호를 구하자
        pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
        pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());

        // 5. Map 만들어서 DB 처리하기
        Map<String,Integer> map = new HashMap<>();
        map.put("begin", pvo.getBegin());
        map.put("end", pvo.getEnd());
        
        // 6. 현재 페이지를 이용한 블록의 시작번호와 끝번호
		 pvo.setBeginPage((int)(((pvo.getNowPage()-1)/(pvo.getPagePerBlock())*pvo.getPagePerBlock()+1)));
    	 pvo.setEndPage(pvo.getBeginPage()+pvo.getPagePerBlock()-1);		   	 	      
    	
    	 // 주의사항 : endPage가 totalPage보다 클수가 있다.
	 	  if(pvo.getEndPage() > pvo.getTotalPage())
	 		  pvo.setEndPage(pvo.getTotalPage())  ;
    	 
    	 List<BVO> list = DAO.getList(map);
    	 
         pageContext.setAttribute("list", list);
         pageContext.setAttribute("pvo", pvo);
         pageContext.setAttribute("cPage", cPage);
   %>
	<div id="bbs" align="center">
		<table summary="게시판 목록">
			<caption>게시판 목록</caption>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			<tbody>
			    <c:choose>
			    	<c:when test="${empty  list}">
			    		<tr>
				   	 		<td colspan="5"><h2>자료가 존재하지 않습니다.</h2></td>
				   		</tr>
			    	</c:when>
			        <c:otherwise>
			        	<c:forEach var="k" items="${list}" varStatus="vs">
			        		<tr>
								<td>${vs.count}</td>
								<td><a href="view.jsp?b_idx=${k.b_idx }">${k.subject }</a></td>
								<td>${k.writer }</td>
								<td>${k.write_date.substring(0,10)}</td>
								<td>${k.hit}</td>
							</tr>	
			        	</c:forEach>
			        </c:otherwise>
			    </c:choose>
			</tbody>
			<tfoot>
				<tr>
				   <td colspan="4">
				  	 	<ol class="paging">
				   	 	  <c:choose>
				   	 	  		<c:when test="${pvo.beginPage <= pvo.pagePerBlock}">
				   	 	  			<li class="disable">이전으로</li>
				   	 	  		</c:when>
				   	 	  		<c:otherwise>
				   	 	  			<li><a href="list.jsp?cPage=${pvo.beginPage - pvo.pagePerBlock}">이전으로</a></li>
				   	 	  		</c:otherwise>
				   	 	  </c:choose>
				    	  <c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage}"
								step="1">
								<c:choose>
									<c:when test="${k==pvo.nowPage}">
										<li class="now">${k}</li>
									</c:when>
									<c:otherwise>
										<li><a href="list.jsp?cPage=${k }">${k }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
				   	 	  <c:choose>
				   	 	  		<c:when test="${pvo.endPage >= pvo.totalPage}">
				   	 	  			<li class="disable">다음으로</li>
				   	 	  		</c:when>
				   	 	  		<c:otherwise>
				   	 	  			<li><a href="list.jsp?cPage=${pvo.beginPage + pvo.pagePerBlock}">다음으로</a></li>
				   	 	  		</c:otherwise>
				   	 	  </c:choose>	
				   	 	</ol>
				   	 </td>
				   	 <td><input type="button" value="글쓰기" onclick="send_go()" /> </td> 
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>




















