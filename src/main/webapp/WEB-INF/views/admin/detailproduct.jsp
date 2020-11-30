<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf" %>
<style type="text/css">

#title,#title2,#title3{

  border: solid 1px black;


}

.first{
margin:0px,auto ;
padding:0px,auto;
background-color: yellow;
width: 1850px;
height: 100px;
text-align: center;
}
.second{

background-color: gray;
width: 1850px;
height: 600px;

}

.form-control{
width: 10%;


}
.insertproduct{
 
  
}
</style>

<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@include file="../template/header.jspf" %>
<div class="first">
<h1>관리자페이지</h1>
</div >
<div class="second" >
<a class="btn btn-default" href="${root}/admin/addproduct" role="button">상품등록</a>
<a class="btn btn-default" href="${root}/admin/deleteproduct" role="button">상품수정/삭제</a>
<div class="insertproduct">

<form action="${root}/admin/${list.itemId}/delete" method="post">
<div id="deletetable">
<table class="table">
<tr>
<th>아이템아이디</th>
<th>아이템코드</th>
<th>아이템이름</th>
<th>가격</th>
<th>카테고리</th>
<th>카테고리</th>
<th>브랜드</th>
<th>첫번쨰옵션</th>
<th>두번쨰옵션</th>
<th></th>
</tr>
<tr>
<td>${list.itemId}</td>
<td>${list.itemCode}</td>
<td>${list.itemName}</td>
<td>${list.price}</td>
<td>${list.mainCategoryCode}</td>
<td>${list.subCategoryCode}</td>
<td>${list.brandCode}</td>
<td>${list.firstOptionCode}</td>
<td>${list.secondOptionCode}</td>
<input type="hidden" name="_method" value="delete">
<td><a href="${root}/admin/${list.itemId}/edit" class="btn btn-default" role="btn">상품수정</a></td>
<td><button class="btn btn-danger" type="submit">상품삭제</button></td>
</form>
</tr>
</table>
</div>
</div>
<%@include file="../template/footer.jspf" %>
</body>
</html>