<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/04/gugudan.jsp</title>
</head>
<body>
	<table border = "1">
		<%
			String minDanStr = request.getParameter("minDan");
			int minDan = 2;
			if(StringUtils.isNumeric(minDanStr)){
				minDan = Integer.parseInt(minDanStr);
			}
			String maxDanStr = request.getParameter("maxDan");
			int maxDan = 9;
			if(StringUtils.isNumeric(maxDanStr)){
				maxDan = Integer.parseInt(maxDanStr);
			}
			String pattern = "<td>%d X %d = %d</td>";
			for(int i = 1; i <= 9; i++){
			out.println("<tr>");
				for(int j = minDan; j <= maxDan; j++){
				out.println( String.format(pattern, j,i,i*j));
				}
			out.println("<tr>");
			}
		%>
		
		
	</table>
</body>
</html>