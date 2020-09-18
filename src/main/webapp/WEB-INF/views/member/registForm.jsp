<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.js"></script>
<!-- <link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/zipSearch.js"></script>

<script type="text/javascript">
	$(function() {
		var registForm = $("#registForm");
		registForm.validate();
		var idInputTag = $("[name=mem_id]");
		$("input").addClass("form-contorl");
		idInputTag.on("change", function() {
			registForm.data("validId", false);
			$(this).next('.idMsg').remove();
		});
		registForm.on("submit", function() {
			let valid = $(this).data("validId");
			if(!valid){
				alert("아이디 중복 체크하세요!");
				valid = false;
			}
			return valid;
		});
		
		$("#checkBtn").on("click", function() {
			let inputId = idInputTag.val();
			$.ajax({
				url : "<%=request.getContextPath()%>/idCheck.do",
				data : {"inputId":inputId},
				method : "post",
				dataType : "json",
				success : function(resp) {
					if(resp.valid){
						let msgTag = idInputTag.next(".idMsg");
						if(msgTag.length==0){
							idInputTag.after("<span class='idMsg'>아이디 사용가능</span>");
						}
						$("#registForm").data("validId", true);
					}else{
						alert("아이디 중복, 바꾸셈.");
						$("[name=mem_id]").focus();
					}
				},
				errorMsg : function() {
	
				}
			});
		});
		<%-- var chk = false;
		$("input").addClass("form-contorl");
		$("#checkBtn").on("click", function() {
// 			let mem_id = $("[name=mem_id]").val();
			let inputId = $("[name=mem_id]").val();
			$.ajax({
				url : "<%=request.getContextPath()%>/idCheck.do",
				// inputId 파라미터로 중복 확인
				data : {"inputId":inputId},
				method : "post",
				dataType : "json",
				success : function(resp) {
					alert(resp.message);
					if(resp.success=="yes"){
						$("[type=submit]").prop("disabled", false);
						chk = true;
					}
				},
				errorMsg : function() {

				}
			});
		});
		
		$("#registForm").on("submit", function(event) {
			if(chk == false)
				event.preventDefault();
		}); --%>
		
	<%
		String message = (String) request.getAttribute("message");
		if(StringUtils.isNotBlank(message)){
			%>
			alert("<%=message%>");
			<%
		}
	%>
		obj = {
			contextPath:"<%=request.getContextPath()%>"
		}
		$(".search").zipSearch(obj);
		
// 		$(".zipSearch").on("click", function() {
// 			let ziptable = $("<table>").addClass("dataTable");
// 			let inputTxt = $(".zipSearchTxt").val();
// 			if(inputTxt!=null){
// 				$.ajax({
<%-- 					url : "<%=request.getContextPath()%>/zipSearch.do", --%>
// 					data : {
// 						dong:inputTxt
// 					},
// 					method : "GET",
// 					dataType : "JSON",
// 					success : function(resp) {
// 						$("#bbbody").find(".dataTable").remove();
// 						let zipcode;
// 						let sido;
// 						let gugun;
// 						let dong;
// 						let bunji;
// 						ziptable.append(
// 							$("<thead>").append(
// 									$("<tr>").append(
// 										$("<th>").text("우편번호"),
// 										$("<th>").text("시도"),
// 										$("<th>").text("구/군"),
// 										$("<th>").text("동"),
// 										$("<th>").text("번지")
// 									)
// 							)
// 						);
// 						let tbody = $("<tbody>");
// 						$(resp).each(function(i) {
// 							zipcode = resp[i].zipcode;
// 							sido = resp[i].sido;
// 							gugun = resp[i].gugun;
// 							dong = resp[i].dong;
// 							bunji = resp[i].bunji;
// 							tbody.append(
// 									$("<tr>").addClass("ziptable").append(
// 											$("<td>").text(zipcode),
// 											$("<td>").text(sido),
// 											$("<td>").text(gugun),
// 											$("<td>").text(dong),
// 											$("<td>").text(bunji)
// 										)
// 									)
// 						});
// 						ziptable.append(tbody);
// 						$("#bbbody").append(ziptable);
// 						console.log($("#bbbody table"));
// 						$("#bbbody table").DataTable();
// 					},
// 					error : function() {

// 					}
// 				});
// 			}
// 		});
		
		$(document).on("click", ".ziptable", function() {
			zipcode = $("td:eq(0)", this).text();
			sido = $("td:eq(1)",this).text();
			gugun = $("td:eq(2)",this).text();
			dong = $("td:eq(3)",this).text();
			
			$("[name='mem_zip']").val(zipcode);
			$("[name='mem_add1']").val(sido + " " + gugun + " " + dong);
			
			$(".ziptable").empty();
			$("#myModal").modal("hide");
		})
	});
</script>
<style type="text/css">
	.ziptable:hover{
		color: orange;
	}
