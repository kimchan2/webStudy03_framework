<%@page import="java.io.FilenameFilter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		
		var imgPtrn = "<img src ='<%= request.getContextPath() %>/image/image.do?image=%S'/>";
		var videoPtrn = "<video src = '<%= request.getContextPath() %>/image/image.do?image=%S' controls='auto'/>";
		var resultArea = $("#resultArea");
		
		$("select").on("change", function() {
			let value = $(this).val();
			
			let option = $(this).find("option:selected");
			let clzName = $(option).attr("class");
			let innerTag = null;
			
			if(clzName.startsWith('image')){
				innerTag = imgPtrn.replace("%S", value);
			}else if (clzName.startsWith('video')){
				innerTag = videoPtrn.replace("%S", value);
			}
			
			if(innerTag){
				resultArea.html(innerTag);
			}
			
		})
		
	});
	

</script>


</head>
<body>
<select id="fileList">
	
	
		<%
		
		String contentsPath = application.getInitParameter("contentsPath");
		String pattern = "<option class = '%s'>%s</option>\n";
		String imageUrl = config.getInitParameter("imagePath");
		File folder = new File(contentsPath);
		
		String contextPath = request.getContextPath(); //  /webStudy01
		String[] listFiles = folder.list(new FilenameFilter(){
			
			@Override
			public boolean accept(File dir, String name) {
				boolean accept = false;

				String mime = application.getMimeType(name);
				
				accept = mime != null && (mime.startsWith("image/") || mime.startsWith("video/"));
				
				return accept;
			}
			
		});
		
		StringBuffer options = new StringBuffer();
		for(String file : listFiles) {
			String fileMime = application.getMimeType(file);
			out.println(String.format(pattern, fileMime, file));
		}

		%>
	</select>
	<div id="resultArea">
	
	</div>
</body>
</html>