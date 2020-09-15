<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/04/gugudanForm.jsp</title>
<script type="text/javascript" src ="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src = "../js/calForm.js"></script>
<script type="text/javascript">
	$(function() {
		var resultDiv = $("#resultDiv");
		var form = $("form:nth(0)").convertForm({
				
			success:function(resp) {
				resultDiv.html(resp);
				resultDiv.css({
					border : "1px solid black",
					backgroundColor : "green"
			});
		
		}, 
		validation:function() {
			
			let minDan = minDanTag.val();
			let maxDan = maxDanTag.val();
			let valid = minDan <= maxDan;
			
			if(!valid){
				form.after("<h4 class='erros'>입력 데이터에 문제있음.</h4>");
			}
			
			return valid;
			
		},
		init:function(){
			$("h4.erros").remove();
			resultDiv.empty();
		}
	});
		var maxDanTag = $("select[name = 'maxDan']");
		var minDanTag = $("select[name = 'minDan']").on("change", function() {
			var selector = $(this).find("option:selected");
			let value = selector.val();
			let currentIndex = value-1;
			$("select[name = 'maxDan']").find("option:gt(0)").hide();
			if(currentIndex <= 1){
				$("select[name = 'maxDan']").find("option").show();
			}else{
				$("select[name = 'maxDan']").find("option:gt("+(currentIndex-1)+")").show();
			}
			
			/*
			// 내가 한것
			var res = "";
			for(var i = value; i <= 9; i++){
				res += "<option value ='"+i+"'>"+i+"단</option>";
			}
			console.log(res);
			$("select[name = 'maxDan']").empty();
			$("select[name = 'maxDan']").html(res);
			 */
		})		
	});
</script>
</head>
<body>
	<h4>구구단 범위입력</h4><br/>
	<form id = "gugudanForm" action="../04/gugudan.jsp" method="post">
		<select name = "minDan">
			<option value>단</option>
			<%
				String pattern = "<option value = '%1$d'>%1$d단</option>";
				for(int dan = 2; dan <=9; dan++){
					out.println(String.format(pattern, dan));
				}
			%>
		</select>
		<select name = "maxDan">
			<option value>단</option>
			<%
				for(int mul = 2; mul <=9; mul++){
					out.println(String.format(pattern, mul));
				}
			%>
		</select>
		<button type = "submit">전송</button>
	</form>
	<div id="resultDiv">
	
	
	
	</div>
	
</body>
</html>