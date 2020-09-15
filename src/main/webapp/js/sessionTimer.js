/**
 * 
 */

$.fn.sessionTimer = function(timeout) {
		const TIMEOUT = timeout;
		var timeArea = this;
		var timer;
		var timerjob;
		function makeMessageArea(){
			let modalHeader = $("<div>").addClass("modal-header").append($("<h5>").text("세션 연장"));
			let modalBody = $("<div>").addClass("modal-body").append($("<p>").text("세션 연장 허쉴???"));
			let yesBtn = $("<button>").addClass("btn btn-primary").text("그래그래").prop("id", "yesBtn");
			let noBtn = $("<button>").addClass("btn btn-primary").text("싫어싫어").prop("id", "noBtn");
			let modalFooter = $("<div>").addClass("modal-footer").append(yesBtn, noBtn);
			let modalContent = $("<div>").addClass("modal-content").append(modalHeader, modalBody, modalFooter);

			let div1 = $("<div>").attr({
				"class" : "modal fade",
				"id" : "msgArea",
				"tabindex" : "-1"
			}).append($("<div>").addClass("modal-dialog").append(modalContent));
			
			timeArea.after(div1);
			$(div1).modal({show:false});
			let clickHandler = function() {
				let id = this.id;
				if(id == "yesBtn"){
					init();
				}
				$(div1).modal("hide");
			}
			yesBtn.on("click", clickHandler);
			noBtn.on("click", clickHandler);
		}
		function init() {
			timer = TIMEOUT;
			if(timerjob){
				clearInterval(timerjob);
			}
			timerjob = setInterval(() => {
				timer--;
				// 2:00
				let min = Math.floor(timer/60);
				let sec = timer%60;
				timeArea.text(min + ":" + sec);
				
				if(timer <= 0){
					clearInterval(timerjob);
				}
			}, 100);
			setTimeout(() => {
				$("#msgArea").modal("show");
				
			}, (TIMEOUT-60)*100);
		}
		makeMessageArea();
// $("#msgArea").modal("show");
		init();
		return this;
	}