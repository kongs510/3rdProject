<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/template/head.jspf" %>
	<link type="text/css" rel="stylesheet" href="${root }/resources/css/shop.css"/>
	<style type="text/css">
		.input-group {
			display: -webkit-box;
		}
	</style>
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
								<tr class="">
									<th class="" width="5%"><input type="checkbox" class="all-product-checkbox"/></th>
									<th class="" width="50%">상품</th>
									<th class="" width="15%">가격</th>
									<th class="" width="25%">수량</th>
									<th class="" width="5%"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${productList }" var="product" varStatus="status">
								<c:forEach items="${shopList }" var="shop" begin="${status.index }" end="${status.index }">
								<c:forEach items="${imageList }" var="image" begin="${status.index }" end="${status.index }">
								<tr class="">
									<td><!-- 체크박스 -->
										<input type="checkbox" class="product-checkbox" name="product-checkbox${status.index }"/>
									</td><!-- 체크박스 end -->
									<td><!-- 사진 상품명 -->
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
											<span>${shop.shopTitle } (${product.firstOptionGroupName }: ${product.firstOptionName }, ${product.secondOptionGroupName }: ${product.secondOptionName })</span>
										</a>
									</td><!-- 사진 상품명 end -->
									<td class="price">${shop.shopPrice }</td> <!-- 가격 -->
									<td><!-- 수량 조절 버튼 -->
										<div class="input-group">
											<span class="input-group-btn">
												<button type="button" class="quantity-left-minus btn btn-default">
													<span class="glyphicon glyphicon-minus"></span>
												</button>
											</span>
											<input type="number" name="quantity" class="form-control input-number" value="${product.quantity }" min="1" max="100" readonly="readonly" style="background-color:white;cursor:not-allowed">
											<span class="input-group-btn">
												<button type="button" class="quantity-right-plus btn btn-default">
													<span class="glyphicon glyphicon-plus"></span>
												</button>
											</span>
										</div>
									</td><!-- 수량 조절 버튼 end -->
									<td><!-- 상품 삭제 버튼 -->
										<span class="glyphicon glyphicon-remove" aria-hidden="true">
											<p hidden="true">${product.productCode }</p>
											<p hidden="true">${product.secondOptionCode }</p>
										</span>
									</td><!-- 상품 삭제 버튼 end -->
								</tr>
								</c:forEach>
								</c:forEach>
								</c:forEach>
							</tbody>
						</table>
					</div><!-- 주문상품내역 end -->
					<script type="text/javascript"> <!-- 장바구니 삭제 -->
						// 한 줄 삭제 이벤트
						document.querySelectorAll('.glyphicon-remove').forEach(function(e) {
						    e.addEventListener('click', function() {
						    	// DB 삭제 ajax
						    	var productCode = e.firstElementChild.innerText
						    	var secondOptionCode = e.lastElementChild.innerText
						    	$.ajax({
									url:'/backpackers/order/cart',
									method:'DELETE',
									data: JSON.stringify({ 'productCode': productCode, 'secondOptionCode': secondOptionCode}),
									contentType:'application/json; charset=utf-8',
									dataType:'text',
									success:function(data){
										document.querySelector('.shop-message').innerText = 
											e.parentElement.parentElement.children[1].lastElementChild.children[1].innerText
											+ ' 상품을 장바구니에서 삭제했습니다.';
										e.parentElement.parentElement.remove();
										$('#shopModal').modal('show');
									}
								});
						    });
						});
					</script>
					<script> 
					// 체크박스
						var checkAll = document.querySelector('.all-product-checkbox');
						var everyCheckbox = document.querySelectorAll('.product-checkbox');
						var howManyCheck = everyCheckbox.length;
						var countChecked = 0;
						
						// 모두 체크 클릭 시
						checkAll.addEventListener('click', function() {
						    if(this.checked) {
						    	everyCheckbox.forEach(function(current) {
						    		current.checked = true;
						        });   
						    } else {
						    	everyCheckbox.forEach(function(current) {
						    		current.checked = false;
						        });   
						    }
						});
						
						// 체크박스 체크 수 확인
						function checkNumberOfChecked() {
							countChecked = 0;
							everyCheckbox.forEach(function(current) {
								if(current.checked) {
									countChecked += 1;
								}
							});
						}
						
						// 상품 체크 클릭 시
						everyCheckbox.forEach(function(current) {
							current.addEventListener('click', function() {
								checkNumberOfChecked();
								console.log(countChecked);
								console.log(howManyCheck);
								
								if(countChecked < howManyCheck) { // 하나라도 체크 해제한 경우
									checkAll.checked = false;
								} 
								if(countChecked == howManyCheck) { // 모두 체크한 경우
									checkAll.checked = true;
								}
								presentOrderAmount();
							});
						});
						
						checkAll.click();
					</script>
					<script type="text/javascript"> 
					// 수량 조절
						document.querySelectorAll('.input-number').forEach(function(current, idx) {
							// 수량을 빼는 이벤트
							current.previousElementSibling.firstElementChild.addEventListener('click', function(e){
								e.preventDefault();
					            if(current.value  > 1){
									current.value = parseInt(current.value) - 1;
					            	// 수량 빼기 ajax
					            	var productCode = document.querySelectorAll('.glyphicon-remove')[idx].children[0].innerText
							    	var secondOptionCode = document.querySelectorAll('.glyphicon-remove')[idx].children[1].innerText
							    	
							    	$.ajax({
										url:'/backpackers/order/cart/quantity',
										method:'DELETE',
										data: JSON.stringify({'productCode': productCode, 'secondOptionCode': secondOptionCode, 'quantity': 1}),
										contentType:'application/json; charset=utf-8',
										dataType:'text',
										success:function(data){
											console.log('minus');
											presentOrderAmount();
										}
									});
					            }
							});
							// 수량을 더하는 이벤트
							current.nextElementSibling.firstElementChild.addEventListener('click', function(e){
						        e.preventDefault();
				            	current.value = parseInt(current.value) + 1;
						    	// 수량 더하기 ajax
				            	var productCode = document.querySelectorAll('.glyphicon-remove')[idx].children[0].innerText
						    	var secondOptionCode = document.querySelectorAll('.glyphicon-remove')[idx].children[1].innerText
						    	
						    	$.ajax({
									url:'/backpackers/order/cart/quantity',
									method:'POST',
									data: JSON.stringify({'productCode': productCode, 'secondOptionCode': secondOptionCode, 'quantity': 1}),
									contentType:'application/json; charset=utf-8',
									dataType:'text',
									success:function(data){
										console.log('plus');
										presentOrderAmount();
									}
								});
					    	});
						});
					</script>
					<div class="pricetag"><!-- 총 결제 금액 -->
						<span>총 가격 : </span><span></span>
					</div><!-- 총 결제 금액 end -->
					<script type="text/javascript">
						function sumOrderAmount() { // 가격 합산 함수
							var orderAmount = 0;
							document.querySelectorAll('tbody tr').forEach(function(current, index) {
								// 체크된 상품만 가격 합산
								if(current.firstElementChild.firstElementChild.checked) {
								    orderAmount += current.children.item(2).innerText * current.querySelector('.input-number').value;
								}
							});
							return orderAmount;
						}
						function wonFormat(inputNumber) {
						   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						}
						function presentOrderAmount() { // 가격 표시 함수
							document.querySelector('.pricetag').lastElementChild.innerText = wonFormat(sumOrderAmount()) + '원';
						}
						presentOrderAmount();
					</script>
					<div class="delivery-info"><!-- 배송 정보 -->
						<span>배송 정보 작업 중 : 회원 api 필요</span>
					</div><!-- 배송 정보 end -->
					<div class="purchase-form"><!-- 버튼 -->
						<button type="button" class="btn btn-default">선택한 상품 주문하기</button>
						<a href="${root }/shop" class="btn btn-default" role="btn">다른 상품 쇼핑하기</a>
					</div><!-- 버튼 end -->
					<script type="text/javascript"><!-- 주문 -->
					// 카트에 체크한 상품을 담는 함수
					function getCheckedProduct(cart) {
						document.querySelectorAll('.product-checkbox').forEach(function(e, i) {
				            if(e.checked) {
						    	var productCode = document.querySelectorAll('.glyphicon-remove')[i].children[0].innerText;
						    	var secondOptionCode = document.querySelectorAll('.glyphicon-remove')[i].children[1].innerText;
						    	var quantity = document.querySelectorAll('.input-number')[i].value;
				            	cart.push({'productCode' : productCode, 'secondOptionCode' : secondOptionCode, 'quantity' : quantity});
				            }
				            console.log(i);
				        });
					}
					// 주문하기 클릭 시 카트 상품 주문 ajax
					document.querySelector('.purchase-form').firstElementChild.addEventListener('click', function() {
						var cart = [];
						getCheckedProduct(cart);
						console.log(cart);
				    	$.ajax({
							url:'/backpackers/order/cart/order',
							method:'POST',
							data: JSON.stringify(cart),
							contentType:'application/json; charset=utf-8',
							dataType:'text',
							success:function(data){
								console.log('data');
								location.href = '${root}/order/checkout';
							}
						});
					});
						
					</script>
				</div><!-- content end -->
			</div><!-- col end -->
		</div><!-- row end -->
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
	<!-- 쇼핑 모달 -->
	<div id="shopModal" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<div class="shop-message">장바구니</div>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>