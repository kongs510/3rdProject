<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf" %>
	<link type="text/css" rel="stylesheet" href="${root }/resources/css/shop.css"/>
	<style type="text/css">
	
		li{
		 	list-style: none;
		}
		
		ul {
	    	padding-inline-start: 10px;
		}
		
		.card {
			border: 0px solid rgba(0,0,0,0.125);
		}
		
		h4, .h4 {
    		font-size: 2rem;
		}
		
		h5, .h5 {
    		font-size: 1.5rem;
		}
		
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>
		<!-- Content starts 필요 시 임의로 그리드 조정 -->
		<div class="row">
			<div class="col-xs-12 col-sm-2 col-md-2">
				<div class="category">
					<nav>
						<ul class="nav nav-category nav-pills nav-stacked">
							<c:forEach items="${categoryList }" var="bean" varStatus="status">
								<%-- 
								<li data-toggle="collapse" data-target="#subCategory${status.index}" aria-expanded="false"><a href="${root }/shop/${bean.mainCategoryName }">${fn:toUpperCase(bean.mainCategoryName) }</a>
								 --%>
								<li role="presentation" id="btn-category-${status.index}"  data-toggle="collapse" data-target="#subCategory${status.index}" aria-expanded="false"><a>${fn:toUpperCase(bean.mainCategoryName) }</a>
									<ul class="nav collapse" id="subCategory${status.index}" role="menu" aria-labelledby="btn-category-${status.index}">
										<c:forEach items="${bean.subCategoryList }" var="subCategory">
											<li><a href="${root }/shop/${bean.mainCategoryName }/${subCategory.subCategoryName }">${fn:toUpperCase(subCategory.subCategoryName) }</a></li>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</nav>
				</div><!-- category navigation end -->
				<!-- 현재 카테고리에 맞게 bold 처리 -->
				<script type="text/javascript">
					document.querySelectorAll('.nav-category > li').forEach(function(mainCategory) {
						mainCategory.querySelectorAll('li').forEach(function(subCategory) {
							subCategory.addEventListener('click', function(e) {
								e.stopPropagation();
							}, false);
						});
					    if(mainCategory.innerText == '${fn:toUpperCase(mainCategoryName)}') {
					    	mainCategory.click();
					    	mainCategory.style.fontWeight = '900';
					    }
					    mainCategory.querySelectorAll('li').forEach(function(subCategory) {
						    if(subCategory.innerText == '${fn:toUpperCase(subCategoryName)}') {
						    	subCategory.style.fontWeight = '900';
						    } else {
						    	subCategory.style.fontWeight = '300';
						    }
					    });
					});
				</script>
			</div>
			<div class="col-xs-12 col-sm-10 col-md-10">
				<div class="content">
					<div class="row">
							<!-- 등록된 상품 페이지를 나열 -->
							<c:forEach items="${shopList }" var="shop">
							 <div class="col-lg-4 mb-4">
							 	<div class="card h-100">
							 
							<c:set value="${productMap[shop.shopCode] }" var="productList"></c:set>
										<ul>
											<!-- 상품 페이지에 등록된 상품을 나열 -->
											<c:set value="${productList[0] }" var="product"/>
												<!-- 상품에 등록된 이미지가 없을 때 -->
												<c:if test="${not imageMap.containsKey(product.productCode)}">
													<li>
														<a href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
															<img src="${productImage }/no-image.jpg" style="width:300px;height:300px;"/>
														</a>
													</li>
												</c:if>
												<!-- 각 페이지에 등록된 상품들의 대표 이미지를 나열 -->
												<c:if test="${imageMap.containsKey(product.productCode)}">
													<li>
														<a href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">
															<img src="${productImage }/${imageMap[product.productCode].imageURL }" style="width:300px;height:300px;"/>
														</a>
													</li>
												</c:if>
										</ul>
										<div class="card-body">
											 <h4 class="card-title">
											 	<a href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }">${shop.shopTitle }</a>
											 </h4>
											 <h5 class="card-title">	
											 	<a href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }"><fmt:formatNumber value="${shop.shopPrice }" pattern="#,###"></fmt:formatNumber>원 </a>
         									 </h5>
										</div>
										</div>	     
									
								</div>
							</c:forEach>
						<!-- 카테고리에 등록된 상품이 없을 때 -->
						<script type="text/javascript">
							/* (function ab() {
								var itemList = document.querySelector('table').children.item(1);
							    if(itemList.childElementCount == 0) {
							    	itemList.innerHTML = '<tr><td>판매 중인 상품이 없습니다.</td><td></td></tr>';
							    }
							})(); */
						</script>
					</div>
				</div>
			</div>
		</div>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>