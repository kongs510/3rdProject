<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

	<%@ include file="/WEB-INF/views/template/head.jspf" %>
	
  <title>Full Width Pics - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <!-- 
  <link href="${root }/resources/css/bootstrap.min.css" rel="stylesheet">
   -->

  
 <style type="text/css">
 body {
  padding-top: 56px;
}

.bg-image-full {
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  background-size: cover;
  -o-background-size: cover;
}  

 	body > div > div > div.col-md-10.col-md-offset-1 > div > div.row > a,
 		body > div > div > div.col-md-10.col-md-offset-1 > div > div.row > form > button {
		color: #593196;
		border: 1px solid #cfcfe0;
		font-size: inherit;
	}
	
	body > div > div > div.col-md-10.col-md-offset-1 > div > div.row > a {
		display: -webkit-box;
    	position: relative;
    	left: 2%;
	}

	body > div > div > div.col-md-10.col-md-offset-1 > div > div.row > form > button {
		display: -webkit-box;
    	position: relative;
    	left: 40%;
	}


</style>  

</head>

<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>


  <!-- Header - set the background image for the header in the line below -->
  <header class="py-5 bg-image-full" style="background-image: url('https://images.france.fr/zeaejvyq9bhj/4jKuK6yobYMkGGQ4IO0Kk2/b77683922a8cca16afaa0d2028df39ad/savoie-mont-blanc-ete-header.jpg?w=1120&h=490&q=70&fl=progressive&fit=fill');">
    <img class="img-fluid d-block mx-auto" src="https://images.cdn1.stockunlimited.net/clipart/snow-capped-mountains_1976279.jpg" alt="">
  </header>

  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1> ${bean.title } </h1>
      <p class="lead"> ${bean.sightsContent }</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, suscipit, rerum quos facilis repellat architecto commodi officia atque nemo facere eum non illo voluptatem quae delectus odit vel itaque amet.</p>
    </div>
  </section>

  <!-- Image element - set the background image for the header in the line below -->
  <div class="py-5 bg-image-full" style="background-image: url('https://res.klook.com/image/upload/c_fill,w_960,h_460,f_auto/w_80,x_15,y_15,g_south_west,l_klook_water/activities/d8z2rd1abindhcko27nk.jpg');">
    <!-- Put anything you want here! There is just a spacer below for demo purposes! -->
    <div style="height: 200px;"></div>
  </div>

  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1></h1>
      <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, suscipit, rerum quos facilis repellat architecto commodi officia atque nemo facere eum non illo voluptatem quae delectus odit vel itaque amet.</p>
    </div>
  </section>


	<div class="row">
     	<c:if test="${user != null}">
        	<c:if test="${user.grade == 1}">	
 			
 				<a href="./${bean.sightsNo }/edit" class="btn btn-default" role="btn">수 정</a>

		<form method="post">
			<input type="hidden" name="_method" value="delete">
			<button type="submit" class="btn btn-default">삭 제</button>
		</form>
 
 			</c:if>
		</c:if>
	</div>
 
 
  <!-- Bootstrap core JavaScript -->
  <script src="${root }/resources/js/jquery.min.js"></script>
  <script src="${root }/resources/js/bootstrap.bundle.min.js"></script>

	<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>

</html>
