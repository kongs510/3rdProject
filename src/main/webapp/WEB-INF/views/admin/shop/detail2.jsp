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
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
	<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
	<style type="text/css">
		body {
			word-break: keep-all;
		}
		.product-form {
			border: 1px solid black;
			border-radius: 5px;
			padding: 1em;
		}
		.product-item-form {
			border: 1px solid black;
			border-radius: 5px;
			padding: 1em;
		}
		@media (min-width: 768px) {
			.modal-dialog {
				width: 800px;
			}
		}
		.item-row:hover {
			cursor: pointer;
			background-color: #ccc;
		}
		.item-row-selected {
			cursor: pointer;
			background-color: #ddd;
			font-weight: 900;
		}
		.item-row-selected:hover {
			cursor: pointer;
			background-color: #ccc;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>
		<!-- Content starts 필요 시 임의로 그리드 조정 -->
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div class="content">
					<form class="form-horizontal">
						<div class="form-group"> <!-- shop form -->
							<label for="shopCode" class="col-sm-2 control-label">판매코드</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="shopCode" value="${shop.shopCode }"/>
							</div>
						</div>
						<div class="form-group">
							<label for="shopTitle" class="col-sm-2 control-label">판매제목</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="shopTitle" value="${shop.shopTitle }"/>
							</div>
							<label for="shopPrice" class="col-sm-1 control-label">판매가격</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="shopPrice" value="${shop.shopPrice }"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">대분류</label>
							<div class="col-sm-9 col-md-4">
								<select class="form-control" name="mainCategoryCode">
									<c:forEach items="${mainCategoryMap }" var="mainCategory">
									<option value="${mainCategory.key }">${mainCategory.value.mainCategoryName }</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 col-md-1 control-label">소분류</label>
							<div class="col-sm-9 col-md-4">
								<select class="form-control" name="subCategoryCode">
								</select>
							</div>
							<script type="text/javascript">
								var subCategories = {
									<c:forEach items="${subCategoryMap }" var="subCategory">
							        '${subCategory.key}' : '<c:forEach items="${subCategory.value }" var="list"><option value="${list.subCategoryCode}">${list.subCategoryName}</option></c:forEach>',
									</c:forEach>
								};
								document.querySelector('select').value = '${shop.mainCategoryCode}';
								document.querySelectorAll('select')[1].innerHTML = subCategories[document.querySelector('select').value];
								document.querySelectorAll('select')[1].value = '${shop.subCategoryCode}';
								document.querySelector('select').addEventListener('change', function() {
									var mainCategoryCode = this.value;
									document.querySelectorAll('select')[1].innerHTML = subCategories[mainCategoryCode];
								});
							</script>
						</div>
						<div class="form-group">
							<label for="shopPrice" class="col-sm-2 control-label">판매내용</label>
							<div class="col-sm-9">
							<textarea class="form-control" id="summernote" name="shopContent" maxlength="140" rows="7"></textarea>
							</div>
						</div> <!-- shop form -->
						<div class="product-form-control"> <!-- product form -->
							<div class="form-group"> <!-- product add button -->
								<label for="productCode" class="col-sm-2 control-label">상품</label>
								<div class="col-sm-9">
									<button type="button" class="btn btn-primary btn-add-product">추가</button>
								</div>
							</div> <!-- product add button -->
							<div class="form-group"> <!-- product info form -->
								<div class="col-sm-offset-2 col-sm-9">
									<div class="row">
									</div>
								</div>
							</div> <!-- product info form -->
						</div> <!-- product form -->
						<div class="form-group"> <!-- form button -->
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div> <!-- form button -->
					</form>
				</div>
			</div>
		</div>
		<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
	<div id="item-modal" class="modal fade" tabindex="-1" role="dialog"><!-- 쇼핑 모달 -->
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">아이템</h4>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th>코드</th>
								<th>이름</th>
								<th>가격</th>
								<th>대분류</th>
								<th>소분류</th>
								<th>브랜드</th>
								<th>상위옵션</th>
								<th>하위옵션</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal --><!-- 쇼핑 모달 끝 -->
	<div class="elements"  hidden="true">
		<div class="item-form">
			<div class="form-group">
				<label class="col-sm-2 control-label">하위 옵션 그룹</label>
				<div class="col-sm-2">
					<select class="form-control option-group" name="optionGroupCode">
						<c:forEach items="${optionGroupList }" var="optionGroup">
						<option value="${optionGroup.optionGroupCode }">${optionGroup.optionGroupName }</option>
						</c:forEach>
					</select>
				</div>
				<label class="col-sm-2 control-label">하위 옵션</label>
				<div class="col-sm-2">
					<select class="form-control option" name="optionCode">
					</select>
				</div>
				<label class="col-sm-1 control-label">아이템</label>
				<div class="col-sm-2">
					<input type="text" class="form-control item-control" name="itemCode" value="${productItem.itemCode }"/>
				</div>
				<div class="col-sm-1">
					<button type="button" class="btn btn-danger btn-block btn-item-delete">삭제</button>
				</div>
			</div>
		</div>
		<div class="product-form">
			<div class="form-group">
				<label for="productCode" class="col-sm-2 control-label">상품코드</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="productCode" value="${product.productCode }"/>
				</div>
			</div>	<!-- 상품 코드 끝 -->
			<div class="form-group">
				<label class="col-sm-2 col-md-2 control-label">상위 옵션 그룹</label>
				<div class="col-sm-10 col-md-3">
					<select class="form-control option-group" name="optionGroupCode">
						<c:forEach items="${optionGroupList }" var="optionGroup">
						<option value="${optionGroup.optionGroupCode }">${optionGroup.optionGroupName }</option>
						</c:forEach>
					</select>
				</div>
				<label class="col-sm-2 col-md-2 control-label">상위 옵션</label>
				<div class="col-sm-10 col-md-3">
					<select class="form-control option" name="OptionCode">
					</select>
				</div>
			</div>
			<div class="form-group">
				<form action="uploads" method="post" enctype="multipart/form-data">
					<label class="col-sm-2 control-label">사진</label>
					<div class="col-sm-10 col-md-6" style="border:1px solid black">
						<input type="file" name="files"/>
					</div>
					<div class="col-sm-10 col-md-4">
							<button type="submit">전송</button>
					</div>
				</form>
			</div>	<!-- 상위 옵션 끝 -->
			<div class="form-group"> <!-- product item add button -->
				<label for="productCode" class="col-sm-2 control-label">하위 옵션</label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary btn-add-item">추가</button>
				</div>
			</div> <!-- 하위 옵션 추가 끝-->
			<div class="form-group"> 
				<div class="col-sm-offset-2 col-sm-9">
					<div class="row">
					</div>
				</div>
			</div><!-- 하위 옵션 양식 끝 -->
		</div><!-- 상품 양식 끝 -->
	</div>
	<script type="text/javascript">
		document.querySelectorAll('.item-control').forEach(addEventItemSelect);
		// 아이템 선택 모달 기능 함수
		function addEventItemSelect(input) {
			input.addEventListener('click', function(e) {
				var itemCodeNow = input.value;
				$.ajax({
					url: '${root}/admin/shop/item',
					method: 'GET',
					data: {'itemCode': itemCodeNow},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: 'json',
					success: function(data) {
						document.querySelector('.modal-body table tbody').innerHTML = '';
						data.forEach(function(item, index) {
							document.querySelector('.modal-body table tbody').innerHTML = 
								document.querySelector('.modal-body table tbody').innerHTML
								+ '<tr><td>' + item.itemCode + '</td>'
								+ '<td>' + item.itemName + '</td>'
								+ '<td>' + item.itemPrice + '</td>'
								+ '<td>' + item.mainCategoryCode + '</td>'
								+ '<td>' + item.subCategoryCode + '</td>'
								+ '<td>' + item.brandCode + '</td>'
								+ '<td>' + item.firstOptionCode + '</td>'
								+ '<td>' + item.secondOptionCode + '</td></tr>';
						});
						document.querySelectorAll('.modal-body table tbody tr').forEach(function(current) {
						    current.classList.add('item-row');
						    if(current.firstElementChild.innerText == itemCodeNow) {
							    current.classList.add('item-row-selected');
						    }
						    current.addEventListener('click', function() {
								input.value = current.firstElementChild.innerText;
								$('#item-modal').modal('hide');
							});
						});
					}
				});
				$('#item-modal').modal('show');
			});
		}
		// 옵션 리스트
		var options = {
			<c:forEach items="${optionMap }" var="option">
	        '${option.key}' : '<c:forEach items="${option.value }" var="list"><option value="${list.optionCode}">${list.optionName}</option></c:forEach>',
			</c:forEach>
		};
		// 상품, 아이템 폼
		var itemForm = document.querySelector('.elements .item-form').outerHTML;
		var productForm = document.querySelector('.elements .product-form').outerHTML;
		// 옵션 기능 활성화 함수
		function activateOption(form) {
			var optionGroup = form.querySelector('.option-group');
			var option = form.querySelector('.option');
			option.innerHTML = options[optionGroup.value];
			optionGroup.addEventListener('change', function() {
				option.innerHTML = options[optionGroup.value];
			});
		}
		// 아이템 추가 버튼 활성화 함수
		function activateItemBtn(btn) {
			btn.addEventListener('click', function() {
				var itemSection = btn.parentElement.parentElement.nextElementSibling.querySelector('.row');
				if(itemSection.innerText == '') {
					itemSection.insertAdjacentHTML('beforeEnd', itemForm);
				} else {
					itemSection.querySelector('.item-form:last-child').insertAdjacentHTML('afterEnd', itemForm);
				}
				var lastItemForm = itemSection.querySelector('.item-form:last-child');
				activateOption(lastItemForm);
				var lastItemControl = lastItemForm.querySelector('.item-control');
				addEventItemSelect(lastItemControl);
				lastItemForm.querySelector('.btn-item-delete').addEventListener('click', function() {
					lastItemForm.remove();
				});
			});
		}
		// 상품 추가 버튼 활성화 함수
		document.querySelector('.btn-add-product').addEventListener('click', function() {
			var productSection = this.parentElement.parentElement.nextElementSibling.querySelector('.row');
			if(productSection.innerText == '') {
				productSection.insertAdjacentHTML('beforeEnd', productForm);
			} else {
				productSection.querySelector('.product-form:last-child').insertAdjacentHTML('afterEnd', productForm);
			}
			var lastProductForm = productSection.querySelector('.product-form:last-child');
			activateOption(lastProductForm);
			activateItemBtn(lastProductForm.querySelector('.btn-add-item'));
		});
	</script>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 300,
				minHeight : null,
				maxHeight : null,
				focus : true,
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						for (var i = 0; i < files.length; i++) {
							sendFile(files[i], this);
						}
					}
				}
			});
		});
		function sendFile(file, el) {
			console.log(file)
			var form_data = new FormData();
			form_data.append("file",file);
			$.ajax({
				data : form_data,
				type : "POST",
				url : '/backpackers/gear/image',
				cache : false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(url) {
					$(el).summernote('insertImage', url, function($image) {
						$image.css('width', "50%");
						//$('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>')
					});
				}
			});
		}
	</script>
</body>
</html>