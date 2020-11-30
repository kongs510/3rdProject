<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div class="content">
					<table class="table">
						<thead>
							<tr>
								<th>ShopId</th>
								<th>ShopImage</th>
								<th>ShopCode</th>
								<th>ShopTitle</th>
								<th>ShopPrice</th>
								<th>MainCategory</th>
								<th>SubCategory</th>
								<th>ShopDate</th>
							</tr>
						</thead>
						<tbody>
							<!-- 등록된 상품 페이지를 나열 -->
							<c:forEach items="${shopList }" var="shop">
								<tr>
									<td>${shop.shopId }</td>
									<td>
										<img src="${productImage }/no-image.jpg" style="width:50px;height:50px;"/>
									</td>
									<td><a href="./shop/${shop.shopCode }">${shop.shopCode }</td>
									<td>${shop.shopTitle }</td>
									<td>${shop.shopPrice }</td>
									<td><c:out value="${mainCategoryMap.get(shop.mainCategoryCode).mainCategoryName }"></c:out></td>
									<td><c:out value="${subCategoryMap.get(shop.subCategoryCode).subCategoryName }"></c:out></td>
									<td>${shop.shopDate }</td>
								</tr>
							</c:forEach>
						</tbody>
						<!-- 카테고리에 등록된 상품이 없을 때 -->
						<script type="text/javascript">
							(function ab() {
								var itemList = document.querySelector('table').children.item(1);
							    if(itemList.childElementCount == 0) {
							    	itemList.innerHTML = '<tr><td>판매 중인 상품이 없습니다.</td><td></td></tr>';
							    }
							})();
						</script>
					</table>
				</div>
			</div>
		</div>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>