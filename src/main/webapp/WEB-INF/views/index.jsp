<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TAG HOME</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style type="text/css">
	
	html { 
		font-size: 16px; 
	}
	
	body {
		background-image: url('./images/background006.png');
		background-repeat: no-repeat;
		background-attachment: fixed;
  		background-size: 100% 100%;
  		user-drag: none;
	    -webkit-user-drag: none;
	    user-select: none;
	    -moz-user-select: none;
	    -webkit-user-select: none;
	    -ms-user-select: none;
	}
	
	.header {
		height: 10rem;
		min-width: 60rem;
	}
	
	.logo {
		transition: 0.25s;
	}
	
	.logo:hover {
		box-shadow: 0px 0px 1em white, 0.5em 0.5em rgba(0,0,0,0.3);
	}
	
	.container-fluid {
		width: 100%;
		height: 50rem;
		min-width: 60rem;
	}
	
	.cont {
		-webkit-backdrop-filter: contrast(300%);
  		backdrop-filter: contrast(300%);
		padding: 10px;
		margin: 5px;
		width: 90%;
		height: 90%;
		border-radius: 10px;
		border: 2px solid #5A5A5A66;
    	box-shadow: 0px 0px 0em white, 0.5em 0.5em rgba(0,0,0,0.3);
    	word-wrap: break-word;
    	transition: 0.25s;
    	cursor: pointer;
	}
	
	.cont:hover {
		transform: scale(105%, 110%);
		box-shadow: 0px 0px 1em white, 0.7em 0.7em rgba(0,0,0,0.3);
	}
	
	.cont:active {
		transform: scale(90%, 95%);
	}
	
	.btn {
		-webkit-backdrop-filter: contrast(200%); 
		backdrop-filter: contrast(200%);
	}
	
	.title {
		font-family: "Noto Sans KR", sans-serif;
		font-optical-sizing: auto;
		font-weight: 900;
		font-style: normal;
	 	font-size: 1.5rem;
		color: white;
		text-shadow: 2px 2px 5px #000000;
	}
	
	.title1 {
		display: -webkit-box;
	  	-webkit-line-clamp: 2;
	 	-webkit-box-orient: vertical;
	 	text-overflow: ellipsis;
	 	overflow: hidden;
	 	line-height: 2rem;
		max-height: 4rem;
	}
	
	.title2 {
		display: -webkit-box;
	  	-webkit-line-clamp: 3;
	 	-webkit-box-orient: vertical;
	 	text-overflow: ellipsis;
	 	overflow: hidden;
	 	line-height: 2rem;
		max-height: 6rem;
	}
	
	.ttext {
		font-family: "Noto Sans KR", sans-serif;
		font-optical-sizing: auto;
		font-weight: 900;
		font-style: normal;
	 	font-size: 1rem;
		color: white;
		text-shadow: 2px 2px 5px #000000;
	}
	
	.ttext1 {
		display: -webkit-box;
	  	-webkit-line-clamp: 2;
	 	-webkit-box-orient: vertical;
	 	text-overflow: ellipsis;
	 	overflow: hidden;
	 	line-height: 2rem;
		max-height: 4rem;
	}
	
	.ttext2 {
		display: -webkit-box;
	  	-webkit-line-clamp: 7;
	 	-webkit-box-orient: vertical;
	 	text-overflow: ellipsis;
	 	overflow: hidden;
	 	line-height: 2rem;
		max-height: 14rem;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
<script type="text/javascript" src="./js/Account.js" defer="defer" charset="UTF-8"></script>
</head>
<body>
<!-- 헤더 영역 -->
<div class="header" style="display: flex; align-items: center; justify-content: space-around; width: 100%;">
	<img class="logo" alt="logo" src="./images/tag_logo1.png" onclick="location.href='index'" style="max-height: 80px;">
	<div style="display: flex; justify-content: center; flex-grow: 1;">
		<button type="button" class="btn btn-outline-dark" style="width: 35%;" onclick="location.href='list'"><i class="bi bi-list">Trend</i></button>
		<button type="button" class="btn btn-outline-dark" style="width: 35%;" onclick="location.href='list2'"><i class="bi bi-joystick">Games</i></button>
	</div>
	
	<div id="searchbox" style="display: none;">
		<form id="search" action="search" method="post">
			<div style="display: flex;">
				<input type="text" class="form-control" style="width: 10rem;" name="searchval" maxlength="10" placeholder="Search">
				<button type="submit"
					style="-webkit-backdrop-filter: invert(100%); backdrop-filter: invert(100%);"
					class="btn btn-outline-light">Search</button>
			</div>
		</form>
	</div>
	<div style="width: 7.5rem;">
		<button type="button" class="btn btn-outline-dark" onclick="showsearchbox()"><i class="bi bi-search"></i></button>
		<button type="button" class="btn btn-outline-dark" onclick="showloginbox()"><i class="bi bi-person"></i></button>
	</div>
</div>

	<%-- 세션 정보 받아오기 --%>
	<%
		request.setCharacterEncoding("utf-8");
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
						<button type="button" style="width: 100%;" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-block mb-3" onclick="SignUpOK()">Sign in</button>
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
		                <button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;" onclick="window.open('./Myinfo','userinfo','width=500, height=400,scrollbars=no, resizable=no, toolbars=no, menubar=no')">
		                    내 정보
		                </button>
		            </div>
		
		            <div data-mdb-input-init class="form-outline mb-4">
		                <button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;" onclick="location.href='./MyScrap'">
		                    스크랩
		                </button>
		            </div>
		
		            <div data-mdb-input-init class="form-outline mb-4">
		                <button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;" onclick="location.href='./MyComment'">
		                    내 댓글
		                </button>
		            </div>
		
		            <div data-mdb-input-init class="form-outline mb-4">
		                <button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;" onclick="location.href='./list2'">
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


<!-- DB Trend list -->
<c:set var="trendlist" value="${trendList.list}"/>

<!-- 컨텐츠가 없을 경우 -->
<c:if test="${trendlist.size() == 0}">
	<div style="width: 100%; text-align: center;">
		<span class="title">컨텐츠가 없습니다</span>
	</div>
</c:if>

	
<!-- 컨텐츠 목록 부분 -->
<div class="container-fluid" style="display: flex; justify-content: center;">
	
	<!-- 컨텐츠 왼쪽 영역(왼쪽 3개 박스) -->
	<div style="display: grid;
				grid-template-columns: 100%; 
				grid-template-rows: repeat(4, 25%); 
				width: 25%;">
		<c:forEach var="trend" items="${trendlist}" begin="0" end="2">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont left" style="width: 95%; background-color: <%=colorcode %>" 
				data-bs-toggle="tooltip" 
				data-bs-placement="top"
				title="${trend.title}"
				onclick="location.href='selectByTnum?tnum=${trend.tnum}'">
				<span class="title title1">${trend.title}</span><br/>
				<span class="ttext ttext1">${trend.maintext}</span>
			</div>
		</c:forEach>
	</div>
	
	
	<!-- 컨텐츠 가운데 왼쪽 영역(가운데 왼쪽 8개 박스) -->
	<div style="display: grid;
				grid-template-columns: 50% 50%; 
				grid-template-rows: repeat(4, 25%); 
				width: 25%;">
		<c:forEach var="trend" items="${trendlist}" begin="3" end="10">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont mid" style="background-color: <%=colorcode %>; float: left;" 
				data-bs-toggle="tooltip" 
				data-bs-placement="top"
				title="${trend.title}"
				onclick="location.href='selectByTnum?tnum=${trend.tnum}'">
				<span class="title title2">${trend.title}</span>
			</div>
		</c:forEach>
	</div>
	
	<!-- 컨텐츠 가운데 오른쪽 영역(가운데 오른쪽 4개 박스) -->
	<div style="display: grid;
				grid-template-columns: 100%; 
				grid-template-rows: repeat(4, 25%);  
				width: 12.5%;">
		<c:forEach var="trend" items="${trendlist}" begin="11" end="14">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont mid" style="background-color: <%=colorcode %>;" 
				data-bs-toggle="tooltip" 
				data-bs-placement="top"
				title="${trend.title}"
				onclick="location.href='selectByTnum?tnum=${trend.tnum}'">
				<span class="title title2">${trend.title}</span>
			</div>
		</c:forEach>
	</div>
	
	<!-- 컨텐츠 오른쪽 영역(오른쪽 5개 박스, 하나씩 구현됨) -->
	<div style="display: grid;
				grid-template-columns: repeat(3, 33.3333%); 
				grid-template-rows: repeat(4, 25%);
				grid-auto-flow: row dense;
				grid-auto-flow: column dense;
				width: 37.5%;">
		<c:forEach var="trend" items="${trendlist}" begin="15" end="15">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont right" style="width: 95%; height: 95%; grid-column: 1 / 3; grid-row: 1 / 3; background-color: <%=colorcode %>;" 
				data-bs-toggle="tooltip" 
				data-bs-placement="top"
				title="${trend.title}"
				onclick="location.href='selectByTnum?tnum=${trend.tnum}'">
				<span class="title title2">${trend.title}</span><br/>
				<span class="ttext ttext2">${trend.maintext}</span>
			</div>
		</c:forEach>
		<c:forEach var="trend" items="${trendlist}" begin="16" end="16">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont right2" style="width: 95%; grid-column: 1 / 3; grid-row: 3 / 4; background-color: <%=colorcode %>;" 
				data-bs-toggle="tooltip" 
				data-bs-placement="top"
				title="${trend.title}"
				onclick="location.href='selectByTnum?tnum=${trend.tnum}'">
				<span class="title title1">${trend.title}</span><br/>
				<span class="ttext ttext1">${trend.maintext}</span>
			</div>
		</c:forEach>
		<c:forEach var="trend" items="${trendlist}" begin="17" end="17">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont mid4" style="grid-column: 3 / 4; grid-row: 3 / 4; background-color: <%=colorcode %>;" 
				data-bs-toggle="tooltip" 
				data-bs-placement="top"
				title="${trend.title}"
				onclick="location.href='selectByTnum?tnum=${trend.tnum}'">
				<span class="title title2">${trend.title}</span>
			</div>
		</c:forEach>
		<c:forEach var="trend" items="${trendlist}" begin="18" end="18">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont mid4" style="grid-column: 1 / 2; grid-row: 4 / 5; background-color: <%=colorcode %>;" 
				data-bs-toggle="tooltip" 
				data-bs-placement="top"
				title="${trend.title}"
				onclick="location.href='selectByTnum?tnum=${trend.tnum}'">
				<span class="title title2">${trend.title}</span>
			</div>
		</c:forEach>
		<c:forEach var="trend" items="${trendlist}" begin="19" end="19">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont mid4" style="width: 95%; grid-column: 2 / 4; grid-row: 4 / 5; background-color: <%=colorcode %>;" 
				data-bs-toggle="tooltip" 
				data-bs-placement="top"
				title="${trend.title}"
				onclick="location.href='selectByTnum?tnum=${trend.tnum}'">
				<span class="title title1">${trend.title}</span><br/>
				<span class="ttext ttext1">${trend.maintext}</span>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>