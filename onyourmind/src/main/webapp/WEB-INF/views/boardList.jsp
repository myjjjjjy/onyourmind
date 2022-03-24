<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="kr.smhrd.domain.Board"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>Spring Web MVC 게시판</h2>
		<div class="panel panel-default">
			<div class="panel-heading">BOARD</div>
			<div class="panel-body" id="list"></div>
			<div class="panel-body" id="wform" style="display: none">
				<form id="frm" class="form-horizontal" method="post">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title" placeholder="Enter Title">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용:</label>
						<div class="col-sm-10">
							<textarea row="10" class="form-control" name="content"
								style="resize: none"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="writer" name="writer"
								placeholder="Enter Writer">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-success btn-sm" onclick="goInsert()">등록</button>
							<button type="reset" class="btn btn-warning btn-sm" id="init">취소</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">지능형 IOT융합 SW전문가과정</div>
		</div>
	</div>
	<script>
	
$(document).ready(()=>{
	loadList()
})
function loadList(){
	$.ajax({
		url:"/myapp1/boardList.do", 
		type:"get", 
		dataType:"json",
		success:htmlView,
		error:function(){
			alert("error!")
		}
	})
}
function htmlView(data){
	var result = "<table class='table table-bordered table-hover'>"
	result += "<tr>"
	result += "<td>번호</td>"
	result += "<td>제목</td>"
	result += "<td>작성자</td>"
	result += "<td>작성일</td>"
	result += "<td>조회수</td>"
	result += "</tr>"
	//반복문 
	$.each(data, (index, vo)=>{
		result += "<tr>"
		result += "<td>"+vo.idx+"</td>"
		result += "<td id='t"+vo.idx+"'><a href='javascript:contentView("+vo.idx+")'>"+vo.title+"</a></td>"
		result += "<td id='w"+vo.idx+"'>"+vo.writer+"</td>"
		result += "<td>"+vo.indate+"</td>"
		result += "<td>"+vo.count+"</td>"
		result += "<td id='u"+vo.idx+"'><button class='btn btn-success btn-sm' onclick='goUpdate("+vo.idx+")'>수정</button></td>"
		result += "<td><button class='btn btn-warning btn-sm' onclick='goDelete("+vo.idx+")'>삭제</button></td>"
		result += "</tr>"
		
		result += "<tr style='display:none' id='cv"+vo.idx+"'>"
		result += "<td>내용</td>"
		result += "<td colspan='4'>"
		result += "<textarea id='c"+vo.idx+"' rows='6' class='form-control'>"+vo.content+"</textarea>"
		result += "<br>"
		result += "<button class='btn btn-success btn-sm' onclick='updateCt("+vo.idx+")'>수정</button>&nbsp"
		result += "<button class='btn btn-warning btn-sm' onclick='closeCt("+vo.idx+")'>닫기</button>"
		result += "</td>"
		result += "</tr>"
		
	})
	result += "<tr>"
	result += "<td colspan='5'><button class='btn btn-primary btn-sm' onclick='goView()'>글쓰기</button></td>"
	result += "</tr>"
	result += "</table>"
	$("#list").html(result)
}

/*  function contentView(idx){
	 if( $("#cv"+idx).css("display")=="none"){
		 $("#cv"+idx).css("display", "block")
		 //block과 inline 차이점? 인라인은 자기 컨텐츠 만큼만의 공간을 가짐. block은 한 줄 다 씀! 
 	}else{
 		 $("#cv"+idx).css("display", "none")
 	}
 } */
 function contentView(idx){
	 if( $("#cv"+idx).css("display")=="none"){
		 $("#cv"+idx).slideDown()
		 //block과 inline 차이점? 인라인은 자기 컨텐츠 만큼만의 공간을 가짐. block은 한 줄 다 씀! 
 	}else{
 		 $("#cv"+idx).slideUp()
 	}
 }
 
 function closeCt(idx){
	 $("#cv"+idx).css("display", "none")
 }
 
 function updateCt(idx){
	 var content = $("#c"+idx).val()
	 
	 $.ajax({
		url:"/myapp1/boardContentUpdate.do", 
		type:"post",
		data:{"idx":idx, "content":content},
		success:loadList, 
		error:function(){
			alert("error!")
		}
	})
 }
  
  function deleteCt(idx){
	  $.ajax({
		url:"/myapp1/boardDelete.do",
		type:"get",
		data:{"idx":idx},
		success:loadList, 
		error:function(){
			alert("error!")
		}
		
	  })
  }
  
  function goView(){
		 if( $("#wform").css("display")=="none"){
			 $("#wform").slideDown()
		 }else {
			 $("#wform").slideUp()
		 }
	 }
  
  function goInsert(){
	  var data = $("#frm").serialize()
	  $.ajax({
		  url:"/myapp1/boardInsert.do", 
		  type:"post",
		  data:data,
		  success:loadList,
		  error:function(){
			  alert("error!")
			  }
		  })
/* 	$("#title").val('')
	$("#content").val('')
	$("#wirter").val('') 
	이걸 한번에 할 수 있는 방법-> */
	
	//trigger():이벤트 강제 발생
	$("#init").trigger("click")
  }
  
  function goUpdate(idx){
	  var title=$("#t"+idx).text()
	  $("#t"+idx).html("<input id='nt"+idx+"' type='text' class='form-control' value='"+title+"'>")  
	  var writer=$("#w"+idx).text()
	  $("#w"+idx).html("<input id='nw"+idx+"' type='text' class='form-control' value='"+writer+"'>")
	  
	  var newBtn="<button class='btn btn-info btn-sm' onclick='goUpdate1("+idx+")'>수정하기</button>"
	  $("#u"+idx).html(newBtn)
	  
  }
  
  function goUpdate1(idx){
	  var title=$("#nt"+idx).val()
	  var writer=$("#nw"+idx).val()
	  
	  $.ajax({
		  url:"/myapp1/boardTWUpdate.do", 
		  type:"post",
		  data:{"idx":idx, "title":title, "writer":writer},
		  success:loadList, 
		  error:function(){
			alert("error!")
			}
	  })
  }
  
  function goDelete(idx){
	  $.ajax({
		url:"/myapp1/boardDelete.do",
		type:"get",
		data:{"idx":idx},
		success:loadList, 
		error:function(){
			alert("error!")
			}	
	  })
  }
 
</script>
</body>
</html>