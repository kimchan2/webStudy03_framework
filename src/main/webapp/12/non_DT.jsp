<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12/datatable.jsp</title>
<jsp:include page="/includee/preScript.jsp"></jsp:include>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript" src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<style type="text/css">
	table{
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
<script type="text/javascript">
// non datatable
	$(function() {
		let zipTable = $("#zipTable");
		let pagingArea = $("#pagingArea");
		
		let pagingA = pagingArea.on("click", "a", function() {
			let page = $(this).data("page");
			searchForm.find("[name=page]").val(page);
			searchForm.submit();
			searchForm.find("[name=page]").val(1);
		});
		
		let searchForm = $("#search").on("submit", function(event) {
			event.preventDefault();
			let url = this.action?this.action:location.href;
			let method = this.method?this.method:"get";
			let data = $(this).serialize(); // query string이 만들어짐
			$.ajax({
				url : url,
				data : data,
				method : method,
				dataType : "json",
				success : function(resp) {
					zipTable.find("tbody").empty();
					pagingArea.empty();
					let list = resp.data;
					let trTags = [];
					if(list.length>0){
						$(list).each(function(index, zipVO) {
							trTags.push(
							$("<tr>").append(
								$("<td>").text(zipVO.zipcode),
								$("<td>").text(zipVO.address)
								)
							);
						});
					}else{
						trTags.push($("<tr>").html($("<td colspan='2'>").text("우편번호 없음.")));
					}
					zipTable.find("tbody").html(trTags);
					pagingArea.html(resp.pagingHTML);
				},
				error : function() {

				}
			});
			return false;
		}).submit();
	});
	
	<%-- 
	function paging(param){
		let url = param.url;
		let page = param.page;
		let zipTable = $(param.zipTable);
		let pagingArea = $(param.pagingArea);
		let dong = param.dong;
		
		$.ajax({
			url : url,
			data : {
				page:page,
				dong:dong
			},
			method : "GET",
			dataType : "JSON",
			success : function(resp) {
				zipTable.find("tbody").empty();
				pagingArea.empty();
				let list = resp.data;
				let trTags = [];
				if(list.length>0){
					$(list).each(function(index, zipVO) {
						trTags.push(
						$("<tr>").append(
							$("<td>").text(zipVO.zipcode),
							$("<td>").text(zipVO.address)
							)
						);
					});
					param.page = 1;
				}else{
					trTags.push($("<tr>").html($("<td colspan='2'>").text("우편번호 없음.")));
				}
				zipTable.find("tbody").html(trTags);
				pagingArea.html(resp.pagingHTML);
			},
			error : function() {

			}
		});
	}
		
	
	$(function() {
		let param = {
				url: "<%=request.getContextPath()%>/zipSearch.do",
				page:1,
				zipTable:"#zipTable",
				pagingArea:"#pagingArea"
		};
		
		paging(param);
		
		$("#pagingArea").on("click", "a", function() {
			let page = $(this).data("page");
			param.page = page;
			console.log(param);
			paging(param);
		});
		
		$("#search").on("submit", function(event) {
			event.preventDefault();
			let dong = $("[name=searchWord]").val();
			param.dong = dong;
			paging(param);
		});
		
	}); --%>
</script>
</head>
<body>
<table id="zipTable" border="">
	<thead>
		<tr>
			<th>우편번호</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<br>
<form id="search" action="<%=request.getContextPath()%>/zipSearch.do" method="get">
	동 이름 : <input type="text" name="searchWord"/>
	<input type="hidden" name="page"/>
	<input type="submit" value="우편번호 검색">
</form>
<div id="pagingArea"></div>
<script type="text/javascript">
// 	$("#zipTable").DataTable({
<%-- 		ajax: "<%=request.getContextPath()%>/zipSearch.do", --%>
// 	  	columns: [
//             { "data": "zipcode" },
//             { "data": "address" }
//         ]
// 	});
</script>
</body>
</html>