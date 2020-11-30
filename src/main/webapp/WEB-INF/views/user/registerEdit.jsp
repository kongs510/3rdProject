<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<%@ include file="/WEB-INF/views/template/head.jspf"%>
<%@ include file="/WEB-INF/views/template/nav.jspf"%>
<%@ include file="/WEB-INF/views/template/header.jspf"%>
<%
	request.setAttribute("root", request.getContextPath());
%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

#registerPage {
	width: 600px;
	height: 1300px;
	position: relative;
	margin: 3% auto;
	background: #fff;
	padding: 5px;
	overflow: hidden;
}

.form-control {
	height: 40px;
}

#btn1 {
	margin-left: 200px;
	margin-right: 30px;
	margin-top: 50px;
	width: 130px;
	height: 50px;
}

#btn2 {
	margin-top: 50px;
	width: 130px;
	height: 50px;
}
</style>

<title>회원가입</title>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">
	var idCheckPassed = false;
	$(document).ready(function() {
		$("#btn1").on("click", function() {
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
			if ($("#userPw").val() == "") {
				swal("비밀번호 입력해주세요.");
				$("#userPw").focus();
				return false;
			}
			if ($("#userPw2").val() == "") {
				swal("비밀번호 다시 입력해주세요.");
				$("#userPw2").focus();
				return false;
			}
			if ($("#phoneNum").val() == "") {
				swal("휴대전화 번호를 입력해주세요.");
				$("#phoneNum").focus();
				return false;
			}

			/* var idChkVal = $("#idChk").val();
			if (idChkVal == "N") {
				swal("중복확인 버튼을 눌러주세요.");
				return false;
			} else if (idChkVal == "Y") {
				$("#regForm").submit();
			} */
		});
	});
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

	$(document)
			.ready(
					function() {
						//정규식 시작
						//모든 공백 체크 정규식
						var empJ = /\s/g;
						// 비밀번호 정규식
						var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,14}$/;
						// 휴대폰번호 체크 정규식
						var phoneExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
						// 이메일 체크 정규식
						var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

						$("#userPw")
								.blur(
										function() {
											if (pwJ.test($(this).val())) {
												// console.log(pwJ.test($(this).val()));
												console.log('Password Check');
											} else {
												//$("#userPw").val('');
												//$("#userPw").focus();
												$('#pw-check-msg')
														.text(
																'대소문자, 숫자와 특수문자를 하나 이상 넣어 7~14자 사이로 작성해야 합니다');
												$('#pw-check-msg').css('color',
														'red');
											}
										});
						$("#phoneNum").blur(function() {
							if (!phoneExp.test($('#phoneNum').val())) {
								swal("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
								return false
							}
						});
						$("#userEmail").blur(function() {
							if (!regExp.test($('#userEmail').val())) {
								swal("잘못된 이메일입니다. 정확하게 다시입력하세요");
								return false
							}
						});

						// 정규식 끝

						// 비밀번호 일치여부
						$(function() {
							$('#userPw2').blur(
									function() {
										if ($('#userPw').val() != $('#userPw2')
												.val()) {
											$('#pw-check-msg1').html(
													'비밀번호가 일치하지 않습니다<br><br>');
											$('#pw-check-msg1').css('color',
													'#f82a2aa3');
											//$('#userPw2').val('');
										} else {
											$('#pw-check-msg1').html(
													'비밀번호가 일치합니다!<br><br>');
											$('#pw-check-msg1').css('color',
													'#199894b3');
										}
									});
						});
					});
</script>
</head>

<body>
	<div class="container">
		<form  id="registerPage" method="Post">
			<div class="form-group has-feedback">
				<input type="text" id="userId" name="userId" value="${user.userId}"
					class="form-control" placeholder="아이디" readonly="readonly">
				<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="text" id="userName" name="userName"
					class="form-control" value="${user.userName}" placeholder="이름">
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="email" id="userEmail" for="signupEmail" maxlength="50"
					name="userEmail" class="form-control" value="${user.userEmail}"
					placeholder="이메일"> <span
					class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" id="userPw" name="userPw"
					class="form-control" value="${user.userPw}" placeholder="비밀번호">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<span id="pw-check-msg" class="pw-check-msg"
				style="font-size: 13px; text-align: center;"></span>
			<div class="form-group has-feedback">
				<input type="password" id="userPw2" class="form-control"
					value="${user.userPw}" placeholder="비밀번호 확인"> <span
					class="glyphicon glyphicon-log-in form-control-feedback"></span>
			</div>
			<span id="pw-check-msg1" class="pw-check-msg1"
				style="font-size: 13px; text-align: center;"></span>

			<div class="form-group has-feedback">
				<input type="text" id="phoneNum" name="phoneNum"
					class="form-control" value="${user.phoneNum}" placeholder="휴대전화">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="text" id="sample6_postcode" class="form-control"
					name="postCode" value="${user.postCode}" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()"
					value="우편번호 찾기"><br> <input type="text"
					id="sample6_address" name="address" class="form-control"
					value="${user.address}" placeholder="주소"><br> <input
					type="text" id="sample6_detailAddress" name="detailAddress"
					class="form-control" value="${user.detailAddress}"
					placeholder="상세주소"> <input type="text"
					id="sample6_extraAddress" name="extraAddress" class="form-control"
					value="${user.extraAddress}" placeholder="참고항목">
			</div>

			<div class="form-group has-feedback">
				<button type="submit" id="btn1" class="btn btn-primary btn-lg">수정</button>
				<a href="${root }/user/login" id="btn2"
					class="btn btn-default btn-lg">취소</a>
			</div>
		</form>
	</div>
</body>
</html>