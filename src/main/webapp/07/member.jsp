<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style type="text/css">
	form {
		width: 500px;
	}


</style>
<script type="text/javascript" src = "<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	$(function() {
		var formTag = $("#memForm");
		
		let modalHeader = $("<div>").addClass("modal-header").append($("<h5>").text("빈항목있음"));
		let modalBody = $("<div>").addClass("modal-body").append($("<p>").text("빈 항목이 있습니다."));
		let yesBtn = $("<button>").addClass("btn btn-primary").text("확인").prop("id", "yesBtn");
		let noBtn = $("<button>").addClass("btn btn-primary").text("취소").prop("id", "noBtn");
		let modalFooter = $("<div>").addClass("modal-footer").append(yesBtn, noBtn);
		let modalContent = $("<div>").addClass("modal-content").append(modalHeader, modalBody, modalFooter);

		let div1 = $("<div>").attr({
			"class" : "modal fade",
			"id" : "msgArea",
			"tabindex" : "-1"
		}).append($("<div>").addClass("modal-dialog").append(modalContent));
		
		formTag.after(div1);
		$(div1).modal({show:false});
		let clickHandler = function() {
			$(div1).modal("hide");
		}
		yesBtn.on("click", clickHandler);
		noBtn.on("click", clickHandler);
		
		
		$('#mem_id').on("blur keyup", function() {
			let val = $(this).val();
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 15){
				$(this).val( val.substring(0, 15));
				//$(this).after(span);
				
			}
		});
		
		$('#mem_pass').on("blur keyup", function() {
			let val = $(this).val();
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 15){
				$(this).val( val.substring(0, 15));
				//$(this).after(span);
				
			}
		});
		
		$('#mem_name').on("blur keyup", function() {
			let val = $(this).val();
			$(this).val( $(this).val().replace( /[a-z0-9]/g, '' ) );
			
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 10){
				$(this).val( val.substring(0, 10));
				//$(this).after(span);
				
			}
		});
		
		$('#mem_regno1').on("blur keyup", function() {
			let val = $(this).val();
			$(this).val( $(this).val().replace(/\D+/g,''));
				
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 6){
				$(this).val( val.substring(0, 6));
				//$(this).after(span);
				
			}
		});
		
		$('#mem_regno2').on("blur keyup", function() {
			let val = $(this).val();
			$(this).val( $(this).val().replace(/\D+/g,''));
				
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 7){
				$(this).val( val.substring(0, 7));
				//$(this).after(span);
				
			}
		});
		$('#mem_zip').on("blur keyup", function() {
			let val = $(this).val();
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 7){
				$(this).val( val.substring(0, 7));
				
			}
		});
		$('#mem_add1').on("blur keyup", function() {
			let val = $(this).val();
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 50){
				$(this).val( val.substring(0, 50));
				
			}
		});
		$('#mem_add2').on("blur keyup", function() {
			let val = $(this).val();
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 40){
				$(this).val( val.substring(0, 40));
				
			}
		});
		$('#mem_hometel').on("blur keyup", function() {
			let val = $(this).val();
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 14){
				$(this).val( val.substring(0, 14));
				
			}
		});
		$('#mem_comtel').on("blur keyup", function() {
			let val = $(this).val();
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 14){
				$(this).val( val.substring(0, 14));
				
			}
		});
		$('#mem_hp').on("blur keyup", function() {
			let val = $(this).val();
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 15){
				$(this).val( val.substring(0, 15));
				
			}
		});
		$('#mem_mail').on("blur keyup", function() {
			let val = $(this).val();
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			//let span = $("<span>").text("15글자 까지 입력가능.").css("color","red");
			if(val.length > 40){
				$(this).val( val.substring(0, 40));
				
			}
		});
		
		
		
		$("#memForm").on("submit", function(event) {
			
				
			event.preventDefault();
			console.log($("#msgArea"));
			
			var inputs = $(this).find(":input");
			let obj ={};
			inputs.each(function(index, tag) {
				let name = tag.name;
				if(name){
					let value = tag.value;
					if(value == ''){
						$("#msgArea").modal("show");
						$(tag).css("border","1px solid red");
						return false;
					}
					obj[name] = value;
					console.log(obj);
				}
			});
			console.log(obj);
			
			
			
		});
		
	})
	


