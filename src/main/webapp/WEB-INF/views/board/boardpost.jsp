<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf"%>
<style type="text/css">
.board_subject {
	background-color: white;
	color: black;
	text-align: center;
	font-size: 15px
}

.user_ID, .board_date, .board_maketime, .board_views, .reply_num {
	width: px;
	background-color: white;
	color: black;
	text-align: center;
	float: right;
	font-size: 15px
}

.board_content {
	width: 2103px;
	height: 400px;
	background-color: white;
	color: black;
	font-size: 15px
}

.board_content_inside, .board_hits {
	background-color: white;
	color: black;
	font-size: 15px
}

.board_hits {
	margin: 0px auto;
	background-color: white;
	color: black;
	width: 100px;
	height: 75px;
	text-align: center;
	position: relative;
	top: 75%;
	font-size: 15px
}

.reply_content_send {
	background-color: white;
	color: black;
	height: 190px;
	font-size: 15px
}

#reply_content_send {
	height: 75px;
	font-size: 15px
}

.reply_id, .reply_time {
	width: 100px;
	background-color: white;
	color: black;
	font-size: 15px
}

.reply_content {
	width: 200px;
	background-color: white;
	color: black;
	font-size: 15px
}

#reply_content_btn {
	float: right;
	font-size: 15px
}

#contentupdate {
	font-size: 15px
}

#delete_button {
	font-size: 15px
}

#replyUpdate, #replyDelete {
	font-size: 12px
}

pre {
	border: solid 1px gray;
}

#delete_button {
	float: right;
}

.ex04 {
	margin: 10px auto;
	width: 1554px;
}

#reply_content {
	border: solid 2px white;
}

#replyContent, #reply_content {
	text-align: center;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		$("#reply_content_btn").click(function() {
			var reply_content_send = $('#reply_content_send').val();
			$.ajax({
				url : "${root}/board/${boardDitail.board_no}",
				method : 'post',
				data : {
					reply_content : reply_content_send,
					board_no : "${boardDitail.board_no}"
				},
				success : function(data) {
					alert("댓글이 등록되었습니다.");
					location.href = "${root}/board/${boardDitail.board_no}";
				},
				error : function(error) {
					alert("로그인후 댓글을작성해주세요.");
				}
			});
		});

		$("#replyUpdate").on('click', function() {
			alert("댓글이 수정되었습니다.");

		});

		$("#replyDelete").on('click', function() {
			alert("댓글이 삭제되었습니다.");

		});
		$("#delete_button").on('click', function() {
			alert("게시물이 삭제되었습니다.");

		});

	});
</script>
<title>게시글</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf"%>
	<%@include file="../template/header.jspf"%>
	<div class="ex1">
		<pre class="board_subject">${boardDitail.board_subject}</pre>
	</div>
	<div class="ex2">
		<pre class="board_views">조회수:${boardDitail.board_views}</pre>
		<pre class="board_maketime">작성시간:${boardDitail.board_maketime}</pre>
		<pre class="board_date">작성날짜:${boardDitail.board_date}</pre>
		<pre class="user_ID">작성자:${boardDitail.user_ID}</pre>
	</div>



	<div class="ex3">
		<pre class="board_content">
${boardDitail.board_content}

</pre>
	</div>
	<pre class="reply_content_send">
<input type="text" class="form-control" id="reply_content_send"
			name="reply_content" placeholder="댓글을 입력하시오">
<%-- <input type="hidden" name="board_no" value="${boardDitail.board_no}"> --%>
<button class="btn btn-primary" id="reply_content_btn" type="submit">댓글등록</button>
	</pre>
	
	<div class="delete">
		<c:if test="${sessionScope.username == boardDitail.user_ID}">
			<form method="post">
				<input type="hidden" name="_method" value="delete"> <a
					href="./${boardDitail.board_no}/edit" class="btn btn-primary"
					id="contentupdate" role="button">글수정</a>
				<button type="submit" class="btn btn-danger" name="board_no"
					id="delete_button" value="${boardDitail.board_no}">글삭제</button>
			</form>
		</c:if>
	</div>

			<div class="ex05">
				<!-- <pre class="reply">
<pre class="reply_id">답글아이디</pre>
<pre class="reply_content">답글내용</pre>
<pre class="reply_time">작성시간</pre>
</pre> -->
				<table class="table">
					<tr>
						<th>아이디</th>
						<th id="replyContent">댓글내용</th>
						<th>날짜</th>
						<th></th>
						<th></th>
					</tr>
					<c:forEach items="${reply}" var="reply">
						<form method="post" action="${boardDitail.board_no}/edit">
							<input type="hidden" name="_method" value="put">
							<tr>
								<td style="width: 20%;">${reply.reply_id}</td>
								<td style="width: 70%;" id="replyContent"><input
									type="text" value="${reply.reply_content}" id="reply_content"
									name="reply_content"></td>
								<td style="width: 10%;"><fmt:formatDate
										value="${reply.reply_time}" pattern="yyyy-MM-dd" /></td>
								<c:if test="${sessionScope.username == reply.reply_id}">
									<td><button type="submit" class="btn btn-primary"
											id="replyUpdate" name="reply_no" value="${reply.reply_no}">댓글수정</button></td>
								</c:if>
						</form>
						<form method="post">
							<c:if test="${sessionScope.username == reply.reply_id}">
								<input type="hidden" name="_method" value="delete">
								<td><button type="submit" class="btn btn-danger"
										name="reply_no" id="replyDelete" value="${reply.reply_no}">댓글삭제</button></td>
							</c:if>
						</form>
					</c:forEach>
					</tr>
				</table>
			</div>
			<div class="ex06"></div>
			<%@include file="../template/footer.jspf"%>
</html>