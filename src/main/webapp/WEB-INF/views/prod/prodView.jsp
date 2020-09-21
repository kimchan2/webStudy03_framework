<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%ProdVO prodVO = (ProdVO)request.getAttribute("prodVO"); %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/includee/preScript.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 한건의 상품과 해당 상품을 구매한 구매자 목록을 함께 UI 구성. -->
<table class="table">
	<tr>
		<th>구매가</th>
		<td><%=prodVO.getProd_cost() %></td>
	</tr>
</table>
</body>
</html>