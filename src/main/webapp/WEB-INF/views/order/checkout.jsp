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
					<div class="order-form"><!-- 주문상품내역 -->
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
						<span>총 결제 금액 : </span>
						<span></span>
					</div><!-- 총 결제 금액 end -->
					<div class="delivery-info"><!-- 배송 정보 -->
						<span>배송 정보 작업 중 : 회원 api 필요</span>
					</div><!-- 배송 정보 end -->
					<div class="purchase-form"><!-- 버튼 -->
						<form action="${root }/order/checkout" method="POST">
							<input type="number" name="orderAmount" hidden="true">
							<input type="text" name="orderCode" value="${order.orderCode }" hidden="true">
							<button type="submit" class="btn btn-default">결제하기</button>
							<button type="button" class="btn btn-default">취소하기</button>
						</form>
					</div><!-- 버튼 end -->
					<script type="text/javascript">
						var orderAmount = 0;
						function sumOrderAmount() {
							document.querySelectorAll('.order-form tbody tr').forEach(function(e) {
							    console.log(e.children.item(1).innerText);
							    console.log(e.children.item(2).innerText);
							    orderAmount += e.children.item(1).innerText * e.children.item(2).innerText;
							});
						}
						function wonFormat(inputNumber) {
						   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						}
						function presentOrderAmount() {
							document.querySelector('.pricetag').lastElementChild.innerText = wonFormat(orderAmount) + '원';
						}
						function setPurchaseAmount() {
							document.querySelector('.purchase-form input:first-child').value = orderAmount;
						}
						
						sumOrderAmount();
						presentOrderAmount();
						setPurchaseAmount();
					</script>
			</div><!-- col end -->
		</div><!-- row end -->
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>