<%@page import="DBPKG.DAO"%>
<%@page import="DBPKG.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");   
  String custNum = request.getParameter("custNum");
  MemberVO mvo = DAO.getInstance().getModify(custNum);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원목록수정</title>
        <style type="text/css">
            /* 본문 */            
            #content{ font-family : 맑은 고딕; height: 650px;} 
            h2{text-align: center; font-family : 맑은 고딕;}
            #table{ text-align: center; margin: auto; }
            
        </style>
        
        <script type="text/javascript">
        	function modify_go(f) {
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
				f.action = "modify_ok.jsp";
				f.submit();				
			}
        
        
        </script>
    </head>
    
    <body>
    <jsp:include page="menu.jsp"/>
    <div id='content'>   
        <h2>회원정보 수정</h2>        
        <form method="post">
            <table id="table">
                <tbody>                    
                    <tr>                
                        <td>회원번호(자동발생)</td>
                        <td><input type="text" name="custno" value="<%=mvo.getCustno()%>" readonly="readonly" /></td>                
                    </tr>
                    <tr>
                        <td>회원성명</td>
                        <td><input type="text" name="custname" value="<%=mvo.getCustname()%>" /></td>                      
                    </tr>
                    <tr>
                        <td>회원전화</td>
                        <td><input type="text" name="phone" value="<%=mvo.getPhone()%>"/></td>                      
                    </tr>
                     <tr>
                        <td>회원주소</td>
                        <td><input type="text" name="address" value="<%=mvo.getAddress()%>" /></td>                      
                    </tr>
                     <tr>                        
                        <td>가입일자</td>
                        <td><input type="text" name="joindate" value="<%=mvo.getJoindate()/* .substring(0, 10) */%>" readonly="readonly" disabled="disabled"/></td>                      
                    </tr>
                    <tr>
                        <td>고객등급(A:VIP,B:일반,C:직원)</td>
                        <td><input type="text" name="grade" value="<%=mvo.getGrade()%>" /></td>                          
                    </tr>
                     <tr>
                        <td>도시코드</td>
                        <td><input type="text" name="city" value="<%=mvo.getCity()%>" /></td>                          
                    </tr>            
                </tbody>      
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <input type="button" value="수정" onclick="modify_go(this.form)" />
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