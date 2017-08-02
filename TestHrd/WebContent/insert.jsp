<%@page import="DBPKG.DAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");   
  String custNum = DAO.getInstance().getCustNum();
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원등록</title>
        <style type="text/css">
            /* 본문 */            
            #content{ font-family : 맑은 고딕; height: 650px;} 
            h2{text-align: center; font-family : 맑은 고딕;}
            #table{ text-align: center; margin: auto; }
            
        </style>
        
        <script type="text/javascript">
        	function insert_go(f) {
				if(f.custname.value==""){
					alert("회원성명이 입력되지 않았습니다.");
					f.custname.focus();
					return;
				}
				if(f.phone.value==""){
					alert("회원전화가 입력되지 않았습니다.");
					f.phone.focus();
					return;
				}
				if(f.address.value==""){
					alert("회원주소가 입력되지 않았습니다.");
					f.address.focus();
					return;
				}
				if(f.grade.value==""){
					alert("고객등급이 입력되지 않았습니다.");
					f.grade.focus();
					return;
				}
				if(f.city.value==""){
					alert("도시코드가 입력되지 않았습니다.");
					f.city.focus();
					return;
				}
				
				f.action = "insert_ok.jsp";
				f.submit();				
			}
        
        
        </script>
    </head>
    
    <body>
    <jsp:include page="menu.jsp"/>
    <div id='content'>   
        <h2>홈쇼핑 회원 등록</h2>
        <form method="post">
            <table id="table">
                <tbody>
                    <tr>                
                        <td>회원번호(자동발생)</td>
                        <td><input type="text" name="custno" value="<%=custNum%>" readonly="readonly" disabled="disabled" /></td>                
                    </tr>
                    <tr>
                        <td>회원성명</td>
                        <td><input type="text" name="custname" /></td>                      
                    </tr>
                    <tr>
                        <td>회원전화</td>
                        <td><input type="text" name="phone" /></td>                      
                    </tr>
                     <tr>
                        <td>회원주소</td>
                        <td><input type="text" name="address" /></td>                      
                    </tr>
                     <tr>
                        <%
                            Calendar cal = Calendar.getInstance();
                            SimpleDateFormat d_format = new SimpleDateFormat("yyyyMMdd");
                            String date = d_format.format(cal.getTime()); 
                        %>
                        <td>가입일자</td>
                        <td><input type="text" name="joindate" value="<%=date%>" readonly="readonly" disabled="disabled"/></td>                      
                    </tr>
                    <tr>
                        <td>고객등급(A:VIP,B:일반,C:직원)</td>
                        <td><input type="text" name="grade" /></td>                          
                    </tr>
                     <tr>
                        <td>도시코드</td>
                        <td><input type="text" name="city" /></td>                          
                    </tr>            
                </tbody>      
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <input type="button" value="등록" onclick="insert_go(this.form)" />
                            <input type="button" value="조회" onclick="location.href='list.jsp'" />
                        </td>
                    </tr>
                </tfoot>    
            </table>
           </form>
       </div> 
       <jsp:include page="footer.jsp"/>
    </body>
</html>