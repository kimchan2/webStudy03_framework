<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/01/printNumber.jsp</title>
</head>
<body>
<h2>1. 브라우저에 1~10 까지의 숫자 출력 </h2>
<%
	int res = 0;
	for(int i = 0; i < 10; i++){
%>
		<%= String.format("%d %s", i, "<br/>") %>
<%		
	}

%>

</body>
</html>