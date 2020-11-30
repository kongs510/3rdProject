<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html lang="en">
<head>

<%@ include file="/WEB-INF/views/template/head.jspf" %>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 페이지</title>
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

.btn {
	font-size: 1.5rem;
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

</style>       
        
</head>
    
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@ include file="/WEB-INF/views/template/header.jspf" %>

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
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#backpacking">백패킹 글 관리</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#sights">명소 글 관리</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#shop">쇼핑 상품 관리</a></li>
                    
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
        
            <!-- 백패킹 글 관리 -->
            <section class="resume-section" id="backpacking">
                <div class="resume-section-content">
                    <h2 class="mb-5">백패킹</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">백패킹 게시판</h3>
                            <a class="btn btn-default" href="${root}/gear" role="button">게시판 관리</a>
                            <p>이 게시판은 관리자가 백패킹에 관련 정보 글을 올리는 곳으로, 관리자만 글을 쓰고 관리 할 수 있습니다.</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">관리자 전용</span></div>
                    </div>
                </div>                                        
            </section>
			<hr class="m-0" />
			
            <!-- 명소 글 관리 -->
            <section class="resume-section" id="sights">
                <div class="resume-section-content">
                   <h2 class="mb-5">명소</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">명소 게시판</h3>
                            <a class="btn btn-default" href="${root}/sights/list" role="button">게시판 관리</a>
                            <p>이 게시판은 관리자가 백패킹에 적합한 명소를 지도에 표기하고 명소에 관한 글을 올리는 곳으로, 관리자만 글을 쓰고 관리 할 수 있습니다.</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">관리자 전용</span></div>
                    </div>
                </div>                                        
            </section>
            <hr class="m-0" />
            
            <!-- 쇼핑 상품 관리 -->
            
            <section class="resume-section" id="shop">
                <div class="resume-section-content">
                    <h2 class="mb-5">쇼핑 상품 관리</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">쇼핑 상품 등록</h3>
                 <!--       <div class="subheading mb-3">Bachelor of Science</div> -->
                            <a class="btn btn-default" href="${root}/admin/addproduct" role="button">등록하기</a>
                               
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">관리자 전용</span></div>
                    </div>
                    <div class="d-flex flex-column flex-md-row justify-content-between">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">쇼핑 상품 수정/삭제</h3>
                            <a class="btn btn-default" href="${root}/admin/deleteproduct" role="button">수정/삭제하기</a>
                           
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">관리자 전용</span></div>
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