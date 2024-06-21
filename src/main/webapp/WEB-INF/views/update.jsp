<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%-- ${commentList} --%>
	<form class="mt-3" action="updatecommentOK" method="post" name="updateForm">
		<c:set var="comment" value="${commentList.list}"/>
		<c:forEach var="co" items="${comment}">
		<h3 class="m-3">댓글수정</h3>
		<div>
			<fmt:formatDate var="cdate" value="${co.cdate}" pattern="yy.MM.dd HH:mm:ss" />
		    <div class="m-3 d-flex">
		        <span class="d-flex justify-content-first">${co.nickname}</span>&nbsp;&nbsp;
		        <span>${cdate}</span>
		    </div>
		</div>
		<div class="m-2 d-flex justify-content-center">
			<textarea name="memo" style="resize: none; width: 470px; height: 200px;">${co.memo}</textarea>
		</div>
		<div class="m-3">
			<span class="d-flex justify-content-end">
				<input class="btn btn-outline-success btn-sm" type="reset" value="다시쓰기"/>
				<button class="btn btn-outline-warning btn-sm" type="submit" name="updateForm" onclick="submitForm();">수정하기</button>
				<input type="hidden" id="cnum" name="cnum" value="${co.cnum}"/>
				<input type="hidden" id="memo" name="memo"/>
			</span>
		</div>
		</c:forEach>
	</form>
		<script type="text/javascript">
			function submitForm() {
				document.updateForm.target = 'trend';
				document.updateForm.submit();
				self.close();
			}
		</script>
</body>
</html>