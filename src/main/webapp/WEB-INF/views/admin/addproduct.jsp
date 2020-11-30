<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf" %>
<meta charset="UTF-8">
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
 position: relative;
  left: 50%;

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
<form action="${root}/admin/" method="POST">
<div><input type="text" name="itemCode"   class="form-control" id="itemCode" placeholder="itemCode" value="">
<input type="text" name="itemName"   class="form-control" id="itemName" placeholder="itemName" value="">
<input type="text" name="price"   class="form-control" id="price" placeholder="price" value="">
 
 
  <tr>
<select class="form-control" name="mainCategoryCode" id="main_category">
<c:forEach items="${list1}" var="list1">
<option value="${list1.mainCategoryCode}">${list1.mainCategoryName}
</option>
</c:forEach>
</select>
</tr>
<tr>
<select class="form-control" name="subCategoryCode" id="sub_category">
<c:forEach items="${list2}" var="list2">
<option value="${list2.subCategoryCode}">${list2.subCategoryName}
</option>
</c:forEach>
</select>
</tr>
<tr>
<select class="form-control" name="brandCode" id="brand">
<c:forEach items="${list3}" var="list3">
<option value="${list3.brandCode}">${list3.brandName}
</option>
</c:forEach>
</select>
</tr>
 <tr>
<select class="form-control" name="firstOptionCode" id="firstOptionCode">
<c:forEach items="${list4}" var="list4">
<option value="${list4.optionCode}">${list4.optionName}
</option>
</c:forEach>
</select>
</tr> 
  <tr>
<select class="form-control" name="secondOptionCode" id="secondOptionCode">
<c:forEach items="${list5}" var="list5">
<option value="${list5.optionGroupCode}">${list5.optionGroupName}
</option>
</c:forEach>
</select>
</tr>   
<button class="btn btn-primary" id="reply_content_btn" type="submit">상품등록완료</button>
</table>
</form>


</div>


<%@include file="../template/footer.jspf" %>
</body>
</html>