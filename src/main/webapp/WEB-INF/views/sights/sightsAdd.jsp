<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

	.btn-default {
    	position: relative;
    	left: 35%;
	}


</style>		
	
	
	
	
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

	
	<!-- Content starts -->

<form class="form-horizontal" method="post">
    
		<div class="form-group">
			<label for="title" class="col-sm-2 control-label">명  소</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="title"
					id="title" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="latlng" class="col-sm-2 control-label">좌  표</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="latlng"
					id="latlng" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="ellipsis" class="col-sm-2 control-label">주  소</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="ellipsis"
					id="ellipsis" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="link" class="col-sm-2 control-label">Link</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="link"
					id="link" />
			</div>
		</div>

		<div class="form-group">
			<textarea class="form-control" id="summernote" name="sightsContent"
				placeholder="sightsContent" maxlength="140" rows="7"></textarea>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" a href="./gear">확 인</a></button>
				<button type="reset" class="btn btn-default">취 소</button>
			</div>
		</div>
	</form>
 
	<!-- Content ends -->
	



<script>
$(document).ready(function() {
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
		url : '/backpackers/gear/image',
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
</body>
</html>