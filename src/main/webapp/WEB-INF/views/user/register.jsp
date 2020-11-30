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

#registerPage{
	width: 600px;
	height: 1300px;
	position: relative;
    margin: 50 auto;
	background: #fff;
	padding: 5px;
	overflow: hidden;
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
#idcheck {
	box-shadow:inset 11px -35px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:8px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	text-decoration:none;
	text-shadow:0px 0px 0px #ffffff;
}
#idcheck:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
#idcheck:active {
	position:relative;
	


</style>

<title>회원가입</title>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">
	var idCheckPassed = false;
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
			if (!idCheckPassed) {
				swal("중복된 아이디입니다");
				return false;
			}
			var idChkVal = $("#idChk").val();
			if (idChkVal == "N") {
				swal("중복확인 버튼을 눌러주세요.");
				return false;
			} else if (idChkVal == "Y") {
				$("#regForm").submit();
			}
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
	//아이디체크
	function fn_idCheck() {
		$.ajax({
			url : "${root}/user/idCheck",
			type : "post",
			dataType : "text",
			data : {
				"userId" : $("#userId").val()
			},
			success : function(data) {
				if (data == 1) {
					swal("중복된 아이디입니다.");
					idCheckPassed = false;
				} else if (data == 0) {
					$("#idCheck").attr("value", "Y");
					swal("사용가능한 아이디입니다.");
					idCheckPassed = true;
				}
				console.log(idCheckPassed);
			}
		})
	}
	$(document).ready(
			function() {
			//정규식 시작
			//모든 공백 체크 정규식
			var empJ = /\s/g;
			// 비밀번호 정규식
			var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,14}$/;
			// 휴대폰번호 체크 정규식
			var phoneExp =/^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
			// 이메일 체크 정규식
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

				$("#userPw").blur(function() {
					if (pwJ.test($(this).val())) {
					// console.log(pwJ.test($(this).val()));
						console.log('Password Check');
						} else {
						//$("#userPw").val('');
						//$("#userPw").focus();
							$('#pw-check-msg').text('대소문자, 숫자와 특수문자를 하나 이상 넣어 7~14자 사이로 작성해야 합니다');
								$('#pw-check-msg').css('color','red');
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
										if ($('#userPw').val() != $('#userPw2').val()) {
											$('#pw-check-msg1').html('비밀번호가 일치하지 않습니다<br><br>');
											$('#pw-check-msg1').css('color','#f82a2aa3');
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
		<form action="${root}/user/registerPost" method="post" id="registerPage">		
			 	<div class="row">
				 <label class="col-md-2 control-label">아이디</label>
				 	<div class="col-md-6">
						<input type="text" id="userId" name="userId" class="form-control"  placeholder="아아디">
				 	</div>
						<button class="col-md-2 col-md-offset-1 form" type="button" id="idCheck" onclick="fn_idCheck();" value="N">중복확인</button>
				</div>
			
				<div class="row">
					  <label class="col-md-2 control-label">이름</label>
					  <div class="col-md-6">
						<input type="text" id="userName" name="userName" class="form-control" placeholder="이름">
						</div>
				</div>
				
				<div class="row">
				 	<label class="col-md-2 control-label">이메일</label>
						<div class="col-md-6">
							<input type="email" id="userEmail" for="signupEmail" maxlength="50" name="userEmail" class="form-control" placeholder="이메일">
						</div>
				</div>
				
				<div class="row">
					<label class="col-md-2 control-label">비밀번호</label>
						<div class="col-md-6">
							<input type="password" id="userPw" name="userPw" class="form-control" placeholder="비밀번호">
						</div>
				</div>
								<span id="pw-check-msg" class="pw-check-msg" style="font-size: 13px; text-align: center;"></span>
				
				<div class="row">
					<label class="col-md-2 control-label">비번 확인</label>
						<div class="col-md-6">
							<input type="password" id="userPw2" class="form-control" placeholder="비밀번호 확인">
						</div>
				</div>
								<span id="pw-check-msg1" class="pw-check-msg1" style="font-size: 13px; text-align: center;"></span>
								
				<div class="row">
					<label class="col-md-2 control-label">휴대번호</label>
						<div class="col-md-6">
				<input type="text" id="phoneNum" name="phoneNum" class="form-control" placeholder="핸드폰 번호를 입력해주세요(-제외한 숫자만 입력)">
						</div>
				</div>
				<div class="row">
				
					<label class="col-md-2 control-label">주소</label>
						<div class="col-md-6">
							<input type="text" id="sample6_postcode" class="form-control" name="postCode" placeholder="우편번호">
						</div>
							<input type="button" class="col-md-2 col-md-offset-1" id="idCheck" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>		
						<div class="col-md-6 col-md-offset-2">
							<input type="text" id="sample6_address" name="address" class="form-control" placeholder="주소"><br> 
							<input type="text" id="sample6_detailAddress" name="detailAddress" class="form-control" placeholder="상세주소"> 
							<input type="text" id="sample6_extraAddress" name="extraAddress" class="form-control" placeholder="참고항목">
						</div>
				</div>

			<div class="row" style="margin-left: 20px;">
				<div class="col-md-8">
				<h4 class="glores-A-title">개인정보처리방침</h4>
				<div class="glores-A-agree" style="width: 550px; height: 300px; overflow: scroll; overflow-x: hidden; magin: 0 auto; border: 1px solid #ccc; padding: 10px; background: white">
					<h5 style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; margin: 0px; padding: 0px; font-size: 15px;">수집하는
					개인정보의 항목</h5>
					<p
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; margin-top: 15px; padding-left: 10px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68);">회사는
						회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
					<ul
						style="margin: 15px 0px 0px; padding: 0px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68); font-family: &amp; amp;">
						<li style="margin-top: 10px; padding-left: 10px;"><strong>-
								수집항목</strong>&nbsp;:&nbsp;<span class="privacy_column_list">아이디,
								별명, 패스워드, 성명, e-mail, 주소, 전화번호, 휴대전화, 생년월일, 결혼, 추천인 아이디</span></li>
						<li style="margin-top: 10px; padding-left: 10px;"><strong>-
								개인정보 수집방법</strong>&nbsp;:&nbsp;홈페이지(회원가입)</li>
					</ul>
					<h5
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; margin: 40px 0px 0px; padding: 0px; font-size: 15px;">개인정보의
						수집 및 이용목적</h5>
					<p
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; margin-top: 15px; padding-left: 10px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68);">회사는
						수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
					<ul
						style="margin: 15px 0px 0px; padding: 0px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68); font-family: &amp; amp;">
						<li style="margin-top: 10px; padding-left: 10px;"><strong>-
								서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</strong>
							<p
								style="margin-top: 15px; padding-left: 10px; list-style-type: none;">구매
								및 요금 결제, 물품배송 또는 청구지 등 발송</p></li>
						<li style="margin-top: 10px; padding-left: 10px;"><strong>-
								회원 관리</strong>
							<p
								style="margin-top: 15px; padding-left: 10px; list-style-type: none;">회원제
								서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인,
								연령확인</p></li>
					</ul>
					<h5
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; margin: 40px 0px 0px; padding: 0px; font-size: 15px;">개인정보의
						보유 및 이용기간</h5>
					<p
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; margin-top: 15px; padding-left: 10px; font-size: 13px; list-style-type: none; color: rgb(68, 68, 68);">회사는
						개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.</p>
				</div>

				<h4 class="glores-A-title">이용약관</h4>
				<div class="glores-A-agree"
					style="width: 550px; height: 300px; overflow: scroll; overflow-x: hidden; magin: 0 auto; border: 1px solid #ccc; padding: 10px; background: white">
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제1조(목적)</h4>
						<p
							style="font-size: 13px; line-height: 1.5em; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							이 약관은 백패킹 회사(전자상거래 사업자)가 운영하는 백패킹 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷
							관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리,의무 및 책임사항을 규정함을 목적으로
							합니다.<br>※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을
							준용합니다」
						</p>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제2조(정의)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”
								이란 백패킹 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를
								이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도
								사용합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“이용자”란
								“몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">‘회원'이라
								함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는
								서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">‘비회원'이라
								함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</li>
						</ol>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제3조 (약관등의 명시와 설명 및 개정)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함),
								전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수
								있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수
								있도록 할 수 있습니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰은
								이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을
								이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								전자상거래등에서의 소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법,
								정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을
								개정할 수 있습니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이
								약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터
								적용일자 전일까지 공지합니다.<br>다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일
								이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가
								알기 쉽도록 표시합니다.
							</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이
								약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에
								대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를
								원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이
								적용됩니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">이
								약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률,
								약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</li>
						</ol>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제4조(서비스의 제공 및 변경)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								다음과 같은 업무를 수행합니다.
								<ol
									style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;">
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">재화
										또는 용역에 대한 정보 제공 및 구매계약의 체결</li>
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">구매계약이
										체결된 재화 또는 용역의 배송</li>
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타
										“몰”이 정하는 업무</li>
								</ol>
							</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의
								내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는
								용역의 내용을 게시한 곳에 즉시 공지합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이
								제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할
								경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">전항의
								경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는
								경우에는 그러하지 아니합니다.</li>
						</ol>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제5조(서비스의 중단)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								컴퓨터 등 정보통신설비의 보수점검?교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을
								일시적으로 중단할 수 있습니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다.
								단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">사업종목의
								전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한
								방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준
								등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 e-Money 등을 “몰”에서 통용되는 통화가치에 상응하는
								현물 또는 현금으로 이용자에게 지급합니다.</li>
						</ol>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제6조(회원가입)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">이용자는
								“몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을
								신청합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
								<ol
									style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;">
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">가입신청자가
										이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격
										상실후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.</li>
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">등록
										내용에 허위, 기재누락, 오기가 있는 경우</li>
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타
										회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우</li>
								</ol>
							</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원가입계약의
								성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원은
								제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을
								알려야 합니다.</li>
						</ol>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제7조(회원 탈퇴 및 자격 상실 등)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원은
								“몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">회원이
								다음 각호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
								<ol
									style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;">
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">가입신청시에
										허위내용을 등록한 경우</li>
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”을
										이용하여 구입한 재화등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li>
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">다른사람의
										“몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</li>
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”을
										이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
								</ol>
							</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이
								회원 자격을 제한?정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우
								“몰”은 회원자격을 상실시킬 수 있습니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이
								회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한
								30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</li>
						</ol>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제8조(회원에 대한 통지)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”이
								회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만,
								회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</li>
						</ol>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제9조(구매신청)</h4>
						<div style="font-size: 13px; line-height: 1.4em;">
							“몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에
							있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수
							있습니다.
							<ol
								style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;">
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">재화등의
									검색 및 선택</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">성명,
									주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">약관내용,
									청약철회권이 제한되는 서비스, 배송료?설치비 등의 비용부담과 관련한 내용에 대한 확인</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">이
									약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">재화등의
									구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">결제방법의
									선택</li>
							</ol>
						</div>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제10조 (계약의 성립)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는
								경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야
								합니다.
								<ol
									style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;">
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">신청
										내용에 허위, 기재누락, 오기가 있는 경우</li>
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">미성년자가
										담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li>
									<li
										style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타
										구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우</li>
								</ol>
							</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”의
								승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”의
								승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보등을
								포함하여야 합니다.</li>
						</ol>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제11조(지급방법)</h4>
						<div style="font-size: 13px; line-height: 1.4em;">
							“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단,
							“몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
							<ol
								style="padding: 0px; margin: 15px 0px 0px; list-style-type: none;">
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">폰뱅킹,
									인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">선불카드,
									직불카드, 신용카드 등의 각종 카드 결제</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">온라인무통장입금</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">전자화폐에
									의한 결제</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">수령시
									대금지급</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">마일리지
									등 “몰”이 지급한 포인트에 의한 결제</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”과
									계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제</li>
								<li
									style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">기타
									전자적 지급 방법에 의한 대금 지급 등</li>
							</ol>
						</div>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제12조(수신확인통지.구매신청 변경 및 취소)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">수신확인통지를
								받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수
								있고 “몰”은 배송전에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을
								지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</li>
						</ol>
						<p class="sc_ptop"
							style="font-size: 13px; line-height: normal; text-align: right; margin-top: 15px; padding-left: 10px; list-style-type: none;">
							<br>
						</p>
					</div>
					<div class="acon"
						style="font-family: &amp; amp; amp; amp; quot; Noto Sans&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Nanum Gothic&amp;amp; amp; amp; quot; , &amp; amp; amp; amp; quot; Malgun Gothic&amp;amp; amp; amp; quot; , sans-serif; color: rgb(68, 68, 68); font-size: 15px; background-color: rgb(255, 255, 255);">
						<h4 style="margin: 0px 0px 0.5em;">제13조(재화등의 공급)</h4>
						<ol
							style="padding: 0px; margin: 15px 0px 0px; font-size: 13px; list-style-type: none;">
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을
								배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부
								또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 “몰”은
								이용자가 재화등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</li>
							<li
								style="margin: 10px 0px 0.5em; line-height: 1.4em; padding-left: 10px;">“몰”은
								이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이
								약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의?과실이 없음을
								입증한 경우에는 그러하지 아니합니다.</li>
						</ol>
					</div>
				</div>
				<p>
					<label class="form-check-label"><input type="checkbox"
						required="required"> 위 이용약관에 동의합니다.</label>
				</p>
			</div>
				</div>

			<div class="form-group has-feedback">
				<button type="submit" id="btn1" class="btn btn-primary btn-lg">가입</button>
				<a href="${root }/user/login" id="btn2" class="btn btn-danger btn-lg">취소</a>
			</div>
		</form>
	</div>
	
<%@ include file="/WEB-INF/views/template/footer.jspf" %>	
	
</body>
</html>