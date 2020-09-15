<%@page import="java.time.MonthDay"%>
<%@page import="java.util.TimeZone"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.time.Month"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.temporal.WeekFields"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		margin-left: auto;
		margin-right: auto;
	}
	td{
		width : 70px;
		height : 30px;
		text-align: center;
		
	}
	#headerDiv{
		text-align: center;
	
	}
	#bodyDiv{
		text-align: center;
	}
</style>
</head>
<body>
<%
	Locale lc = Locale.KOREA;
	Calendar calendar = Calendar.getInstance();
	int nYear = calendar.get(Calendar.YEAR);
	int nMonth = calendar.get(Calendar.MONTH);
	
	int startDay;
	int lastDay;
	
	Month mth =  Month.of(nMonth+1);
	
	DateFormatSymbols mdfs = new DateFormatSymbols(lc);
	String[] months = mdfs.getMonths();
	
%>
<div id="headerDiv">
<input type="button" value="◀" style="color: blue; font-size: 20" />
<span style="font-size: 25px; font-weight: bold;"><%= nYear+", "+ months[nMonth] %></span>
<input type="button" value="▶" style="color: blue; font-size: 20" />
</div>
<br/>
<div id = "bodyDiv">

year : <input type="text" name = "year" value="<%=nYear %>" />
month : 
<select>
<%

	String mthPattern = "<option value = '%s'>%s</optoin>";
	for(int i = 0; i < months.length; i++){
		out.println(String.format(mthPattern, i, months[i]));
	}

%>
</select>
<!-- locale -->
<select name = "selectLocale">
<%
	Locale[] locales = Locale.getAvailableLocales();
	String lcPattern = "<option value = '%s'>%s</option>";
	for(Locale locale : locales){
		String display = locale.getDisplayLanguage(locale);
		if(StringUtils.isBlank(display)){
			continue;
		}
		out.println(String.format(lcPattern, locale.toLanguageTag(), display));
	}

%>

</select>
<!-- TimeZone -->
<select>
<%
	String[] timeZone = TimeZone.getAvailableIDs();
	String tzPattern = "<option>%s</option>";
	for(int i = 0; i < timeZone.length; i++){
		out.println(String.format(tzPattern, timeZone[i]));
	}
%>
</select>
<br/>
<table border="1">
<thead>
	<tr>
		<%
		
		WeekFields wf = WeekFields.of(lc);
		DayOfWeek day = wf.getFirstDayOfWeek();
		
		String pattern = "<th>%s</th>";
		String language = Locale.KOREAN.toString();
		 for (int i = 0; i < DayOfWeek.values().length; i++) {
	         out.println(String.format(pattern, day.getDisplayName(TextStyle.SHORT, lc)));
	         day = day.plus(1);
	      }
		%>
	</tr>
</thead>
<tbody>
<%

	calendar.set(Calendar.YEAR, nYear);
	calendar.set(Calendar.MONTH, nMonth);
	calendar.set(Calendar.DATE, 1);
		
	startDay = calendar.get(Calendar.DAY_OF_WEEK);     
	lastDay = calendar.getActualMaximum(Calendar.DATE);
	
	String calPattern = "<td style = 'color : %s'>%s</td>";
	Date date = new Date();
	int cnt = 0;
	int inputDate = 1;
	
	for(int i = 0; inputDate <= lastDay; i++){
	String color = "black";
		if(cnt == 0){
			out.println("<tr>");
			color = "red";
		}else if(cnt == 6){
			color = "blue";
		}else{
			color = "black";
		}
		
		if(i<startDay-1){
			out.println(String.format(calPattern, color,""));
		}else{
			out.println(String.format(calPattern, color, inputDate));
			inputDate++;
		}
		cnt++;
		if(cnt == 7){
			out.println("</tr>");
			cnt = 0;
		}
	}
	while(cnt > 0 && cnt < 7){
	  out.println("<TD>&nbsp;</TD>");
	  cnt++;
	}
%>
</tbody>
</table>
</div>

</body>
</html>







