<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script type="text/javascript" src="./js/list.js" defer="defer"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
<script type="text/javascript" src="./js/Account.js" defer="defer"></script>
<link rel="stylesheet" href="./css/list.css" />
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
<!-- 헤더 영역 -->
<div class="header" style="display: flex; align-items: center; justify-content: space-around; width: 100%;">
	<img class="logo" alt="logo" src="./images/tag_logo1.png" onclick="location.href='index'" style="max-height: 80px;">
	
	<div style="display: flex; justify-content: center; flex-grow: 1;">
		<button type="button" class="btn btn-outline-dark" style="width: 50%;" onclick="location.href='list'"><i class="bi bi-list">Trend</i></button>
	</div>
	
	<div id="searchbox" style="display: none;">
		<form id="search" action="search" method="post">
			<div style="display: flex;">
				<input type="text" class="form-control" name="searchval" maxlength="10" placeholder="Search">
				<button type="submit" class="btn btn-outline-light">Search</button>
			</div>
		</form>
	</div>
	<div style="width: 10rem;">
		<button type="button" class="btn btn-outline-dark" onclick="showsearchbox()"><i class="bi bi-search"></i></button>
		<button type="button" class="btn btn-outline-dark" onclick="location.href='./list'"><i class="bi bi-list"></i></button>
		<button type="button" class="btn btn-outline-dark" onclick="showloginbox()"><i class="bi bi-person"></i></button>
	</div>
</div>

<%-- 세션 정보 받아오기 --%>
<%
	session = request.getSession();
	String nickname = (String) session.getAttribute("nickname");
	String point = String.valueOf(session.getAttribute("point"));
%>


