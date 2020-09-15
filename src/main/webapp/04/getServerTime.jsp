<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.servlet01.CalculateServlet.MarshallingType"%>
<%@page import="kr.or.ddit.servlet01.CalculateServlet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String language = request.getParameter("language");

	String accept = request.getHeader("Accept");
	String acceptLanguage = request.getHeader("Accept-Language");
	Locale locale = request.getLocale();
	
	if(language != null){
		locale = Locale.forLanguageTag(language);
	}
	//System.out.println(locale.toString());
	Date date = new Date(Calendar.THURSDAY);
	DateFormatSymbols dfs = new DateFormatSymbols(locale);
	SimpleDateFormat format = new SimpleDateFormat("E", dfs);
	String text = format.format(date);
	
	String serverDate = date.toString();
	
	Map<String, Object> targetMap = new LinkedHashMap<>();
	targetMap.put("date", serverDate);
	
	String mime = "";
	
	if(accept.contains("json")){
		response.setContentType("application/json;charset=UTF-8");
		out.println("{\"date\":\""+text+"\"}");
	}else if(accept.contains("xml")){
		response.setContentType("application/xml;charset=UTF-8");
		out.println("<date>"+text+"</date>");
	}else if(accept.contains("html")){
		response.setContentType("text/html;charset=UTF-8");
		out.println("<h4>"+text+"</h4>");
	}

 
%>
