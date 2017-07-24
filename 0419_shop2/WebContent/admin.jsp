<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	table{border: 1px solid black; display: table;margin-left: auto;margin-right: auto; text-align: center; width: 500px;}
	table,th,td {border: 1px solid black; height: 30px}
</style>
<script type="text/javascript">
	function add_product(f) {
		f.action="newproduct.jsp";
		f.submit();
	}
</script>
</head>
<body>
<p><jsp:include page="shop.jsp"/></p>
<div>
		<form method="post" enctype="multipart/form-data">
		<table>
			<thead>
				<tr><th colspan="2"><h2>물품등록 페이지(관리자모드)</h2></th></tr>
			</thead>
			<tbody>
			   <tr>
			   		<td> 분류 </td>
			   		<td>
			   			 <input type="radio" name="category" value="com001"/> 컴퓨터
			   			 <input type="radio" name="category" value="ele002"/> 가전제품
			   			  <input type="radio" name="category" value="sp003"/> 스포츠
			   		</td>
			   </tr>
			   <tr>
			   		<td> 상품번호 </td>
			   		<td> <input type="password" name="p_num" /> </td>
			   </tr>
			   <tr>
			   		<td> 제품명 </td>
			   		<td> <input type="text" name="p_name" /> </td>
			   </tr>
			   <tr>
			   		<td> 판매사 </td>
			   		<td> <input type="text" name="p_company" /> </td>
			   </tr>
			   <tr>
			   		<td> 상품가격 </td>
			   		<td> <input type="text" name="p_price" /> </td>
			   </tr>
			   <tr>
			   		<td> 할인가 </td>
			   		<td> <input type="text" name="p_saleprice" /> </td>
			   </tr>
			   <tr>
			   		<td> 상품이미지s </td>
			   		<td> <input type="file" name="p_image_s" /> </td>
			   </tr>
			   <tr>
			   		<td> 상품이미지L </td>
			   		<td> <input type="file" name="p_image_l" /> </td>
			   </tr>
			   <tr>
			   		<td> 상품내용 </td>
			   		<td> <textarea rows="10" cols="40" name="p_content"></textarea> </td>
			   </tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
							<input type="button" value="상품등록" onclick="add_product(this.form)" />&nbsp; &nbsp;
				</tr>	
			</tfoot>
		</table>
	</form>
	</div>	
</body>
</html>