<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<input type="button" value ="한글" class = "languageType" id = "<%= Locale.KOREAN %>"/>
	<input type="button" value ="영어" class = "languageType" id = "<%= Locale.ENGLISH %>"/>
	<select name = "languageType">
		<option value>언어 선택</option>
		<%
			Locale[] locales = Locale.getAvailableLocales();
			String pattern = "<option value = '%s'>%s(%s)</option>";
			System.out.println("???"+locales[0].toString());
			for(Locale locale : locales){
				String display = locale.getDisplayLanguage(locale);
				if(StringUtils.isBlank(display)){
					continue;
				}
				out.println(String.format(pattern, locale.toLanguageTag(), display, locale.getDisplayCountry()));
			}
		
		%>
	</select>
	<div id = "timeArea">
	
	</div>
	<script type="text/javascript">
		var timeArea = $("#timeArea");
		function ajaxTest(data) {
			$.ajax({
				url : "getServerTime.jsp",
				data : data,
				dataType : "json", // html, json, xml
				success : function(resp) {
					timeArea.html(resp.date); // json
	
	// 				let date = $(resp).find("date"); // xml, DOM객체 생성필요
	// 				timeArea.html(date);
	
	// 				timeArea.html(resp); // html
					
				},
				error : function(errorResp) {
					
				}
			});
		}
		
		$("[name = 'languageType']").on("change", function() {
			let data = {};
			let value = $(this).val();
			console.log(value);
			data.language = value
			
			ajaxTest(data);
			
		});
		
		$(".languageType").on("click", function() {
			let data = {};
			let tagId =  $(this).prop("id");
			data.language = tagId;
			
			ajaxTest(data);
		});
	
	</script>
</body>
</html>








