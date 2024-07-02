<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script>
	var msg = "<c:out value='${msg}'/>";
	var url = "<c:out value='${url}'/>";
	if (msg == '댓글을 입력해주세요.') {
		alert(msg);
		location.href = history.go(-1);
	} else if (msg == '후기를 입력해주세요.') {
		alert(msg);
		location.href = history.go(-1);
	} else if (msg == '이미 신고하셨습니다.') {
		if (confirm('신고하시겠습니까?')) {
			alert(msg);
			location.href = history.go(-1);
		} else {
			alert('신고접수 취소')
		}
	} else if (msg == '신고접수완료') {
		if (confirm('신고하시겠습니까?')) {
			alert(msg);
			location.href = history.go(-1);
		} else {
			alert('신고접수 취소');
		}
	} else if (msg == '스크랩완료') {
		alert(msg);
		location.href = history.go(-1);
	} else if (msg == '스크랩취소') {
		alert(msg);
		location.href = history.go(-1);
	}
</script>