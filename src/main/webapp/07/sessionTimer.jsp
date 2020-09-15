<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src = "<%=request.getContextPath() %>/js/sessionTimer.js">
	
	
// 	$(function() {
// 	setInterval(() => {
				
// 				min = parseInt(time/60);
// 				sec = time%60;
// 				h.html(min + ":" + sec);
// 				time--;
// 	 			if(time == 119){ //(sessionTime/2)
// 	 				$("#exampleModal").prop("aria-hidden","false");
// 	 				let yBtn = document.createElement('input');
// 	 				let nBtn = document.createElement('input');
// 	 				let span = document.createElement("span");
// 	 				$(span).text("연장하실?");
// 	 				$(yBtn).attr({
// 	 					"type" : "button",
// 	 					"value" : "연장"
// 	 				});
// 	 				$(nBtn).attr({
// 	 					"type" : "button",
// 	 					"value" : "안연장"
// 	 				});
// 	 				h.after(span,yBtn,nBtn);
// 	 			}
// 				if(time <= 0){
// 					location.reload();
// 					h.html("종료");
					
// 				}
				
// 			}, 1000);
			
// 			yBtn.addEventListener("click", function() {
				
// 			})
// 			$('#myModal').on('shown.bs.modal', function () {
// 				$('#myInput').trigger('focus')
// 			})
			
		
// 	})

</script>
<%= session.getId() %>
<h4 id ="timeArea"> </h4>

<!-- <div class="modal fade" id = "msgArea" tabindex="-1"> -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title">Modal title</h5> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         <p>세션 연장 허쉴??</p> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-primary controlBtn" id = "yesBtn">그래그래</button> -->
<!--         <button type="button" class="btn btn-primary controlBtn" id = "noBtn">싫어싫어</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->

<!-- 1. 스케쥴링 함수를 이용하여, 1초마다 차감되는 타이머 구현. -->
<!-- 2. 1분남은 시점에 메시지를 출력, 세션 연장 여부를 확인한 다음, -->
<!-- 	연장을 선택하면, 타이머가 2분으로 리셋. -->
<!-- 	연장하지 않겠다면, 타이머는 0:0 순간 멈춤. -->

<script type="text/javascript">
$("#timeArea").sessionTimer(<%= session.getMaxInactiveInterval() %>);

</script>






