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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
<!-- 헤더 -->
<header id="header-wrapper" class="container-fluid text-center align-middle">
	<div id="header" class="container-fluid w-75 d-flex bg-primary-subtle text-center align-middle py-3" style="height: 100px;">
		<!-- 로고 -->
		<div class="container-fluid bg-danger-subtle fs-3 fw-bold">
			로고
		</div>
		<!-- 트렌드 / 게임 -->
		<div class="container-fluid d-flex">
			<div class="container-fluid bg-warning-subtle">
				<h2>Trend</h2>
			</div>
			<div class="container-fluid bg-danger-subtle text-end">
				<h2>Games</h2>
			</div>
		</div>
		<!-- 서치아이콘 -->
		<div class="container-fluid bg-warning-subtle">
			<i class="bi bi-search fs-3"></i>
		</div>
		<!-- 로그인 / 로그아웃 버튼 -->
		<div class="container-fluid bg-danger-subtle">
			<button class="btn btn-sm btn-outline-primary">
			로그인 / 회원가입
			</button>
		</div>
	</div>
</header>

<!-- 메인 -->
<main id="main-wrapper" class="container-fluid">
	<div class="container w-75 bg-primary-subtle text-center my-5">
		<h2><a class="text-decoration-none text-danger" href="./list">[Trend 리스트로 이동하기]</a></h2>
	</div>
	<div id="main" class="container-fluid w-75 d-flex">
		<!-- 콘텐츠 3개씩 보여주는 박스 => 왼쪽 -->
		<div id="contents-boxes" class="container-fluid w-75 bg-success">
			<div id="contents-line-1" class="container-fluid d-flex my-5">
				<div class="text-center">
					<div class="bg-danger-subtle rounded-5 text-center align-middle mx-3" style="width: 300px; height: 200px">
						<h2>콘텐츠1</h2>			
					</div>
					<span class="fw-bold">지구 멸망 시나리오 TOP10</span><br/>
					<span class="fw-bold">조회수 984회</span>
				</div>
				<div class="text-center">
					<div class="bg-danger-subtle rounded-5 text-center align-middle mx-3" style="width: 300px; height: 200px">
						<h2>콘텐츠2</h2>			
					</div>
					<span class="fw-bold">죽기전에 가야할 곳 TOP10</span><br/>
					<span class="fw-bold">조회수 1871회</span>
				</div>
				<div class="text-center">
					<div class="bg-danger-subtle rounded-5 text-center align-middle mx-3" style="width: 300px; height: 200px">
						<h2>콘텐츠3</h2>			
					</div>
					<span class="fw-bold">공기 오염 분석 리포트</span><br/>
					<span class="fw-bold">조회수 487회</span>
				</div>
			</div>
			<div id="contents-line-2" class="container-fluid d-flex my-5">
				<div class="text-center">
					<div class="bg-danger-subtle rounded-5 text-center align-middle mx-3" style="width: 300px; height: 200px">
						<h2>콘텐츠4</h2>			
					</div>
					<span class="fw-bold">10년 후 어떤 선수가 되었을까</span><br/>
					<span class="fw-bold">조회수 9147회</span>
				</div>
				<div class="text-center">
					<div class="bg-danger-subtle rounded-5 text-center align-middle mx-3" style="width: 300px; height: 200px">
						<h2>콘텐츠5</h2>			
					</div>
					<span class="fw-bold">2024 과일 트렌드</span><br/>
					<span class="fw-bold">조회수 4221회</span>
				</div>
				<div class="text-center">
					<div class="bg-danger-subtle rounded-5 text-center align-middle mx-3" style="width: 300px; height: 200px">
						<h2>콘텐츠6</h2>			
					</div>
					<span class="fw-bold">아이돌 가사 "이것"이 가장 많다</span><br/>
					<span class="fw-bold">조회수 988117회</span>
				</div>
			</div>
			<div id="contents-line-3" class="container-fluid d-flex my-5">
				<div class="text-center">
					<div class="bg-danger-subtle rounded-5 text-center align-middle mx-3" style="width: 300px; height: 200px">
						<h2>콘텐츠7</h2>			
					</div>
					<span class="fw-bold">티라노 사우루스는 털이 있었을까?</span><br/>
					<span class="fw-bold">조회수 22984회</span>
				</div>
				<div class="text-center">
					<div class="bg-danger-subtle rounded-5 text-center align-middle mx-3" style="width: 300px; height: 200px">
						<h2>콘텐츠8</h2>			
					</div>
					<span class="fw-bold">스타벅스 미국 VS 한국</span><br/>
					<span class="fw-bold">조회수 188541회</span>
				</div>
				<div class="text-center">
					<div class="bg-danger-subtle rounded-5 text-center align-middle mx-3" style="width: 300px; height: 200px">
						<h2>콘텐츠9</h2>			
					</div>
					<span class="fw-bold">웹툰으로 보는 20대 트렌드</span><br/>
					<span class="fw-bold">조회수 48117회</span>
				</div>
			</div>
			
		</div>
		<!-- 마이페이지 => 오른쪽 -->
		<div class="container-fluid w-25 bg-success-subtle text-center align-middle" style="height: 1000px;">
			<div>
				<h2>마이페이지 영역</h2>
			</div>
		</div>
	</div>
</main>


<!-- 풋터 -->
<footer id="footer-wrapper" class="container-fluid bg-dark">
	<div id="footer" class="container-fluid text-center text-white">
		&copy; Copywrite Team TAG
	</div>
</footer>
</body>
</html>