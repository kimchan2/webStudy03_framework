<%@page import="kr.or.ddit.servlet04.FileWrapper"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.36.1/skin-win8/ui.fancytree.min.css" rel="stylesheet">

<script type="text/javascript" src = "<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.36.1/jquery.fancytree-all-deps.min.js"></script>
<script type="text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.36.1/jquery.fancytree-all.min.js"></script>

<script type="text/javascript">
	$(function() {
		var tree1 = null;
		var commandProcess = function(param) {
			
			let command = param.command;
			let data = param.data;
			let node = null;
			let destFolder = null;
			if(param.node){
				node = param.node;
				destFolder = node.key;
			}
			let srcFile = data.otherNode.key;
			$.ajax({
				
				data : {
					command : command,
					srcFile : srcFile,
					destFolder: destFolder
				        
				},
				method : "post",
				dataType : "json", //Accept, Content-Type - 한쌍으로감
				success : function(resp) {
					if(!resp.success){
						
						return;
					}
					if(command == "COPY"){
						data.otherNode.copyTo(node);
	          		}else if(command == "MOVE") {
						data.otherNode.moveTo(node, data.hitMode);
	          		}else{
	          			data.otherNode.remove();
	          		}
				},
				error : function(errResp) {
				
				}
			});
		}
		
		$("#tree1").fancytree({
			extensions: ["dnd", "edit"],
			selectMode: 1,

	      	lazyLoad: function(event, data){
		        data.result = {
		        		url: "<%= request.getContextPath() %>/serverExplorer.do?url="+data.node.key
		        };
			},
			init:function(event, data){
				tree1 = data.tree;
				
			},
			dnd: {
		        autoExpandMS: 400,
		        focusOnClick: true,
		        preventVoidMoves: true, // Prevent dropping nodes 'before self', etc.
		        preventRecursiveMoves: true, // Prevent dropping nodes on own descendants
		        dragStart: function(node, data) {
		        	console.log("Start" + data);
		        	
		          return true;
		        },
		        dragEnter: function(node, data) {
		        	console.log("Enter" + node);
					console.log("=================dragEnter====================");
					console.log(node);
					console.log(data);
					console.log("=================dragEnter====================");
					
					let pass = false;
					pass = node.folder && node != data.otherNode.parent ;
					console.log(node.parent != data.otherNode.parent);
					
					return pass;
		        },
		        dragDrop: function(node, data) {
		           // 서버사이드의 진짜 자원에 대한 커멘드 처리
		        
				
				console.log("=================dragDrop====================");
          		console.log("node : " + node);
          		console.log("data : " + data);
          		console.log("=================dragDrop====================");
	          	
          		let param ={
          				
          				node : node,
          				data : data,
          				command : data.originalEvent.ctrlKey?"COPY":"MOVE"
          				
          		}
          		commandProcess(param);
				}
			}
		});
		
		
		//내가한거!
// 		$("ul").on("click", "li", function(event) {
// 			event.stopPropagation();
// 			let li = $(this);
			
// 			if(li.attr("class") == "dir"){
// 				let child = li.find("ul").get(0);
// 				if(child){
// 					let vis = $(child).is(":visible");
// 					if(vis){
// 						$(child).hide();
// 					}else{
// 						$(child).show();
// 					}
// 				}else{
// 					let data = $(this).attr("id");
// 					console.log(li);
// 					$.ajax({
// 						url : "serverExplorer.do",
// 						data : {uri : data},
// 						dataType : "html",
// 						success : function(resp) {
// 							li.append(resp);
// 						},
// 						error : function() {
		
// 						}
// 					});
// 				}
// 			}// if문 끝
// 		})
		
		
	})

</script>
</head>
<body>
<h4>Model2 구조로 webStudy01 컨텍스트의 익스플로러 구현</h4>
<div id = "tree1">
<ul>
	<li id = "/" class = "folder lazy"><%= request.getContextPath() %></li>

</ul>
</div>
</body>
</html>








