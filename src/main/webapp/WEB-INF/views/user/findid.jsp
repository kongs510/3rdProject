<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ include file="/WEB-INF/views/template/head.jspf"%>
<%@ include file="/WEB-INF/views/template/nav.jspf"%>
<%@ include file="/WEB-INF/views/template/header.jspf"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	#loginPage{
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
	#button1{
	 margin-top:50px;
	 width:380px;
	 height: 50px;
	 font-size: 20px;
	 }
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#button1").on("click", function() {
			if ($("#userName").val() == "") {
				swal("이름을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			if ($("#userEmail").val() == "") {
				swal("이메일를 입력해주세요.");
				$("#userEmail").focus();
				return false;
			}
		});
	});
	//아이디 AJAX 처리
	function findId() {
		//querySelector :
		//   css선택자로 원하는 html element 객체를 불러온다.

		var userName = document.querySelector('#userName').value;
		var userEmail = document.querySelector('#userEmail').value;

		$.ajax({
			type : "POST",
			url : "/backpackers/user/findidAjax",
			dataType : "text",
			data : {
				userName : userName,
				userEmail : userEmail
			},
			success : function(data) {
				console.log(data);
				if (data == 'fail') {
					swal("아이디찾기 실패", "아이디 또는 이메일이 일치하지 않습니다.");

				} else if (data != '') {
					swal("아이디찾기 성공", "회원님의  아이디는" + data + "입니다.");
					//var msg  = '회원님의 아이디는 ' + data + ' 입니다';
					//var msg1  = '아이디 와 이메일을 입력하세요';
					//$('.id-msg').append(msg);
				}
			}
		})
	};

	/* function findPw() {
		location.href = "/backpackers/user/findpw";
	}; */
</script>
</head>
<body>
		<div id="loginPage">
		<h2 style="font-family:'Do Hyeon', sans-serif; cursive; text-align: center; margin-top:40px; font-size: 50px" >아이디 찾기</h2>
		<div class="login-box-body" style="margin-top: 5%;">
			<form action="/backpackers/user/findidAjax" method="GET" class="form">
				<div class="form-group has-feedback">
					<input type="text" name="userName"  id="userName" class="form-control" placeholder="이름"> 
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="userEmail"  id="userEmail" class="form-control" placeholder="이메일"> 
				</div>
				<button type="button"  class="btn btn-primary" id="button1" onclick="findId()">아이디찾기</button>
				<br>
				<br> <br>
				<!-- <div id="id-msg-sec" class="id-msg-sec" style="font-size: 30; text-align: ceter; color: black;" onclick="findPw()">비밀번호 찾기로 이동</div> -->
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>