</style>
</head>
<jsp:useBean id="member" class="kr.or.ddit.vo.MemberVO" scope="request"></jsp:useBean>
<jsp:useBean id="errors" class="java.util.LinkedHashMap" scope="request"></jsp:useBean>
<body>
	<form id="registForm" method="post">
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td><input type="text" required name="mem_id" value="${member.mem_id}" />
					<button type="button" id="checkBtn">아이디중복체크</button>
					<span class="errorMsg"><%=errors.get("mem_id") %></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" required name="mem_pass" value="${member.mem_pass}" /><span class='errorMsg'><%=errors.get("mem_pass")%></span></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" required name="mem_name" value="${member.mem_name}" value="<%=member.getMem_name() %>" maxlength="15"/><span class='errorMsg'><%=errors.get("mem_name")%></span></td>
			</tr>
			<tr>
				<th>주민번호1</th>
				<td><input type="text" required name="mem_regno1" value="${member.mem_regno1}" /><span class='errorMsg'><%=errors.get("mem_regno1")%></span></td>
			</tr>
			<tr>
				<th>주민번호2</th>
				<td><input type="text" required name="mem_regno2" value="${member.mem_regno2}" /><span class='errorMsg'><%=errors.get("mem_regno2")%></span></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="mem_bir" value="${member.mem_bir}" placeholder="1999-01-01" pattern="yy-MM-dd"/><span class='errorMsg'><%=errors.get("mem_bir")%></span></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><%-- <input type="text" required name="mem_zip" value="${member.mem_zip}" /><span class='errorMsg'><%=errors.get("mem_zip")%></span><input type="button" value="우편번호 검색" class="search btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"/> --%>
				<input type="text" required name="mem_zip" value="${member.mem_zip}" /><span class='errorMsg'><%=errors.get("mem_zip")%></span><input type="button" value="우편번호 검색" class="search"/></td>
			</tr>
			<tr>
				<th>주소1</th>
				<td><input type="text" required name="mem_add1" value="${member.mem_add1}" /><span class='errorMsg'><%=errors.get("mem_add1")%></span></td>
			</tr>
			<tr>
				<th>주소2</th>
				<td><input type="text" required name="mem_add2" value="${member.mem_add2}" /><span class='errorMsg'><%=errors.get("mem_add2")%></span></td>
			</tr>
			<tr>
				<th>집전화번호</th>
				<td><input type="text" required name="mem_hometel" value="${member.mem_hometel}" /><span class='errorMsg'><%=errors.get("mem_hometel")%></span></td>
			</tr>
			<tr>
				<th>회사전화번호</th>
				<td><input type="text" required name="mem_comtel" value="${member.mem_comtel}" /><span class='errorMsg'><%=errors.get("mem_comtel")%></span></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><input type="text" name="mem_hp" value="${member.mem_hp}" /><span class='errorMsg'><%=errors.get("mem_hp")%></span></td>
			</tr>
			<tr>
				<th>메일</th>
				<td><input type="text" required name="mem_mail" value="${member.mem_mail}" /><span class='errorMsg'><%=errors.get("mem_mail")%></span></td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" name="mem_job" value="${member.mem_job}" /><span class='errorMsg'><%=errors.get("mem_job")%></span></td>
			</tr>
			<tr>
				<th>취미</th>
				<td><input type="text" name="mem_like" value="${member.mem_like}" /><span class='errorMsg'><%=errors.get("mem_like")%></span></td>
			</tr>
			<tr>
				<th>기념일</th>
				<td><input type="text" name="mem_memorial" value="${member.mem_memorial}" /><span class='errorMsg'><%=errors.get("mem_memorial")%></span></td>
			</tr>
			<tr>
				<th>기념일자</th>
				<td><input type="date" name="mem_memorialday" value="${member.mem_memorialday}" /><span class='errorMsg'><%=errors.get("mem_memorialday")%></span></td>
			</tr>
			<%-- <tr>
				<th>마일리지</th>
				<td><input type="number" name="mem_mileage" value="${member.mem_mileage}" /><span class='errorMsg'><%=errors.get("mem_mileage")%></span></td>
			</tr>
			<tr>
				<th>탈퇴여부</th>
				<td><input type="text" name="mem_delete" value="${member.mem_delete}" /><span class='errorMsg'><%=errors.get("mem_delete")%></span></td>
			</tr> --%>
			<tr>
				<td colspan="2">
					<input class="submit" type="submit" value="전송"/>
					<input type="reset" value="취소"/>
				</td>
			</tr>
		</table>
	</form>
	
<!-- 	<!-- Modal
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">우편번호 검색</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" id="bbbody">
          <p>동 이름</p><input class=zipSearchTxt type=text/><input class="zipSearch" type="button" value="확인"/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> -->
	
</body>
</html>