<!-- 로그인, 회원가입, 마이페이지 박스 -->
<div id="loginbox" style="position: absolute;
				top: 6.5rem;
				right: 2rem;
				padding: 1rem;
				display: none;
				border: 1px solid silver;
				background-color: white;
				z-index: 2;">

	<%-- 비 로그인시 --%>
	<c:if test="<%=nickname == null %>">
		<%-- 로그인 / 회원가입 / 프로필 버튼 --%>
		<div class="d-flex justify-content-left align-items-center form-outline mb-2">
			<button class="btn btn-outline-dark" id="tab-login" onclick="pills_login()"> SignIn </button>
			<button class="btn btn-outline-dark" id="tab-register" onclick="pills_register()" style="margin-left: 3%; margin-right: 43%"> SignUp </button>

				<%-- 창 닫기 버튼 --%>
			<div style="width: 10%;">
				<button type="button" class="btn-close" aria-label="Close" onclick="pills_close()"></button>
			</div>
		</div>

		<div class="tab-content">
			<div id="pills-login" style="width: 20rem; display: block;">
				<form>
					<!-- ID input -->
						<%-- 수정 - type="email"에서 type="text"로 변경 및 id 변경--%>
					<div data-mdb-input-init class="form-outline mb-4">
						<input type="text" id="loginId" class="form-control" placeholder="Username"/>
					</div>

					<!-- Password input -->
					<div data-mdb-input-init class="form-outline mb-4">
						<input type="password" id="loginPassword" class="form-control" placeholder="Password"/>
					</div>

					<!-- 2 column grid layout -->
					<div class="row mb-4">
						<div class="col-md-6 d-flex justify-content-center">
							<!-- Checkbox -->
							<div class="mb-3 mb-md-0">
								<input class="form-check-input" type="checkbox" value="" id="loginCheck" checked />
								<label class="form-check-label" for="loginCheck"> Remember me </label>
							</div>
						</div>

						<div class="col-md-6 d-flex justify-content-center">
							<!-- Simple link -->
							<a href="#!">Forgot password?</a>
						</div>
					</div>

					<!-- Submit button -->
						<%-- 수정 - onclick 이벤트 추가 --%>
					<button type="button" style="width: 100%;" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-block mb-4" onclick="SignInOk()">Login</button>

					<div class="text-center mb-4">
						<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-dark btn-floating mx-1">
							<i class="bi bi-google"></i>
						</button>

						<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-dark btn-floating mx-1">
							<i class="bi bi-twitter"></i>
						</button>

						<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-dark btn-floating mx-1">
							<i class="bi bi-facebook"></i>
						</button>

						<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-dark btn-floating mx-1">
							<i class="bi bi-github"></i>
						</button>
					</div>

					<!-- Register buttons -->
					<div class="text-center">
						<p>Not a member? <a href="#!">Register</a></p>
					</div>
				</form>
			</div>
			<div id="pills-register" style="width: 20rem; display: none;">
				<form>
					<div class="text-center mb-2">
						<div class="text-center mb-2">Sign up with:</div>
						<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-dark btn-floating mx-1">
							<i class="bi bi-google"></i>
						</button>

						<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-dark btn-floating mx-1">
							<i class="bi bi-twitter"></i>
						</button>

						<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-dark btn-floating mx-1">
							<i class="bi bi-facebook"></i>
						</button>

						<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-dark btn-floating mx-1">
							<i class="bi bi-github"></i>
						</button>
					</div>

					<div class="text-center mb-2">or:</div>
						<%-- 수정 - 회원가입 폼 --%>
					<!-- 닉네임 입력 -->
					<div data-mdb-input-init class="form-outline mb-4">
						<input type="text" id="nickname" class="form-control" placeholder="Nickname" oninput="NickCheck()"/>
						<span id="NickCheckMsg"></span>
					</div>

					<!-- 이메일 입력 -->
					<div data-mdb-input-init class="form-outline mb-4">
						<input type="email" id="email" class="form-control" placeholder="Email"/>
					</div>

					<!-- 아이디 입력 -->
					<div data-mdb-input-init class="form-outline mb-4">
						<input type="text" id="userid" class="form-control" placeholder="ID" oninput="IdCheck()"/>
						<span id="IdCheckMsg"></span>
					</div>

					<!-- 비밀번호 입력 -->
					<div data-mdb-input-init class="form-outline mb-4">
						<input type="password" id="pw" class="form-control" placeholder="Password" oninput="PwCheck()"/>
					</div>

					<!-- 비밀번호 입력 및 비밀번호 확인 -->
					<div data-mdb-input-init class="form-outline mb-4">
						<input type="password" id="pwCheck" class="form-control" placeholder="Repeat Password" oninput="PwCheck()"/>
						<span id="PwCheckMsg"></span>
					</div>

						<%-- 생년월일 추가 --%>
					<div data-mdb-input-init class="form-outline mb-4">
						<label for="birth">생년월일(선택)</label>
						<input type="date" id="birth" class="form-control"/>
					</div>
						<%-- 윗줄까지 복사 --%>

					<!-- Checkbox -->
					<div class="form-check d-flex justify-content-center mb-4">
						<input class="form-check-input me-2" type="checkbox" value="" id="registerCheck" checked
							   aria-describedby="registerCheckHelpText"/>
						<label class="form-check-label" for="registerCheck">
							I have read and agree to the terms
						</label>
					</div>

					<!-- Submit button -->
					<button type="submit" style="width: 100%;" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-block mb-3" onclick="SignUpOK()">Sign in</button>
				</form>
			</div>
		</div>
	</c:if>

	<%-- 로그인시 --%>
	<c:if test="<%=nickname != null %>">
		<%-- 로그인 / 회원가입 / 프로필 버튼 --%>
		<div class="d-flex justify-content-right align-items-right form-outline mb-2">

				<%-- 창 닫기 버튼 --%>
			<div style="width: 10%;">
				<button type="button" class="btn-close" aria-label="Close" onclick="pills_close()"></button>
			</div>
		</div>

		<div class="tab-content">
			<div id="pills-mypage" style="width: 10rem; display: block;">
				<div data-mdb-input-init class="form-outline mb-4">
					<div class="d-flex align-items-center justify-content-center"
						 style="width: 100%; height: 100%; max-height: 5rem; border-radius: 0.5rem; background-color: #eae2e2;">
							<span class="loginInfo" style="height:70px; align-content: center">
								<%-- 수정 - 닉네임 부분을 세션으로 변경 --%>
								<%
									out.println("<strong>"+nickname+"</strong>");
									out.println("<br>");
									out.println("ⓟ "+point);
								%>
							</span><br/>
					</div>
				</div>
				<div data-mdb-input-init class="form-outline mb-4">
					<button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;" onclick="location.href='./Myinfo'">
						내 정보
					</button>
				</div>

				<div data-mdb-input-init class="form-outline mb-4">
					<button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;" onclick="location.href='./Scrap'">
						스크랩
					</button>
				</div>

				<div data-mdb-input-init class="form-outline mb-4">
					<button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;" onclick="location.href='./MyComment'">
						내 댓글
					</button>
				</div>

				<div data-mdb-input-init class="form-outline mb-4">
					<button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;">
						Game
					</button>
				</div>

				<div data-mdb-input-init class="form-outline mb-4">
					<button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%; color: red" onclick="location.href='./logout'">
						Logout
					</button>
				</div>
			</div>
		</div>
	</c:if>
