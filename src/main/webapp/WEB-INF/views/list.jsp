<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
<script type="text/javascript" src="./js/list.js" defer="defer"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
<link rel="stylesheet" href="./css/list.css" />
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
<!-- 헤더 -->
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

<!-- 메인 -->
<main id="main-wrapper" class="container-fluid">
	<div id="main" class="container-fluid w-75 d-flex">
		${test}
		<!-- 콘텐츠 3개씩 보여주는 박스 -->
		<div id="contents-boxes" class="container w-75">
			<div id="contents-line-1" class="d-flex flex-wrap">
				<!-- 리스트 변수 설정 -->
				<c:set var="list" value="${trendList.list}"/>
				<!-- 리스트가 없으면 없다고 출력(쓸일 없겠지만) -->
				<c:if test="${list.size() == 0}">
		 			<div class="table-danger">
		 				<div>
		 					<marquee>트렌드 컨텐츠가 없습니다.</marquee>
		 				</div>
		 			</div>
		 		</c:if>
				
		 		<!-- 리스트가 있으면 리스트 만큼 반복해서 출력 -->
		 		<c:if test="${list.size() != 0}">
		 			<!-- 리스트의 아이템 1건을 vo 변수로 설정 / 상태 변수를 view -->
		 			<c:forEach var="vo" items="${list}" varStatus="view">
		 			<!-- 매 콘텐츠 마다 반복해서 랜덤 컬러 설정 -->
		 			<% 
						String letters = "0123456789ABCDEF";
						String colorcode = "#";
						for (int i = 0; i < 6; i++){
							colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
						}
						colorcode += "A8";
					%>
		 			<!-- 인덱스 0~8 (9개) 보이게 model로 넘어온 viewcount 활용 -->
		 			<c:if test="${view.index < 9}">
		 			<div class="cont text-center my-3 rounded-5 container-fluid position-relative" style="width: 30%; height: 25dvh; background-color: <%=colorcode %>">
						<div class="container-fluid h-75 text-center align-middle">
							<h2 class="title">${vo.tnum}번 글</h2>			
						</div>
						<a class="stretched-link text-decoration-none text-black" href="./selectByTnum?tnum=${vo.tnum}">
							<span class="title fw-bold">${vo.title}</span><br/>
						</a>
						<span class="fw-bold">조회수: ${vo.views}</span> / 
						<span class="fw-bold">댓글수: ${vo.ccount}</span>
					</div>
		 			</c:if>
		 			<!-- 인덱스 9 이상 안 보이게 하기 -->
		 			<c:if test="${view.index >= 9}">
		 			<div class="trc cont text-center my-3 rounded-5 container-fluid position-relative" style="width: 30%; height: 25dvh; display: none; background-color: <%=colorcode %>">
						<div class="container-fluid h-75 text-center align-middle">
							<h2 class="title">${vo.tnum}번 글</h2>			
						</div>
						<a class="stretched-link text-decoration-none text-black" href="./selectByTnum?tnum=${vo.tnum}">
							<span class="title fw-bold">${vo.title}</span><br/>
						</a>
						<span class="fw-bold">조회수: ${vo.views}</span> / 
						<span class="fw-bold">댓글수: ${vo.ccount}</span>
					</div>
		 			</c:if>
		 			</c:forEach>
		 		</c:if><!-- 리스트 출력 끝 -->
			</div>
			<div id="morediv" class="container text-center align-items-center my-3">
				<button id="morebtn"
				class="btn btn-danger" 
				type="button" 
				title="콘텐츠 6개 더보기"
				onclick="setViewcount()">더보기 <i class="bi bi-chevron-down"></i></button>
				<!-- 더보기 변수 -->
				<input id="morecount" value=0 type="hidden"/><!-- 더보기 시작번호 -->
				<input id="last" value="${trendList.totalCount}" type="hidden"/><!-- 모든댓글 수 -->
			</div>
		</div>
		
		
		<!-- 마이페이지 => 오른쪽 -->
		<div class="container-fluid w-25 border border-5 border-success-subtle text-center align-middle mt-3" style="height: 600px;">
			<div>
				<h2>마이페이지 영역</h2>
			</div>
		</div>
	</div>
	
	<!-- 최상단으로 올려주는 top 버튼을 만들어준다. -->
	<a id="toTop" class="position-fixed bottom-0 end-0 m-5" href="#" style="display:none;">
		<i class="bi bi-arrow-up-circle-fill fs-1 text-danger"></i>
	</a >
</main>
				


<!-- 풋터 -->
<footer id="footer-wrapper" class="container-fluid bg-dark">
	<div id="footer" class="container-fluid text-center text-white">
		&copy; Copywrite Team TAG
	</div>
</footer>
</body>
</html>