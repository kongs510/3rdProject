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



#itemId{
width: 45px;

}


#mainCategoryCode,#subCategoryCode,#brandCode,#firstOptionCode,#secondOptionCode,#itemId,#itemCode,#price,#itemName{

text-align: center;

}

#itemId,#itemCode,#price{
width: 100px;

}
#itemName{
width: 200px;
}



#mainCategoryCode,#subCategoryCode,#brandCode,#firstOptionCode,#secondOptionCode{
width: 125px;

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


<form action="${root}/admin/${list.itemId}/edit" method="post">
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
</tr>
<tr>
<td ><input  name="itemId"  id="itemId"  value="${list.itemId}"/></td>
<td><input  name="itemCode"  id="itemCode"  value="${list.itemCode}"/></td>
<td><input  name="itemName"  id="itemName"  value="${list.itemName}"/></td>
<td><input  name="price"  id="price"  value="${list.price}"/></td>
 <td><select class="form-control" name="mainCategoryCode" id="mainCategoryCode">
<option value="${list.mainCategoryCode}">${list.mainCategoryCode}</option>
 <c:forEach items="${list1}" var="list1">
<option value="${list1.mainCategoryCode}">${list1.mainCategoryName}
</option>
</c:forEach> 
</select></td>
<td><select class="form-control" name="subCategoryCode" id="subCategoryCode">
<option value="${list.subCategoryCode}">${list.subCategoryCode}</option>
 <c:forEach items="${list2}" var="list2">
<option value="${list2.subCategoryCode}">${list2.subCategoryName}
</option>
</c:forEach> 
</select></td>
<td><select class="form-control" name="brandCode" id="brandCode">
<option value="${list.brandCode}">${list.brandCode}</option>
 <c:forEach items="${list3}" var="list3">
<option value="${list3.brandCode}">${list3.brandName}
</option>
</c:forEach>
</select></td>
<td><select class="form-control" name="firstOptionCode" id="firstOptionCode">
<option value="${list.firstOptionCode}">${list.firstOptionCode}</option>
 <c:forEach items="${list4}" var="list4">
<option value="${list4.optionCode}">${list4.optionName}
</option>
</c:forEach> 
</select></td>
<td><select class="form-control" name="secondOptionCode" id="secondOptionCode">
<option value="${list.secondOptionCode}">${list.secondOptionCode}</option>
 <c:forEach items="${list4}" var="list5">
<option value="${list5.optionCode}">${list5.optionName}
</option>
</c:forEach> 
</option>
</select>
</td>  
 <input type="hidden" name="_method" value="put">
<td><button class="btn"  type="submit" >상품수정완료</button> </td>
</form>
</tr>
</table>

</div>
</div>
<%@include file="../template/footer.jspf" %>
</body>
</html>