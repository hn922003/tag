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
	}
</script>