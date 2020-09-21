<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/includee/preScript.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		resultArea = $("#resultArea");
		obj = {
			page:"1"
		};
		
		function ajax(obj) {
			$.ajax({
				url : "<%=request.getContextPath()%>/member/memberList.do",
				data : {
					searchType:obj.searchType,
					searchWord:obj.searchWord,
					page:obj.page
				},
				method : "POST",
				dataType : "JSON",
				success : function(resp) {
					if($(".table tbody")){
						$(".table tbody").empty();
						$("nav").remove();
					}
					resultArea.after(resp.pagingHTML_BS);
					$(resp.data).each(function(i, v) {
						console.log(v.mem_id);
						$(".table tbody").append($("<tr>").append(
								$("<td>").append($("<a>").attr("href", "<%=request.getContextPath()%>/member/memberView.do?who="+v.mem_id).text(v.mem_id)),
								$("<td>").text(v.mem_name),
								$("<td>").text(v.mem_hp),
								$("<td>").text(v.mem_add1)
						));
					})
					
				},
				error : function() {
		
				}
			});
		}
		
		ajax(obj);
		
		$(document).on("click", "a", function(event) {
			event.stopPropagation();
			obj.page = $(this).data("page");
			ajax(obj);
		});
		
		$("[type=button]").on("click", function(event) {
			obj.searchType = $("[name=searchType]").find("option:selected").val();
			obj.searchWord = $("[name=searchWord]").val();
			console.log(obj.searchWord);
			obj.page = 1;			
			ajax(obj);
			
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
<div id="resultArea">
<select name="searchType">
	<option value="all">전체</option>
	<option value="name">이름</option>
	<option value="address">지역</option>
</select>
<input type="text" name="searchWord"/>
<input type="button" value="전송"/>

<table class="table">
  <thead>
    <tr>
      <th scope="col">mem_id</th>
      <th scope="col">mem_name</th>
      <th scope="col">mem_hp</th>
      <th scope="col">mem_add1</th>
    </tr>
  </thead>
  <tbody>
   
  </tbody>
</table>
</div>
</body>
</html>