</div>

<c:if test="${searchNum == 0}">
	<div style="width: 100%; text-align: center;">
		<span class="title">검색 결과가 없습니다</span>
	</div>
</c:if>

<!-- 메인 -->
<main id="main-wrapper" class="container-fluid">
	<div id="main" class="container-fluid w-75 d-flex">
		${test}
		<!-- 콘텐츠 3개씩 보여주는 박스 -->
		<div id="contents-boxes" class="container w-75">
			<div id="contents-line-1" class="d-flex flex-wrap">
				<!-- 게임은 무조건 출력 -->
				<% 
					String letters = "0123456789ABCDEF";
					String colorcode = "#";
					for (int i = 0; i < 6; i++){
						colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
					}
					colorcode += "A8";
				%>
				<div class="cont text-center my-3 rounded-5 container-fluid position-relative" style="width: 30%; height: 25dvh; background-color: <%=colorcode %>">
					<div class="container-fluid h-75 text-center align-middle">
						<h2 class="title">업다운 게임</h2>			
					</div>
					<a class="stretched-link text-decoration-none text-black" href="./updown">
						<span class="title fw-bold">숫자를 맞춰보세요</span><br/>
					</a>
				</div>
				<% 
					letters = "0123456789ABCDEF";
					colorcode = "#";
					for (int i = 0; i < 6; i++){
						colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
					}
					colorcode += "A8";
				%>
				<div class="cont text-center my-3 rounded-5 container-fluid position-relative" style="width: 30%; height: 25dvh; background-color: <%=colorcode %>">
					<div class="container-fluid h-75 text-center align-middle">
						<h2 class="title">가위바위보 게임</h2>			
					</div>
					<a class="stretched-link text-decoration-none text-black" href="./game1">
						<span class="title fw-bold">컴퓨터를 이겨보세요!</span><br/>
					</a>
				</div>
				<% 
					letters = "0123456789ABCDEF";
					colorcode = "#";
					for (int i = 0; i < 6; i++){
						colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
					}
					colorcode += "A8";
				%>
				<div class="cont text-center my-3 rounded-5 container-fluid position-relative" style="width: 30%; height: 25dvh; background-color: <%=colorcode %>">
					<div class="container-fluid h-75 text-center align-middle">
						<h2 class="title">숫자야구 게임</h2>			
					</div>
					<a class="stretched-link text-decoration-none text-black" href="./numbaseball">
						<span class="title fw-bold">레벨별로 도전하세요!</span><br/>
					</a>
				</div>
	
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
						letters = "0123456789ABCDEF";
						colorcode = "#";
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

	</div>
	
	<!-- 최상단으로 올려주는 top 버튼을 만들어준다. -->
	<a id="toTop" class="position-fixed bottom-0 end-0 m-5" href="#" style="display:none;">
		<i class="bi bi-arrow-up-circle-fill fs-1 text-white"></i>
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