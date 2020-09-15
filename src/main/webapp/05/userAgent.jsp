<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String userAgent = request.getHeader("User-Agent");
	response.setContentType("text/html;charset=UTF-8");
	
	BrowserAttr ba = null;
	
	String res = "";
	
	//out.println(userAgent);
	
	if(userAgent.contains("Edg")){
		ba = BrowserAttr.EDG;
	}else if(userAgent.contains("Chrome")){
		ba = BrowserAttr.CHROME;
	}else if(userAgent.contains("Firefox")){
		ba = BrowserAttr.FIREFOX;
	}else if(userAgent.contains("Trident")) {
		ba = BrowserAttr.EXPLORER;
	}
	
	res = ba.getFormatter();
	
// 	enumClass ec = enumClass.EDG;
// 	out.println(ec.getName());
	
	out.println(res);

	
%>
<%!
	private interface Formatter{
		public String format();
	}

	private static enum BrowserAttr{
	
		EDG("Edg", () -> {
			return "";
		}),
		CHROME("Chrome", () -> {
			return "";
		}),
		FIREFOX("Firefox", () -> {
			return "";
		}),
		EXPLORER("Explorer", () -> {
			return "";
		});
		
		private String browserName;
		private String res;
		private Formatter formatter;
		
		private BrowserAttr(String browserName, Formatter formatter){
			this.browserName = browserName;
			this.formatter = formatter;
		}
		
		public String getBrowserName(){
			return this.browserName;
		}
		
		public String getFormatter(){
			return formatter.format();
		}

	}
	

	private static enum enumClass{
		EDG("엣지"),CHROM("크롬");
		
		private String name;
		
		private enumClass(){}
		
		private enumClass(String name){
			this.name = name;
		}
		
		public String getName(){
			return this.name;
		}
		
	}


%>