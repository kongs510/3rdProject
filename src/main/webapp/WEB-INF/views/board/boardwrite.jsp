<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<!-- 글쓰기 api 오류 나서, 이 페이지는 template을 따로 넣었음 -->

<% request.setAttribute("root", request.getContextPath()); %>

	<link rel="stylesheet" type="text/css" href="/backpackers/resources/css/bootstrap.css">
	<script type="text/javascript" src="/backpackers/resources/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="/backpackers/resources/js/bootstrap.js"></script>
<!-- kakao -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


<title>Backpackers : 3rd project by group 3</title>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
	
<style type="text/css">
 
 #board_subject{
 width: 350px;    
   height: 25px;
  font-size: 15px;
 }
 
 
 #board_content{
   
  width: 900px;    
   height: 400px;
    font-size: 15px;
 }
 
 
 #submitcontent,#cancle{
  font-size: 15px;
   position: relative;
  left: 1010px;
 }
</style>
<script type="text/javascript">
 $(document).ready(function() {
	 
	 
	 
	 $("#submitcontent").on('click',function (){
	 		alert("게시물이 등록되었습니다..");
			
		 });
	$('#summernote').summernote({
		height : 300,
		minHeight : null,
		maxHeight : null,
		focus : true,
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = 0; i < files.length; i++) {
					sendFile(files[i], this);
				}
			}
		}
	});
});

function sendFile(file, el) {
	console.log(file)
	var form_data = new FormData();
	form_data.append("file",file);
	$.ajax({
		data : form_data,
		type : "POST",
		url : '/backpackers/board/image',
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(url) {
			$(el).summernote('insertImage', url, function($image) {
				$image.css('width', "50%");
				//$('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>')
			});
		}
	});
} 
</script>
<title>글쓰기</title>
</head>

<body>
	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${root }">Backpackers</a>
			</div>
				
				<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="${root }/gear">백패킹<span class="sr-only">(current)</span></a></li>
					<li><a href="${root }/sights/map">명소</a></li>
				  <li><a href="${root }/board/">게시판</a></li>
					<li><a href="${root }/#">쇼핑</a></li>
				</ul>
				<ul class="navbar-form navbar-right">
        <c:if test="${user != null}">
        	<c:if test="${user.grade == 1}">
		 ${user.userId }님 입장을 환영합니다
 		<button type="submit" class="btn btn-default"><a href="${root }/admin/adminPage">관리자 페이지</a></button>
		</c:if>
        	<c:if test="${user.grade == 0}">
		 ${user.userId }님 입장을 환영합니다
 		<button type="submit" class="btn btn-default"><a href="${root }/user/myPage">마이 페이지</a></button> 
		</c:if>	
        <button type="submit" class="btn btn-default"><a href="${root }/user/logout">로그아웃</a></button>
        </c:if>
		<c:if test="${user == null}"> 	  
		<button type="submit" class="btn btn-default"><a href="${root }/user/login">로그인</a></button>
        <button type="submit" class="btn btn-default"><a href="${root }/user/register">회원가입</a></button>	 	  
		</c:if>
        </ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>



<body>


<form  class="form-horizontal" method="post" action="./">
<div class="ex1">
<input type="text" class="form-control" id="board_subject" name="board_subject" placeholder="제목을 입력해주세요">
</div>
<div class="ex2" style="">
	<div class="form-group">
			<textarea class="form-control" id="summernote" name="board_content"
				placeholder="내용을 입력해주세요" maxlength="140" rows="7"></textarea>
		</div>
</div>
<div class="ex3">
<button class="btn btn-primary" id="submitcontent" type="submit">등록</button>
<button class="btn btn-danger" id="cancle" type="reset">취소</button>
</div>
</form>



</html>