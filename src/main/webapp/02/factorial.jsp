<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/02/factorial.jsp</title>

</head>
<body>
	<h2>2. 브라우저에 !10 연산의 결과를 !10=?? 와 같은 형식으로 출력</h2>
	<%	
		
		int res = 1;
		for(int i = 1; i <=10; i++){
			res *= i;
		}
	%>
	<%= String.format("!10 = %d", res) %>
</body>
</html>