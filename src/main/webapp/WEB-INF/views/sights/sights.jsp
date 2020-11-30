<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/template/head.jspf" %>

<style type="text/css">

.btn-block {
    width: 25%;
	margin: auto;
}


</style>




</head>

<body>
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@ include file="/WEB-INF/views/template/header.jspf" %>
					<!-- Content starts -->
<div class="page-header">
	<h1>명소</h1>
</div>
<table class="table">
	<thead>
		<tr>
			<th>번  호</th>
			<th>명  소</th>
			<th>주  소</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="bean">
		<tr>
			<td><a href="./${bean.sightsNo }">${bean.sightsNo }</a></td>
			<td><a href="./${bean.sightsNo }">${bean.title }</a></td>
			<td><a href="./${bean.sightsNo }">${bean.ellipsis }</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<p><a href="./add" class="btn btn-primary btn-block" role="btn">글쓰기</a></p>
<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>
</html>






