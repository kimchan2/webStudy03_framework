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
	
</script>
</head>
<body>
<table id="zipTable">
	<thead>
		<tr>
			<th>우편번호</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>

<script type="text/javascript">
	$("#zipTable").DataTable({
        processing: true,
        serverSide: true,
		ajax: "<%=request.getContextPath()%>/zipSearchDT.do",
	  	columns: [
            { "data": "zipcode" },
            { "data": "address" }
        ]
// 		page:currentPage,
// 		pages:totalPage
	});
</script>
</body>
</html>