<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	private static enum BrowserType{
		TRIDENT("익스플로러"), EDG("엣지"), CHROME("크롬"), OTHER("기타등등");
		
		private String browserName;
		
		private BrowserType(String browserName){
			this.browserName = browserName;
		}
		
		public static String broserIdentify(String userAgent){
			BrowserType type = OTHER;
			
			userAgent = userAgent.toUpperCase();
			for(BrowserType tmp : values()){
				if(userAgent.contains(tmp.name())){
					type = tmp;
					break;
				}
			}
			
			return type.browserName;
			
		}
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>브라우저 식별!</h4>
<%

	String agent = request.getHeader("user-agent");
	String name = BrowserType.broserIdentify(agent);
	out.println(name);

%>
<pre>
<%	
	String pattern = "%s:%s\n";
	
	String characterEncoding = request.getCharacterEncoding();
	int length = request.getContentLength();
	String contentType = request.getContentType();
	String remoteAddr = request.getRemoteAddr();
	String localAddr = request.getLocalAddr();
	int localPort = request.getLocalPort();
	String queryString = request.getQueryString();
	String uri = request.getRequestURI();
	StringBuffer url = request.getRequestURL();
	
	out.println(String.format(pattern, "characterEncoding", characterEncoding));
	out.println(String.format(pattern, "contentlength", length));
	out.println(String.format(pattern, "contentType", contentType));
	out.println(String.format(pattern, "remoteAddr", remoteAddr));
	out.println(String.format(pattern, "localAddr", localAddr));
	out.println(String.format(pattern, "localPort", localPort));
	out.println(String.format(pattern, "queryString", queryString));
	out.println(String.format(pattern, "requestURI", uri));
	out.println(String.format(pattern, "requestURL", url));

%>

</pre>
<table border="1">
	<thead>
		<tr>
			<th>헤더명</th>
			<th>헤더값</th>
		</tr>
	</thead>
	<tbody>
		<%
			Enumeration<String> headerName = request.getHeaderNames();
			
			while(headerName.hasMoreElements()){
				String headerNames = headerName.nextElement();
				String headerValue = request.getHeader(headerNames);
		%>
				<tr>
					<th><%= headerNames %></th>
					<td><%= headerValue %></td>
				</tr>
		<%
			}
		%>
	</tbody>
</table>
</body>
</html>

























