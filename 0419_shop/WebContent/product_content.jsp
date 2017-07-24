<%@page import="java.util.List"%>
<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String prod_num = request.getParameter("prod_num");
    // 방법1 ; DB 사용
    // VO vo = DAO.getOneList(prod_num);
   
    // 방법2 : DB 사용X
    //  List<VO> list = (List<VO>)session.getAttribute("list");
    // VO vo = null;
    // for(VO k : list){
    //	 if(k.getP_num().equals(prod_num)){
    //		 vo = k;
    //		 break;
    //	 }
    //  }
    
    // 방법3 : DB 사용X
    VO vo = DAO.findProduct(prod_num);
     
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p><jsp:include page="shop.jsp" /></p><br /><br />
<table align="center" width="600" border="1" 
    style="border-collapse:collapse;font-size:8pt" bordercolor="navy"
    cellpadding="4" cellspacing="0">
   

    <tr>
        <td width="40%">제품Category</td>
        <td width="60%"><%=vo.getCategory() %> </th>
    </tr>
    <tr>
        <td width="40%">제품번호</td>
        <td width="60%"><%=vo.getP_num() %></th>
    </tr>
    <tr>
        <td width="40%">제품이름</td>
        <td width="60%"><%=vo.getP_name() %></th>
    </tr>
    <tr>
        <td width="40%">제품판매사</td>
        <td width="60%"><%=vo.getP_company() %></th>
    </tr>
    <tr>
        <td width="40%">제품가격</td>
        <td width="60%">시중가 : <%=vo.getP_price() %>
               <font color="red">(할인가:<%=vo.getP_saleprice() %>  )</font></td>
    </tr>
    <tr>
        <td width="40%">제품설명</td>
        <td width="60%"><%=vo.getP_content() %></td>
    </tr>
    <tr>
        <td colspan="2" align="center">
        	<img src ="images/<%=vo.getP_image_l()%>">
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input type="button" value="장바구니에 담기" 
            onclick="javascript:location.href='addProduct.jsp?p_num=<%=vo.getP_num()%>'"/>
            <input type="button" value="장바구니 보기" 
            onclick="javascript:location.href='cartList.jsp'"/>
        </td>
    </tr>    
</table>
</body>
</html>