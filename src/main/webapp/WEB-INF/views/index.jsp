<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
    <head>
    
    <% request.setAttribute("root", request.getContextPath()); %>
    
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>backpackers</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.ico" />
       
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- Third party plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
    </head>
    
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="${root }">backpackers</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-right my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/backpackers/gear">백패킹</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/backpackers/sights/map">명소</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/backpackers/board/">게시판</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/backpackers/shop">쇼핑</a></li>
                    </ul>    
			                                           
			      <ul class="navbar-nav ml-auto my-2 my-lg-0">
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
                             
                </div>
            </div>
        </nav>

<!-- Masthead-->
        <header class="masthead">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-uppercase text-white font-weight-bold">첫번째 백패킹을</h1>
                         <h1 class="text-uppercase text-white font-weight-bold">떠날 준비가 되셨다면</h1>
                         <h1 class="text-uppercase text-white font-weight-bold">여기를 방문하세요</h1>
                        <hr class="divider my-4" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 font-weight-light mb-5">다른 백패커들과 소통하고 백패킹을 더 즐겁게 해 줄 장비들을 구입하세요!</p>
                        <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">더 알아보기</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
        <section class="page-section bg-primary" id="about">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="text-white mt-0">당신이 필요한 모든 것이 있습니다</h2>
                        <hr class="divider light my-4" />
                        <p class="text-white-50 mb-4">처음 백패킹을 떠난다고 해서 걱정할 필요 없습니다! 당신을 위한 백패킹 조언과 장비가 있습니다!</p>
                        <a class="btn btn-light btn-xl js-scroll-trigger" href="#services">시작하기</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <h2 class="text-center mt-0">당신을 위한 기능</h2>
                
                <hr class="divider my-4" />
                <div class="row">
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <img class="img-fluid" src="resources/assets/img/portfolio/logo/icon1.jpg" style="width: 100px; height: 70px;"/>
                            <h3 class="h4 mb-2">접근가능성 높은 명소 선정</h3>
                            <p class="text-muted mb-0">집에서 가까운 장소가 백패킹하기 가장 좋습니다!</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                             <img class="img-fluid" src="resources/assets/img/portfolio/logo/icon3.jpg" style="width: 100px; height: 70px;"/>
                            <h3 class="h4 mb-2">필요한 장비</h3>
                            <p class="text-muted mb-0">백패킹에 필수적인 장비와 옷을 구입할 수 있습니다</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                             <img class="img-fluid" src="resources/assets/img/portfolio/logo/icon2.jpg" style="width: 100px; height: 70px;"/>
                            <h3 class="h4 mb-2">다른 백패커들과의 소통</h3>
                            <p class="text-muted mb-0">백패킹에 대해 이야기하고 정보를 습득하세요</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                                           <img class="img-fluid" src="resources/assets/img/portfolio/logo/icon4.jpg" style="width: 100px; height: 70px;"/>
                            <h3 class="h4 mb-2">첫번째 백패킹을 위한 준비</h3>
                            <p class="text-muted mb-0">백패킹 안내글을 보고 가방을 필수적인 장비로 채우세요</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio-->
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row no-gutters">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/index1.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/index1.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/index2.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/index2.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/3.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/3.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/index4.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/index4.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/6.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/6.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/assets/img/portfolio/fullsize/index3.jpg">
                            <img class="img-fluid" src="resources/assets/img/portfolio/thumbnails/index3.jpg" alt="" />

                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50"></div>
                                <div class="project-name"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Call to action-->
        <section class="page-section bg-dark text-white">
            <div class="container text-center">
                <h2 class="mb-4">백패킹 경험이 많은 백패커들과 이야기를 나눠 보세요!</h2>
                <a class="btn btn-light btn-xl" href="${root }/board/">지금 글을 써보세요</a>
            </div>
        </section>
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="mt-0">쇼핑을 하고 저희에게 연락을 주세요!</h2>
                        <hr class="divider my-4" />
                        <p class="text-muted mb-5">다음 백패킹을 위한 질문이 있나요? 저희에게 전화나 이메일을 주시면 가능한 빨리 답해 드리겠습니다</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
                        <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
                        <div>+82 (02) 123-4567</div>
                    </div>
                    <div class="col-lg-4 mr-auto text-center">
                        <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
                        <!-- Make sure to change the email address in BOTH the anchor text and the link target below!-->
                        <a class="d-block" href="mailto:contact@yourwebsite.com">contact@backpackers.com</a>
                    </div>
                </div>
            </div>
        </section>

<!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container"><div class="small text-center text-muted">Copyright © 2020 - Backpackers</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->
        <script src="/backpackers/resources/js/scripts.js"></script>



</body>
</html>
