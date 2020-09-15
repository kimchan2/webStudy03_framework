<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bloodType.jsp</title>
<script type="text/javascript" src = "<%= request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		var resultDiv = $("#resultDiv");
		$("#bloodSelect").on("change", function() {
			let key = $(this).find("option:selected").val();
			let data = {};
			data["name"] = key; 
			$.ajax({
				url : "<%= request.getContextPath() %>/getCharacter.do",
				data : data,
				dataType : "html",
				success : function(resp) {
					resultDiv.html(resp);
				},
				error : function() {

				}
			});
			
			
		})
	})


</script>
</head>
<body>
	<select id = "bloodSelect">
		<%
			Map<String, String[]> bloodMap = (Map<String, String[]>) getServletContext().getAttribute("bloodMap");
			
			String pattern = "<option value = '%s'>%s</option>";
			String res = null;
			for(Entry<String, String[]> entry : bloodMap.entrySet()){
				res = String.format(pattern, entry.getKey(), entry.getValue()[0]);
				out.println(res);
			}
		%>
	
	</select>
	<div id="resultDiv"></div>
</body>
</html>













