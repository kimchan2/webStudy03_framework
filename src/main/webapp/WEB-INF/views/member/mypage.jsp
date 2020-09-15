<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/mypage.jsp</title>
<style>
	table{
		border-collapse: collapse;
		border: 1px solid skyblue;
	}
</style>
</head>
<body>
<!-- table 태그를 이용하여, 현재 로그인된 유저의 모든 정보를 출력. -->
<%MemberVO authMember = (MemberVO)request.getAttribute("authMember"); %>
<table border="">

	<tr>
		<td>아이디</td>
		<td><%=authMember.getMem_id() %></td>
	</tr>
	<tr>
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
	<tr>
		<td>우편번호</td>
		<td><%=authMember.getMem_zip() %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=authMember.getMem_add1() %></td>
	</tr>
	<tr>
		<td>상세주소</td>
		<td><%=authMember.getMem_add2() %></td>
	</tr>
	<tr>
		<td>집전화</td>
		<td><%=authMember.getMem_hometel() %></td>
	</tr>
	<tr>
		<td>회사전화</td>
		<td><%=authMember.getMem_comtel() %></td>
	</tr>
	<tr>
		<td>휴대전화</td>
		<td><%=authMember.getMem_hp() %></td>
	</tr>
	<tr>
		<td>메일</td>
		<td><%=authMember.getMem_mail() %></td>
	</tr>
	<tr>
		<td>직업</td>
		<td><%=authMember.getMem_job() %></td>
	</tr>
	<tr>
		<td>좋아하는 것</td>
		<td><%=authMember.getMem_like() %></td>
	</tr>
	<tr>
		<td>기념</td>
		<td><%=authMember.getMem_memorial() %></td>
	</tr>
	<tr>
		<td>결혼기념일</td>
		<td><%=authMember.getMem_memorialday() %></td>
	</tr>
	<tr>
		<td>마일리지</td>
		<td><%=authMember.getMem_mileage() %></td>
	</tr>
	<tr>
		<td>탈퇴일?</td>
		<td><%=authMember.getMem_delete() %></td>
	</tr>
</table>
</body>
</html>