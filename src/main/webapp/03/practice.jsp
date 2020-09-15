<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/practice.jsp</title>
</head>
<body>
<a href = "<%=request.getContextPath() %>/01/printNumber.jsp"> 1. 브라우저에 1~10 까지의 숫자 출력 : /01/printNumber.jsp</a><br/>
<a href = "../02/factorial.jsp">2. 브라우저에 !10 연산의 결과를 !10=?? 와 같은 형식으로 출력 /02/factorial.jsp</a><br/>
<a href = "<%=request.getContextPath() %>/03/recursive.jsp">3. 재귀호출 구조를 이용하여 2번을 다시처리. /03/recursive.jsp</a><br/>
<a href = "../04/gugudan.jsp?minDan=2&maxDan=9">4. 2~9단을 구구단으로 출력, 승수는 1~9까지. table 태그를 사용하여 2차원 행렬 형태로 출력. /04/gugudan.jsp</a><br/>
<a href = "<%=request.getContextPath() %>/04/methodgugudan.jsp">5. 구구단의 곱하기 연산을 수행하는 메소드를 분리하여 처리. /04/methodgugudan.jsp</a><br/>
<a href = "../04/gugudanForm.jsp">6. /04/gugudanForm.jsp 를 만들고, 클라이언트가 선택한 범위내(minDan-maxDan)의 구구단이 처리되도록.</a>


</body>
</html>