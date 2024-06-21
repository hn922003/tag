<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	body {
		background-image: url('./images/background007.png');
		background-repeat: no-repeat;
		background-attachment: fixed;
  		background-size: 100% 100%;
	}
	
</style>
<title>Content</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
</head>

<body>
<!-- 콘텐츠 헤더 부분 -->
<div class="container" style="display: flex; align-items: center; justify-content: space-around; border: 1px solid silver; width: 100%; height: 120px;">
	<img alt="logo" src="./images/tag_logo1.png" onclick="location.href='index'" style="max-height: 80px;">
	<div style="flex-grow: 1;"></div>
	<div id="searchbox" style="display: none;">
		<form id="search" action="search" method="post">
			<div style="display: flex;">
				<input type="text" class="form-control" name="searchval" maxlength="10" placeholder="Search">
				<button type="submit" style="-webkit-backdrop-filter: contrast(300%); backdrop-filter: contrast(300%);" class="btn btn-warning">Search</button>
			</div>
		</form>
	</div>
	<div>
		<button type="button" class="btn btn-outline-dark" onclick="showsearchbox()"><i class="bi bi-search"></i></button>
		<button type="button" class="btn btn-outline-dark" onclick="location.href='game1'"><i class="bi bi-joystick"></i></button>
		<button type="button" class="btn btn-outline-dark" onclick="showloginbox()"><i class="bi bi-person"></i></button>
	</div>
</div>

<!-- 콘텐츠 바디 부분 -->
<div class="container" style="display: flex; justify-content: center; border: 1px solid silver; width: 100%; height: auto;">
	<%
    	String tnum = request.getParameter("tnum");
	%>
	<p>컨텐츠내용 <%=tnum %></p>
</div>

</body>
</html>