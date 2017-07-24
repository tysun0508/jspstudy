<%@page import="com.hb.mybatis.VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 이전에 생성된 카트 호출 : scope="session"이므로 가능
     session.getAttrbute("cart");
 -->
<jsp:useBean id="cart" class="com.hb.mybatis.Cart" scope="session" />

<%List<VO> list = cart.getList(); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 보기</title>
</head>
<body>
<p><jsp:include page="shop.jsp" /></p><br /><br />
  <table width="600" border="1" align="center" 
        style="border-collapse:collapse;font-size:8pt" cellspacing="0" 
               cellpadding="4">
               <caption> :: 장바구니 내용 :: </caption>
               <thead>
		               <tr bgcolor="#dedede">
		                   <th>제품번호</th>
		                   <th width="25%">제품명</th>
		                   <th>단가</th>
		                   <th>수량</th>
		                   <th>금액</th>
		                   <th>삭제</th>
		               </tr>
			 </thead>
			 <tbody>
			 		<% if(list.size()<=0){%>
			 		  <tr><td colspan="6"><h2>장바구니가 비어있습니다.</h2></td></tr>		
			 		<%}else{
			 			for(VO k : list){%>	
				            <tr align="center">
				                <td><%=k.getP_num() %></td>
				                <td><%=k.getP_name() %></td>
				                <td>
				                    정가:<%=k.getP_price() %><br>
				                    <font color="red">
				                        세일가격:<%=k.getP_saleprice() %>
				                    </font>
				                </td>
				                <td>
				                  <%--  <%=k.getQuant() %> --%>
				                  <form action="editQuant.jsp" method="post">
				                  	<input type="text" name="su" value="<%=k.getQuant()%>" size="2" />
				                  	<input type="hidden" name="p_num" value="<%=k.getP_num() %>" />
				                  	<input type="submit" value="수정" />
				                  </form>
				                </td>
				                <td><%=k.getTotalprice() %> </td>
				                <td>
				                    <input type="button" value="삭제" 
				                    style="border:1 solid black;cursor:pointer"
				                    	onclick="javascript:location.href='delProduct.jsp?p_num=<%=k.getP_num()%>'">
				                </td>
				            </tr>
		                 <%}
			 	     } %>
			</tbody>
            <tfoot>
		            <tr>
		                <td colspan="5" align="right">총 결재액 : <%=cart.getTotal() %></td>
		                <td></td>
		            </tr>
            </tfoot>
        </table>
        
</body>
</html>