<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf" %>
	<link type="text/css" rel="stylesheet" href="${root }/resources/css/shop.css"/>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>
		<!-- Content starts 필요 시 임의로 그리드 조정 -->
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<div class="receipt-form"><!-- 주문상품내역 -->
						<table class="table">
							<thead>
								<tr>
									<th>상품</th>
									<th>가격</th>
									<th>수량</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${productList }" var="product" varStatus="status">
								<c:forEach items="${shopList }" var="shop" begin="${status.index }" end="${status.index }">
								<c:forEach items="${imageList }" var="image" begin="${status.index }" end="${status.index }">
								<tr>
									<td>
										<a title="${shop.shopTitle }" href="${root }/shop/${shop.mainCategoryName }/${shop.subCategoryName }/${shop.shopCode}/${product.productCode }" target="_blank">
											<span>
												<!-- 등록된 이미지가 없을 때 -->
												<c:if test="${image.imageURL eq null }">
													<img src="${productImage }/no-image.jpg" style="width:50px;height:50px;"/>
												</c:if>
												<!-- 등록된 이미지들을 나열 -->
												<c:if test="${image.imageURL ne null }">
												<img src="${productImage }/${image.imageURL}"  style="width:50px;height:50px;"/>
												</c:if>
											</span>
											<span>${shop.shopTitle }</span>
											<span>(${product.firstOptionGroupName }: ${product.firstOptionName },</span>
											<span>${product.secondOptionGroupName }: ${product.secondOptionName })</span>
										</a>
									</td>
									<td>${shop.shopPrice }</td>
									<td>${product.quantity }</td>
								</tr>
								</c:forEach>
								</c:forEach>
								</c:forEach>
							</tbody>
						</table>
					</div><!-- 주문상품내역 end -->
					<div class="pricetag"><!-- 총 결제 금액 -->
						<span>총 결제 금액 : ${order.orderAmount }</span>
					</div><!-- 총 결제 금액 end -->
					<div class="delivery-info"><!-- 배송 정보 -->
						<span>배송 정보 작업 중 : 회원 api 필요</span>
					</div><!-- 배송 정보 end -->
					<div class="purchase-form"><!-- 버튼 -->
						<a href="${root }/shop" class="btn btn-default" role="btn">다른 상품 쇼핑하기</a>
					</div><!-- 버튼 end -->
				</div><!-- content end -->
			</div><!-- col end -->
		</div><!-- row end -->
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>