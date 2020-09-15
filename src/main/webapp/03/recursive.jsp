<%@page import="java.util.Objects"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="sun.swing.StringUIClientPropertyKey"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<%!
private long fact(int n, StringBuffer expr) {
	if(n  <= 0){
		throw new IllegalArgumentException();
	}else if (n == 1){
		expr.append(n);
		return n;
	}else{
		expr.append(n + " * ");
		return fact(n-1, expr) * n; // 1*...*9*10
	}
}
%>
<%
	String accept = request.getHeader("Accept");
	String mime = "text/html;charset=UTF-8";
	if(accept.contains("json")){
		mime = "application/json;charset=UTF-8";
	}
	response.setContentType(mime);
	String param = request.getParameter("op");
	String resStr = "";
	int num = 0;
	if(StringUtils.isNotBlank(param)&&StringUtils.isNumeric(param)){
		num = Integer.parseInt(param);
		StringBuffer expr = new StringBuffer();
		long res = fact(num, expr);
		resStr = String.format("!%d = %s = %d", num, expr, res);
%>
	{
		"data" : "<%= resStr %>"
	}
<%
	//out.write(resStr);
}
if(num == 0){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/03/recursive.jsp</title>
<script type="text/javascript" src ="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var result = $("#result");
		var form = $("form:nth(0)").on("submit", function(event) {
			event.preventDefault();
			
			let inputs = $(this).find(":input");
			let url = this.action?this.action:"";
			let data = {};
			let method = this.method?this.method:"get";
			inputs.each(function(index, tag) {
				let name = tag.name
				if(name){
					let value = tag.value
					data[name] = value;
				}
			})
			
			$.ajax({
				
				url : url,
				data : data,
				method : method,
				dataType : 'json', // request header : Accept, reaponse header : Content-Type
				success : function(resp) {
					result.html(resp.data);
				},
				error : function(errorResp) {
					console.log(errorResp);
				}
				
			});
			return false;
		});
	})
 
</script>
</head>
<body>
<h2>3. 재귀호출 구조를 이용하여 2번을 다시처리.</h2>

<%-- <%= String.format("!%d = %s = %d", num, expr, res) %> --%>

<form>
	<input type = "text" name = "op" />
	<button type = "submit">전송</button>
</form>
<br/>
<div id="result">

</div>
</body>
</html>
<% } %>



















