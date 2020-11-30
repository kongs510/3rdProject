<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<head>
<%@ include file="/WEB-INF/views/template/head.jspf"%>
<%@ include file="/WEB-INF/views/template/nav.jspf"%>
<%@ include file="/WEB-INF/views/template/header.jspf"%>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
#userPw, #userPw_check, #userPwBtn {
	margin: 0 auto;
	}	
	#loginPage{
    width: 400px;
    height: 800px;
    position: upset;
    margin: 50 auto;
    background: #fff;
    padding: 5px;
    overflow: hidden;
	}
	.form-control{
	height: 50px;
	}
	#btn1{
	 margin-top:50px;
	 width:380px;
	 height: 50px;
	 font-size: 20px;
	 }
	 .myButton {
	box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	background-color:#79bbff;
	border-radius:6px;
	border:1px solid #84bbf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:19px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
}
	.myButton:hover {
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	background-color:#378de5;
}
	.myButton:active {
	position:relative;
	top:1px;
}
	 
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 이메일 인증 HttpRequest.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	//아이디,이름 빈값확인
	$(document).ready(function() {
		$("#btn1").on("click", function() {
			if ($("#userId").val() == "") {
				swal("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
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

	//이메일 인증번호 체크
	function ajaxFromServer() {
		if (httpRequest.readyState == 4) {//DONE,응답완료
			if (httpRequest.status == 200) {//OK
				var resultText = httpRequest.responseText;
				if (resultText == 0) {
					alert("이메일 전송 실패");
				} else if (resultText == 1) { //이메일 전송 완료
					alert("이메일 전송완료")
				}
			} else {
				console.log("AJAX요청/응답 에러")
			}
		}
	}

	function emailCheck() {
		var usercode = document.getElementById("inputCode").value;
		console.log(usercode)
		if (usercode == code) {
			document.getElementById("email-check-msg").innerHTML = "이메일 인증 완료";
			document.querySelector('#email-check-msg').style.color = 'black';
			document.querySelector('#userPw').style.display = 'block';
			document.querySelector('#userPw_check').style.display = 'block';
			document.querySelector('#userPwBtn').style.display = 'block';
			$("#userPwBtn").removeAttr("disabled");
		} else {
			document.querySelector('#userEmail').focus();
			document.querySelector("#userEmail").value = "";
			document.querySelector("#email-check-msg").innerHTML = "이메일 인증 실패";
			document.querySelector('#email-check-msg').style.color = 'red';
			document.querySelector('#userPw').style.display = 'none';
			document.querySelector('#userPwBtn').style.display = 'none';
		}

	}

	// 비밀번호 AJAX 처리
	function findPw(){
		//querySelector :
		//   css선택자로 원하는 html element 객체를 불러온다.
		//  jquery의 $('')와 유사하다.

		var userEmail = document.getElementById('userEmail').value;
		// console.log(userEmail);
		code = Math.floor(Math.random() * 1000000) + 100000;

		var userName = document.querySelector('#userName').value;
		var userId = document.querySelector('#userId').value;
		var userEmail = document.querySelector('#userEmail').value;

		$.ajax({
			type : "POST",
			url : "/backpackers/user/findpwAjax",
			data : {
				userName : userName,
				userId : userId,
				userEmail : userEmail
			},
			success : function(data) {
				if (data != '') {
					document.querySelector('#pw-msg').textContent = '이메일로 전송된 인증번호를 입력해주세요.';
					document.querySelector('#pw-msg').style.color = 'white';
					$("#sendMail").html('<label class="col-md-3" style="color: blue;">인증번호</label>'
					+ '<div class="col-md-6 float">'
					+ ' <input type="text" id="inputCode" name="inputCode" required="required" size="20"><br/>'
					+ ' <input type="button" class="myButton" value="인증하기" onclick="emailCheck()"> '
					+ '</div>')
					emailSend();
				} else {
					document.querySelector("#pw-msg").textContent = '일치하는 정보가 없습니다';
					document.querySelector('#pw-msg').style.color = 'black';
				}
			}
		});

		function emailSend() {
			userEmail = document.getElementById('userEmail').value;
			var param = "email=" + userEmail + "&code_check=" + code;
			 console.log(param)
			sendRequest("GET", "/backpackers/user/send", param, ajaxFromServer);
			swal("이메일을 전송했습니다!")
		}

	}

	$(document).ready(function(){
			//정규식 시작
			//모든 공백 체크 정규식
			var empJ = /\s/g;
			// 비밀번호 정규식
			var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,14}$/;
			$("#userPw").blur(
			function() {
				if (pwJ.test($(this).val())) {
					// console.log(pwJ.test($(this).val()));
					console.log('Password Check');
				} else {
					$("#userPw").val('');
					$("#userPw").focus();
					$('#pw-check-msg').text('대소문자, 숫자와 특수문자를 하나 이상 넣어 7~14자 사이로 작성해야 합니다');
					$('#pw-check-msg').css('color','red');
				}
			});			
						// 정규식 끝
						// 비밀번호 일치여부
						$(function() {
							$('#userPw_check').blur(
									function() {
										if ($('#userPw').val() != $('#userPw_check').val()) {
											$('#pw-check-msg').html('비밀번호가 일치하지 않습니다<br><br>');
											$('#pw-check-msg').css('color','#f82a2aa3');
											$('#userPw_check').val('');
										} else {
											$('#pw-check-msg').html('비밀번호가 일치합니다!<br><br>');
											$('#pw-check-msg').css('color','#199894b3');
										}
									});
						});
					});
</script>
<body>
	<div id="loginPage">
		<div class="login-box-body" style="margin-top: 5%;">
			<h2 style="font-family: 'Do Hyeon', sans-serif; cursive; text-align: center; margin-top: 40px; font-size: 50px">비밀번호 찾기</h2>
			<form action="/backpackers/user/pwModify" method="POST">
				<div class="form-group has-feedback">
					<input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력하세요">
				</div>
				<div class="form-group has-feedback">
					<input type="text" name=userName id="userName" class="form-control" placeholder="이름을 입력하세요">
				</div>
				<div class="form-group has-feedback">
					<input type="text" name=userEmail id="userEmail" class="form-control" placeholder="가입당시 이메일을 입력하세요">
				</div>

				<button type="button" class="btn btn-outline-danger btn-lg" id="btn1" onclick="findPw();">비밀번호찾기</button>
				<br/><br/> <span id="pw-msg" class="pw-msg" style="font-size: 14px; text-align: center;"></span>

				<div class="form-group" id="sendMail" style="text-align: center;"></div>
				<div class="form-group" id="email-check" style="font-size: 8px; text-align: center;">
					<span id="email-check-msg" class="email-check-msg" style="font-size: 8px; text-align: center;"></span>
				</div>
				<br/>
				<br/>
				<br/>
				<div class="row">
					<input type="password" id="userPw" name="userPw"
						class="col-md-8 form-control" placeholder="비밀번호" style="font-size: 13px; color: black; text-align: center; display: none;"><br />
				</div>
				<div class="row">
					<input type="password" id="userPw_check" name="userPw_check" class="col-md-8 form-control" placeholder="비밀번호 확인" required="required" style="font-size: 13px; color: black; text-align: center; display: none;">
				</div>
					<div class="form-group" id="checking" style="font-size: 8px; text-align: center;"><br/> 
					<span id="pw-check-msg" class="pw-check-msg" style="font-size: 13px; text-align: center;"></span>
				</div>
				<br/><input type="submit" id="userPwBtn" class="myButton" name="userPwBtn" style="display: none;" value="비밀번호 변경하기" disabled>
			</form>
			<form action="/backpackers/user/pwModify" method="POST"></form>
		</div>
	</div>
</body>
</html>