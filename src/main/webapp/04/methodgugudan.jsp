<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	private final String PATTERN = "<td>%d X %d = %d</td>";
	private	String getGugudanExpr(int j, int i){
		return String.format(PATTERN , j,i,i*j);
	
	
	
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>5. 구구단의 곱하기 연산을 수행하는 메소드를 분리하여 처리.</h2>
<table border="1">
<%
	for(int i = 1; i <= 9; i++){
	out.println("<tr>");
		for(int j = 2; j <= 9; j++){
		out.println(getGugudanExpr(j,i));
		}
	out.println("<tr>");
	}
%>
	
</table>

</body>
</html>