<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 	합쳐지고 최소화된 최신 CSS -
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		부가적인 테마
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원탈퇴</title> -->
<%@ include file="/WEB-INF/views/template/head.jspf"%>
<%@ include file="/WEB-INF/views/template/nav.jspf"%>
<%@ include file="/WEB-INF/views/template/header.jspf"%>
</head>
<style>
	#delForm{
    width: 400px;
    height: 500px;
    position: upset;
    margin: 50 auto;
    background: #fff;
    padding: 5px;
    overflow: hidden;
	}
	.form-control{
	height: 50px;
	}


</style>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#cancel").on("click", function(){	
				location.href = "user/login";			    
			})
			$("#submit").on("click", function(){
				if($("#userPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPw").focus();
					return false;
				}	
			});
			$.ajax({
				url : "pwCheck",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success: function(data){
					
					if(data==0){
						alert("패스워드가 틀렸습니다.");
						return;
					}else{
						if(confirm("회원탈퇴하시겠습니까?")){
							$("#delForm").submit();
						}	
					}
				}
			})		
		});
	</script>
<body>
	<section id="container">
		<form method="post" id="delForm">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label> <input
					class="form-control" type="text" id="userId" name="userId"
					value="${user.userId}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPw">패스워드</label> <input
					class="form-control" type="password" id="userPw" name="userPw" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">성명</label> <input
					class="form-control" type="text" id="userName" name="userName"
					value="${user.userName}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="submit" id="cancel">취소</button>
			</div>
		</form>
		<div>
			<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
		</div>
	</section>

</body>

</html>
