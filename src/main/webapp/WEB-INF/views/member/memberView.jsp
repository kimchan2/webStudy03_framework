<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   MemberVO member =(MemberVO) request.getAttribute("member");
%>
<table class="table table-bordered">
   <tr>
      <td colspan="50">아이디</td>
      <td colspan="50"><%=member.getMem_id() %></td>
   </tr>            
   <tr>             
      <td colspan="50">이름</td>
      <td colspan="50"><%=member.getMem_name() %></td>
   </tr>           
   <tr>            
      <td colspan="50">주민번호</td>
      <td colspan="50"><%=member.getMem_regno1() %></td>
   </tr>           
   <tr>            
      <td colspan="50">뒷자리</td>
      <td colspan="50"><%=member.getMem_regno2() %></td>
   </tr>          
   <tr>           
      <td colspan="50">생일</td>
      <td colspan="50"><%=member.getMem_bir() %></td>
   </tr>          
   <tr>           
      <td colspan="50">핸드폰</td>
      <td colspan="50"><%=member.getMem_hp() %></td>
   </tr>           
   <tr>            
      <td colspan="50">직업</td>
      <td colspan="50"><%=member.getMem_job() %></td>
   </tr>        
   <tr>         
      <td colspan="50">취미</td>
      <td colspan="50"><%=member.getMem_like() %></td>
   </tr>        
   <tr>         
      <td colspan="50">이메일</td>
      <td colspan="50"><%=member.getMem_mail() %></td>
   </tr>
   <tr>
      <th>구매목록</th>
      <td>
         <table>
            <thead>
               <tr>
                  <th>상품코드</th>
                  <th>상품명</th>
                  <th>구매가</th>
                  <th>판매가</th>
                  <th>마일리지</th>
               </tr>
            </thead>      
            <tbody>
               <%
                  List<ProdVO> prodList = member.getProdList();
                  for(ProdVO prodVO : prodList){
                     %>
                     <tr>
                     <td><%=prodVO.getProd_id() %></td>
                     <td><a href="<%=request.getContextPath() %>/prod/prodView.do?what=<%=prodVO.getProd_id()%>">
                     <%=prodVO.getProd_name() %></a></td>
                     <td><%=prodVO.getProd_cost() %></td>
                     <td><%=prodVO.getProd_price() %></td>
                     <td><%=prodVO.getProd_mileage() %></td>
                     </tr>
                     <%
                  }
               %>
            </tbody>   
         </table>
      </td>
   </tr>
</table>
