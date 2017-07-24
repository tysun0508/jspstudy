<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String category =request.getParameter("category");
    if(category == null || category=="") category = "ele002" ;
    
    List<VO> list = DAO.getList(category);
    // 가지고 온 정보를  session에 저장해서 
    // 상세 보기 할때 꺼내서 사용한다.
    session.setAttribute("list", list);
%>    
<title>제품 설명</title>
</head>
<body>
<p><jsp:include page="shop.jsp" /></p><br /><br />
<table align="center" width="600" border="1" 
 style="border-collapse:collapse;font-size:8pt" bordercolor="navy"  
 cellpadding="4" cellspacing="0">
 	<thead>
	    <tr bgcolor="#dedede">
	        <th width="10%">제품번호</th>
	        <th width="10%">이미지</th>
	        <th width="35%">제품명</th>
	        <th width="20%">제품가격</th>
	        <th width="25%">비고</th>
	    </tr>
   </thead>
   <tbody>
   	<% if(list.size()<=0){%>
   		<tr><td colspan="5" align="center"><h2>등록된 제품이 존재하지 않습니다.</h2></td></tr>	
   	<%}else{
   	     for(VO k :list){%>
	    <tr align="center">
	        <td><%=k.getP_num() %></td>
	        <td><img src="images/<%=k.getP_image_s()%>" width="100" height="95"></td>
	        <td><a href="product_content.jsp?prod_num=<%=k.getP_num()%>">
	            	<%=k.getP_name() %>
	            </a>
	        </td>
	        <td>
	            할인가 : <%=k.getP_saleprice() %>원<br>
	            <font color="red">(할인률 : <%=k.getPercent() %> %)</font>
	        </td>
	        <td>
	            시중 가격 : <%=k.getP_price() %> 원
	        </td>
	    </tr>
	    <%} 
	    } %>
   </tbody>
</table>
</body>
</html>