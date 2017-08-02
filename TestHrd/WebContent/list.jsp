<%@page import="DBPKG.DAO"%>
<%@page import="DBPKG.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>리스트</title>
        <style type="text/css">
            /* 본문 */            
            #content{ font-family : 맑은 고딕; height: 650px;} 
           
            h2{text-align: center; font-family : 맑은 고딕;}            
            table, td {border: 1px solid black; text-align: center; margin: auto;}
            
             /* Link */   
            #custId_atag{text-decoration: none; color: black; font-weight:bold; font-family : 맑은 고딕;}            
            #custId_atag.visited{ color : red;} 
            #custId_atag:hover{color : orange; }   
        
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>      
       
        <div id="content">
            <h2>회원목록조회/수정</h2>
            <table style="widows: 100%">
                <thead>
                    <tr>
                        <td style="width: 80px;">회원번호</td>
                        <td style="width: 50px;">회원성명</td>
                        <td style="width: 200px;">전화번호</td>
                        <td style="width: 200px;">주소</td>
                        <td style="width: 200px;">가입일자</td>
                        <td style="width: 80px;">고객등급</td>
                        <td style="width: 80px;">거주지역</td>               
                    </tr>
                </thead>
                <tbody>
                    <% List<MemberVO> list = DAO.getInstance().getList(); %>
                    <%if(list.size()>0){%>
                    
                        <%for(MemberVO k : list){%>
                        <tr>
                             <td><a id="custId_atag" href="modify.jsp?custNum=<%=k.getCustno()%>"><%=k.getCustno()%></a></td>    
                             <td><%=k.getCustname()%></td>  
                             <td><%=k.getPhone()%></td> 
                             <td><%=k.getAddress()%></td>                          
                             <td><%=k.getJoindate().substring(0, 10)%></td> 
                             <td><%=k.getGrade()%></td> 
                             <td><%=k.getCity() %></td> 
                        </tr>                         
                        <%}%>          
                    
                    <%}else{ %> 
                        <tr>
                            <td colspan="6"> 자료 없음 </td>
                        </tr>
                    <%}%>                
               </tbody>            
            </table>  
        </div>
        
         <jsp:include page="footer.jsp"/>
        
    </body>
</html>