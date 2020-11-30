<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf" %>
<style type="text/css">


#searchbar,#searchOptionbar{
 width: 5%;
 float: left;
}

#boardwrite{
float: right;

}


#boardsubject{
text-align: center;

}
#searchbar,#boardwrite,#searchOptionbar,#searchbtn{
font-size: 15px;


}

</style>
<title>게시판</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@include file="../template/header.jspf" %>
<table class="table table-striped" id="table">
<tr>
<th style="width: 10%;">번호</th>
<th style="width: 55%;" id="boardsubject">제목</th>
<th style="width: 10%;">글쓴이</th>
<th style="width: 10%;">작성일</th>
<th style="width: 10%;">조회</th>
</tr>
<c:forEach items="${list}" var="title">
<tr>
<td>${title.board_no}</td>
<td id="boardsubject"><a href="./${title.board_no}">${title.board_subject}</a></td>
<td>${title.user_ID}</td>
<td>${title.board_date}</td>
<td>${title.board_views}</td>
</tr>
</c:forEach>
</table>
<div class="search_board">
<form name="form1" method="post" action="./search">
<select class="form-control" name="searchOption" id="searchOptionbar">
  <option value="board_subject"<c:out value="${map.searchOption == 'board_subject'?'selected':''}"/> >제목</option>
  <option value="user_ID"<c:out value="${map.searchOption == 'user_ID'?'selected':''}"/> >이름</option>
  <option value="board_content"<c:out value="${map.earchOption == 'board_content'?'selected':''}"/> >내용</option>
</select>
 <div><input type="text" name="keyword" value="${map.keyword}" class="form-control" id="searchbar" placeholder="검색">
 <button class="btn btn-primary" type="submit" id="searchbtn">검색</button> <c:if test="${sessionScope.user != null}">
<a class="btn btn-primary" href="./boardwrite" role="button" id="boardwrite">글쓰기</a></c:if></div>
 </form>

</div>
<div class="boardpaging">


<ul class="btn-group pagination" id="boardpaging">
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/board/?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left">이전</i></a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
    <li>
        <a href='<c:url value="/board/?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/board/?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right">다음</i></a>
    </li>
    </c:if>
</ul>



</div>

<%@include file="../template/footer.jspf" %>

</html>