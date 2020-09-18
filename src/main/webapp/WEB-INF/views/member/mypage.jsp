<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/mypage.jsp</title>
<jsp:include page="/includee/preScript.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/zipSearch.js"></script>
<script type="text/javascript">
	$(function() {
		obj = {
			contextPath:"<%=request.getContextPath()%>",
		};
		$("#deleteBtn").deleteMemberBtn({contextPath:"<%=request.getContextPath()%>"});
	});
</script>
<style>
</style>
<script type="text/javascript">
	$(function() {
		$("#updateBtn").on("click", function() {
			$(this).prop("disabled", true);
			let trTags = [];
			$("tr").each(function(index, tr) {
				trTags.push(tr);
			});
			
			let colNum = [1, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 19];
			
			$(colNum).each(function(index, num) {
				if(num==19){
					let tdTag = $(trTags[num]).find("td:eq(0)");
					tdTag.append($("<input>").attr({"type":"button", "value":"확인", "id":"updateOkBtn"}));
				}else{
					let tdTag = $(trTags[num]).find("td:eq(1)");
					let val = tdTag.text();
					tdTag.empty();
					tdTag.append($("<input>").attr({"type":"text", "value":val}));
				}
			});
		});
		
		$("#btnArea").on("click", "#updateOkBtn", function() {
			let colNum = [1, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
			
			let trTags = [];
			$("tr").each(function(index, tr) {
				trTags.push(tr);
			});
			console.log(trTags);
			
			let data = [];
			$(trTags).each(function(i, tr) {
				let chk = true;
				$(colNum).each(function(j, num) {
					if(i==num){
						chk = false;
						data.push($(tr).find("td:eq(1)").find("input").val());
					}
				})
				if(chk)
					data.push($(tr).find("td:eq(1)").text());
			});
			
			console.log(data);
			
			$.ajax({
				url : "<%=request.getContextPath()%>/myDataUpdate.do",
				data : data = {
					mem_id:data[0],
					mem_pass:data[1], 
					mem_zip:data[6], 
					mem_add1:data[7], 
					mem_add2:data[8], 
					mem_hometel:data[9], 
					mem_comtel:data[10], 
					mem_hp:data[11], 
					mem_mail:data[12], 
					mem_job:data[13], 
					mem_like:data[14], 
					mem_memorial:data[15], 
					mem_memorialday:data[16]
				},
				method : "post",
				dataType : "json",
				success : function(resp) {
					if(resp.result=="OK"){
						location.reload();
						alert("회원정보 수정 성공");
					}
					else{
						alert("회원정보 수정 실패");
					}
				},
				error : function() {

				}
			});
			
		});
	});
</script>
</head>
<body>
<!-- table 태그를 이용하여, 현재 로그인된 유저의 모든 정보를 출력. -->
<%MemberVO authMember = (MemberVO)request.getAttribute("authMember"); %>
<%String update = (String)request.getParameter("update"); %>
<table class="table table-bordered">

	<tr name="id">
		<td>아이디</td>
		<td><%=authMember.getMem_id() %></td>
	</tr>
	<tr class="editable" name="pass">
		<td>비밀번호</td>
		<td><%=authMember.getMem_pass() %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=authMember.getMem_name() %></td>
	</tr>
	<tr>
		<td>regno1</td>
		<td><%=authMember.getMem_regno1() %></td>
	</tr>
	<tr>
		<td>regno2</td>
		<td><%=authMember.getMem_regno2() %></td>
	</tr>
	<tr>
		<td>생일</td>
		<td><%=authMember.getMem_bir() %></td>
	</tr>
	<tr class="editable">
		<td>우편번호</td>
		<td><%=authMember.getMem_zip() %></td>
	</tr>
	<tr class="editable">
		<td>주소</td>
		<td><%=authMember.getMem_add1() %></td>
	</tr>
	<tr class="editable">
		<td>상세주소</td>
		<td><%=authMember.getMem_add2() %></td>
	</tr>
	<tr class="editable">
		<td>집전화</td>
		<td><%=authMember.getMem_hometel() %></td>
	</tr>
	<tr class="editable">
		<td>회사전화</td>
		<td><%=authMember.getMem_comtel() %></td>
	</tr>
	<tr class="editable">
		<td>휴대전화</td>
		<td><%=authMember.getMem_hp() %></td>
	</tr>
	<tr class="editable">
		<td>메일</td>
		<td><%=authMember.getMem_mail() %></td>
	</tr>
	<tr class="editable">
		<td>직업</td>
		<td><%=authMember.getMem_job() %></td>
	</tr>
	<tr class="editable">
		<td>좋아하는 것</td>
		<td><%=authMember.getMem_like() %></td>
	</tr>
	<tr class="editable">
		<td>기념</td>
		<td><%=authMember.getMem_memorial() %></td>
	</tr>
	<tr class="editable">
		<td>결혼기념일</td>
		<td><%=authMember.getMem_memorialday() %></td>
	</tr>
	<tr>
		<td>마일리지</td>
		<td><%=authMember.getMem_mileage() %></td>
	</tr>
	<tr>
		<td>탈퇴여부</td>
		<td><%=authMember.getMem_delete() %></td>
	</tr>
	<tr>
		<td id="btnArea" colspan="2">
			<input type="button" id="updateBtn" value="수정하기"/>
			<input type="button" id="deleteBtn" value="탈퇴"/>
		</td>
	</tr>
</table>
</body>
</html>