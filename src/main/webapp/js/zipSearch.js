// 만들어진 table을 append할 녀석
// 검색할 dong
// 컨텍스트 패스
// this : 이벤트 발생대상
$.fn.zipSearch=function(object) {
	let contextPath = object.contextPath;
	var div1;
	function zipTableArea() {
		let modalHeader = $("<div>").addClass("modal-header").append($("<h4>").addClass("modal-title").text("우편 번호 검색"))
		.append($("<button>").attr("type", "button").addClass("close").attr("data-dismiss", "modal").val("&times;"));
		let modalBody = $("<div>").addClass("modal-body").prop("id", "bbbody")
		.append($("<p>").text("동 이름"))
		.append($("<input>").addClass("zipSearchTxt").attr("type", "text"))
		.append($("<input>").addClass("zipSearch").attr("type", "button").val("확인"));
		let modalFooter = $("<div>").addClass("modal-footer").append($("<button>")
				.addClass("btn btn-default").attr({"data-dismiss":"modal", "type":"button"}).text("Close"));
		let modalContent = $("<div>").addClass("modal-content").append(modalHeader, modalBody, modalFooter);
		
		div1 = $("<div>").attr({
			"class" : "modal fade",
			"id" : "myModal",
			"role" : "dialog"
		}).append($("<div>").addClass("modal-dialog modal-lg").append(modalContent));
		
		$(div1).modal({show:false});
	}
	
	zipTableArea();
	
	$(this).on("click", function name() {
		div1.modal("show");
	})
	
	$(document).on("click", ".zipSearch", function() {
		console.log(this);
		let dong = $(".zipSearchTxt").val();
		let pnt = $("#bbbody");
		if(dong!=null){
			$.ajax({
				url : contextPath + "/zipSearch.do",
				data : {
					dong:dong
				},
				method : "GET",
				dataType : "JSON",
				success : function(resp) {
					console.log(resp);
					$(pnt).find(".dataTable").remove();
					let ziptable = $("<table>").addClass("dataTable").prop("id", "dt");
					let zipcode;
					let sido;
					let gugun;
					let dong;
					let bunji;
					ziptable.append(
						$("<thead>").append(
								$("<tr>").append(
									$("<th>").text("우편번호"),
									$("<th>").text("시도"),
									$("<th>").text("구/군"),
									$("<th>").text("동"),
									$("<th>").text("번지")
								)
						)
					);
					let tbody = $("<tbody>");
					$(resp).each(function(i) {
						zipcode = resp[i].zipcode;
						sido = resp[i].sido;
						gugun = resp[i].gugun;
						dong = resp[i].dong;
						bunji = resp[i].bunji;
						tbody.append(
								$("<tr>").addClass("ziptable").append(
										$("<td>").text(zipcode),
										$("<td>").text(sido),
										$("<td>").text(gugun),
										$("<td>").text(dong),
										$("<td>").text(bunji)
									)
								)
					});
					ziptable.append(tbody);
					$(pnt).append(ziptable);
					$("#dt").DataTable();
				},
				error : function(error) {
					console.log(error.state);
				}
			});
		}
	});
	
	
}
$.fn.deleteMemberBtn=function(object) {
	let contextPath = object.contextPath;
	var div1;
	function deleteChk() {
		let modalHeader = $("<div>").addClass("modal-header").append($("<h4>").addClass("modal-title").text("회원 탈퇴"))
		.append($("<button>").attr("type", "button").addClass("close").attr("data-dismiss", "modal").val("&times;"));
		let modalBody = $("<div>").addClass("modal-body").prop("id", "bbbody")
		.append($("<p>").text("정말로 회원탈퇴를 하시려면 비밀번호를 입력해주세요."))
		.append($("<input>").addClass("passTxt").attr("type", "text"))
		.append($("<input>").addClass("deleteOk").attr("type", "button").val("확인"));
		let modalFooter = $("<div>").addClass("modal-footer").append($("<button>")
				.addClass("btn btn-default").attr({"data-dismiss":"modal", "type":"button"}).text("Close"));
		let modalContent = $("<div>").addClass("modal-content").append(modalHeader, modalBody, modalFooter);
		
		div1 = $("<div>").attr({
			"class" : "modal fade",
			"id" : "myModal",
			"role" : "dialog"
		}).append($("<div>").addClass("modal-dialog modal-lg").append(modalContent));
		
		$(div1).modal({show:false});
	}
	
	deleteChk();
	
	$(this).on("click", function name() {
		div1.modal("show");
	})
	
	$(document).on("click", ".deleteOk", function() {
		let documentPass = $("[name=pass]").find("td:eq(1)").text();
		let modalPass = $(".passTxt").val();
		
		if(documentPass==modalPass){
			$.ajax({
				url : contextPath+"/leaveApp.do",
				method : "POST",
				success : function() {
					location.href=contextPath;
				}
			});
		}
		console.log("doc : " + documentPass);
		console.log("modal : " + modalPass);
	});
}