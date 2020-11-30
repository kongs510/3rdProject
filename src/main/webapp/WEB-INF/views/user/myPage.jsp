<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html lang="en">
<head>

<%@ include file="/WEB-INF/views/template/head.jspf" %>    
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@ include file="/WEB-INF/views/template/header.jspf" %>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>유저 My페이지</title>
        <link rel="icon" type="image/x-icon" href="/backpackers/resources/assets2/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/backpackers/resources/css/styles2.css" rel="stylesheet" />
        
 <style type="text/css">

.navbar > .container .navbar-brand, .navbar > .container-fluid .navbar-brand {
    margin-left: -15px;
    margin-top: 25px;
}


#sideNav .navbar-collapse .navbar-nav .nav-item .nav-link {
    display: block;
    margin-top: 35px;
}

section.resume-section {
    padding-left: 3rem;
    padding-right: 3rem;
    padding-top: 1rem;
    padding-bottom: 5rem;
}
#btn1 {
	margin-left: 30px;
	margin-right:30px;
	margin-top: 50px;
	width: 100px;
	height: 30px;
	background-color:#79bbff;
	font-size:12px;
	font-weight:bold;
	cursor:pointer;
	color:#ffffff;
}

#sideNav{
background-color: #AD9AEE !important;
}

</style>       
        
</head>


    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none"></span>
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="/backpackers/resources/assets2/img/profile.jpg" alt="" /></span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#backpacking"></a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#registerEdit">개인정보 수정</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#delete">회원 탈퇴</a></li>
                    
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
			<hr class="m-0" />	
            <!-- 개인정보 수정 -->
            <section class="resume-section" id="registerEdit">
                <div class="resume-section-content">
                   <h2 class="mb-5">개인정보 수정</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-3">
                            <h3 class="mb-0">개인정보 수정페이지</h3>
							<a class="btn btn-default" id="btn1" href="${root}/user/registerEdit" role="button">회원정보 수정</a>
							<br/><br/><br/>
                            <h4>(주)backpackers의 회원정보 수정을 원하시면 위쪽의 버튼을 눌러주세요</h4><br/>
                            <h5>저희 사이트는 고객님의 소중한 개인정보를 보호하려 항상 노력하고있습니다.</h5>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">개인회원 전용</span></div>
                    </div>
                </div>                                        
            </section>
            <hr class="m-0" />
            <!-- 회원 탈퇴 -->
            <section class="resume-section" id="delete">
                <div class="resume-section-content">
                    <h2 class="mb-5">회원 탈퇴</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">회원 탈퇴 페이지</h3>
                            <a class="btn btn-default" id="btn1" href="${root}/user/delete" role="button">회원탈퇴</a> 
                            	<br/><br/><br/>
                            <h4>(주)backpackers의 회원탈퇴를 원하시면 위쪽의 버튼을 눌러주세요</h4><br/>
                            <h5>저희 사이트를 그동안 이용해주셔서 감사합니다. </h5>       
                        </div>
                           <div class="flex-shrink-0"><span class="text-primary">개인회원 전용</span></div>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
               
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Core theme JS-->
        <script src="/backpackers/resources/js/scripts2.js"></script>
        
<%@ include file="/WEB-INF/views/template/footer.jspf" %>
    </body>
</html>