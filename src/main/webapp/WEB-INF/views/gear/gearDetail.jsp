<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf" %>
<style type="text/css">
	header {
	  position: relative;
	  background-color: black;
	  height: 75vh;
	  min-height: 25rem;
	  width: 100%;
	  overflow: hidden;
	}

	header video {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  min-width: 100%;
	  min-height: 100%;
	  width: auto;
	  height: auto;
	  z-index: 0;
	  -ms-transform: translateX(-50%) translateY(-50%);
	  -moz-transform: translateX(-50%) translateY(-50%);
	  -webkit-transform: translateX(-50%) translateY(-50%);
	  transform: translateX(-50%) translateY(-50%);
	}

	header .container {
	  position: relative;
	  z-index: 2;
	}
	
	header .overlay {
	  position: absolute;
	  top: 0;
	  left: 0;
	  height: 100%;
	  width: 100%;
	  background-color: black;
	  opacity: 0.0;
	  z-index: 1;
	}
	
	@media (pointer: coarse) and (hover: none) {
	  header {
	    background: url('https://source.unsplash.com/XT5OInaElMw/1600x900') black no-repeat center center scroll;
	  }
	  header video {
	    display: none;
	  }
	}
	
	.row {
    display: block;
    }
    
    .card-body {
    	padding: 2rem;
    }
    
    h2, .h2 {
    	font-size: 3rem;
	}

	body > div > div > div.col-md-10.col-md-offset-1 > div > div:nth-child(3) > a,
		body > div > div > div.col-md-10.col-md-offset-1 > div > div:nth-child(3) > form > button {
		color: #593196;
		border: 1px solid #cfcfe0;
		font-size: inherit;
	}
	
	
	
	body > div > div > div.col-md-10.col-md-offset-1 > div > div:nth-child(3) {
		display: -webkit-box;
    	position: relative;
    	left: 3%;
	}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>
				<!-- Content starts -->
					

<header>
  <div class="overlay"></div>
  <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
    <source src="https://storage.googleapis.com/coverr-main/mp4/Mt_Baker.mp4" type="video/mp4">
  </video>
  <div class="container h-100">
    <div class="d-flex h-100 text-center align-items-center">
      <div class="w-100 text-white">
        <h1 class="display-3">백패킹을 떠나요 </h1>
        <p class="lead mb-0">이번엔 어디로 가고 싶으신가요? </p>
      </div>
    </div>
  </div>
</header>

  
    <div class="row">
        
        <div class="card-body">       
          <h2 class="card-title">
            ${bean.gearTitle }
          </h2>
          <p class="card-text">${bean.gearContent }</p>
          	
        </div>
      </div>
     
     
	<div class="row">
     	<c:if test="${user != null}">
        	<c:if test="${user.grade == 1}">	
 			
 			<a href="./${bean.gearNo }/edit" class="btn btn-default" role="btn">수 정</a>

				<form method="post">
				<input type="hidden" name="_method" value="delete">
				<button type="submit" class="btn btn-default">삭 제</button>
				</form>

			</c:if>
		</c:if>
	</div>






					
				<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>