</script>

</head>
<body>
	<h2>회원관리</h2>
	<form id="memForm">
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">아이디</span>
		  </div>
		  <input id = "mem_id" name="mem_id" type="text" class="form-control" placeholder="아이디를 적어주세요" aria-label="Username" aria-describedby="basic-addon1">
		  <button class="btn btn-outline-secondary" type="button" id="checkBtn">중복검사</button>
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">비밀번호</span>
		  </div>
		  <input id = "mem_pass" name="mem_pass" type="password" class="form-control" placeholder="비밀번호를 적어주세요" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">이름</span>
		  </div>
		  <input id = "mem_name" name="mem_name" type="text" class="form-control" placeholder="이름을 적어주세요" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">주민번호</span>
		  </div>
		   <input id = "mem_regno1" name="mem_regno1" type="number" class="form-control" placeholder="주민번호앞자리" aria-label="Username" aria-describedby="basic-addon1">
		   <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">-</span>
		  </div>
		  <input type="password" class="form-control" placeholder="주민번호 뒷자리" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">우편번호</span>
		  </div>
		   <input id = "mem_zip" name="mem_zip" type="text" class="form-control" placeholder="우편번호" aria-label="Username" aria-describedby="basic-addon1">
		   <button class="btn btn-outline-secondary" type="button" id="searchBtn">우편번호찾기</button>
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">주소</span>
		  </div>
		  <input id = "mem_add1" name="mem_add1" type="text" class="form-control" placeholder="주소" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">상세주소</span>
		  </div>
		  <input id = "mem_add2" name="mem_add2" type="text" class="form-control" placeholder="상세주소" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">집전화</span>
		  </div>
		  <input id = "mem_hometel" name="mem_hometel" type="text" class="form-control" placeholder="집전화" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">회사전화번호</span>
		  </div>
		  <input id = "mem_comtel" name="mem_comtel" type="text" class="form-control" placeholder="회사전화번호" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">핸드폰번호</span>
		  </div>
		  <input id = "mem_hp" name="mem_hp" type="text" class="form-control" placeholder="집전화" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">이메일</span>
		  </div>
		  <input id = "mem_mail" name="mem_mail" type="text" class="form-control" placeholder="이메일" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="inputGroupSelect01">직업</label>
		  </div>
		  <select class="custom-select" id="mem_job" name="mem_job">
		    <option selected>직업선택</option>
		    <option value="1">주부</option>
		    <option value="1">학생</option>
		    <option value="2">회사원</option>
		    <option value="3">교사</option>
		    <option value="3">공무원</option>
		    <option value="3">은행원</option>
		    <option value="3">농업</option>
		    <option value="3">수산업</option>
		    <option value="3">축산업</option>
		    <option value="3">자영업</option>
		  </select>
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="inputGroupSelect01">취미</label>
		  </div>
		  <select class="custom-select" id = "mem_like" name="mem_like">
		    <option selected>취미선택</option>
		    <option value="1">수영</option>
		    <option value="1">독서</option>
		    <option value="2">볼링</option>
		    <option value="3">당구</option>
		    <option value="3">스키</option>
		    <option value="3">등산</option>
		    <option value="3">낚시</option>
		    <option value="3">바둑</option>
		    <option value="3">만화</option>
		    <option value="3">카레이싱</option>
		    <option value="3">영화감상</option>
		  </select>
		</div>
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="inputGroupSelect01">기념일</label>
		  </div>
		  <select class="custom-select" id = "mem_memorial" name="mem_memorial">
		    <option selected>기념일선택</option>
		    <option value="1">결혼기념일</option>
		    <option value="1">아버님생신</option>
		    <option value="2">어머님생신</option>
		    <option value="3">아내생일</option>
		    <option value="3">남편생일</option>
		  </select>
		  <input id = "mem_mem_memorialday" name="mem_memorialday" type="text" class="form-control" placeholder="기념일날짜" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<button id="subBtn" type="submit" class="btn btn-primary">확인</button>
		<button id="resetBtn" type="reset" class="btn btn-light">취소</button>
		
		
	</form>
	<div id="modalDiv">
	
	</div>
</body>
</html>


















