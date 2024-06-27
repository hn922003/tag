<%@page import="javax.swing.filechooser.FileNameExtensionFilter"%>
<%@page import="com.tjoeun.tag.vo.TrendVO"%>
<%@page import="com.tjoeun.tag.vo.UserVO"%>
<%@page import="java.text.Collator"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tjoeun.tag.vo.CommentList"%>
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
<title>Trend</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="icon" href="./images/logo.jpg" type="image/x-icon">
	<script type="text/javascript" src="./js/link.js" defer="defer"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
	<script type="text/javascript" src="./js/Account.js" defer="defer"></script>
</head>

<div style="position: fixed; bottom: 80px; right: 40px;">
	<a href="#"><i class="bi bi-arrow-up-circle" style="color: grey; background-color: white; font-size: 40px;"></i></a>
</div>
<div style="position: fixed; bottom: 30px; right: 40px;">
	<a href="#footer"><i class="bi bi-arrow-down-circle" style="color: grey; background-color: white; font-size: 40px;"></i></a>
</div>

<body>

	<!-- 콘텐츠 헤더 부분 -->
	<!-- 헤더 -->
	<div class="header" style="display: flex; align-items: center; justify-content: space-around; border: 1px solid silver; width: 100%;">
		<img alt="logo" src="./images/tag_logo1.png" onclick="location.href='index'" style="max-height: 80px;">
		
		<div style="display: flex; justify-content: center; flex-grow: 1;">
			<button type="button" class="btn btn-outline-dark" style="width: 50%;" onclick="location.href='list'"><i class="bi bi-list">List</i></button>
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
			<button type="button" class="btn btn-outline-dark" onclick="location.href='game1'"><i class="bi bi-joystick"></i></button>
			<button type="button" class="btn btn-outline-dark" onclick="showloginbox()"><i class="bi bi-person"></i></button>
		</div>
	</div>

	<div id="loginbox"
		 style="position: absolute;
			top: 6.5rem;
			right: 2rem;
			padding: 1rem;
			display: none;
			border: 1px solid silver;
			background-color: white;
			z-index: 1;">
		<div class="d-flex justify-content-center align-items-center form-outline mb-2">
			<button class="btn btn-outline-dark" id="tab-login" onclick="pills_login()">Login</button>
			<button class="btn btn-outline-dark" id="tab-register" onclick="pills_register()">Register</button>
			<button class="btn btn-outline-dark" id="tab-mypage" onclick="pills_mypage()">Mypage</button>
			<div style="width: 10%;"></div>
			<button type="button" class="btn-close" aria-label="Close" onclick="pills_close()"></button>
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
			<div id="pills-mypage" style="width: 20rem; display: none;">
				<div data-mdb-input-init class="form-outline mb-4">
					<div class="d-flex align-items-center justify-content-center"
						 style="width: 100%; height: 100%; max-height: 5rem; border-radius: 0.5rem; background-color: #eae2e2;">
				<span class="loginInfo" style="height:70px; align-content: center">
					<%-- 수정 - 닉네임 부분을 세션으로 변경 --%>
					<%
						session = request.getSession();
						if (session.getAttribute("nickname") == null)
						{
							out.println("로그인이 필요합니다.");
						}
						else
						{
							out.println(session.getAttribute("nickname")+"님 환영합니디");
						}
					%>
				</span><br/>
					</div>
				</div>
				<div data-mdb-input-init class="form-outline mb-4">
					<button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;">
						User Profile
					</button>
				</div>
				<div data-mdb-input-init class="form-outline mb-4">
					<button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;" onclick="location.href='./logout'">
						Logout
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 콘텐츠 바디 부분 -->
	<main class="container text-center pt-1" style="background-color: pink">
		<div class="container px-4 px-lg-5" style="background-color: dodgerblue">
			<div class="container px-2" style="background-color: green">
				<fmt:formatDate var="tdate" value="${vo.tdate}" pattern="yy.MM.dd HH:mm:ss" />
				<br /><h2>${vo.title}</h2><br />
				<p>${vo.tag}</p><br/>
				<!-- 이미지 -->
				<!-- Carousel -->
				<%
				String imagePath = application.getRealPath("/WEB-INF/images");
				File imageDir = new File(imagePath);
				File[] files = imageDir.listFiles();
				List<String> imageFiles = new ArrayList<>();

				if (files != null) {
					/* String tnum = vo.getTnum(); */
					for (File file : files) {
						if (file.isFile() && file.getName().startsWith("2-")) {
							/* out.println("<p>File found: " + file.getName() + "</p>"); */
							imageFiles.add(file.getName());
						}
					}
					/* 이미지 파일 정렬 */
					Collections.sort(imageFiles, new Comparator<String>() {
		                @Override
		                public int compare(String o1, String o2) {
		                    return Collator.getInstance().compare(o1, o2);
		                }
		            });
				} else {
					out.println("<p>No files found in the directory.</p>");
				}
				%>
				<div class="container text-center" style="background-color: tan; width: 100%; height: 700px;">
					<div id="trend" class="mx-3 carousel slide" data-bs-ride="carousel" style="width: 97%">
						<!-- The slideshow/carousel -->
						<div class="carousel-inner">
							<div class="carousel-item active align-middle">
								<img src="./images/2.png" alt="2-1" class="container px-2 d-flex justify-content-center d-block w-60" style="width: 70%"/>
							</div>
							<%
								for (String fileName : imageFiles) {
									/* out.println("<p>filename: " + fileName + "</p>"); */
							%>
									<div class="carousel-item">
										<img src="image?name=<%= fileName %>" alt="<%= fileName %>"  class="container px-2 d-flex justify-content-center d-block w-60" style="width: 70%"/><br/>
									</div>
							<!-- <div class="carousel-item">
						    	<img src="ny.jpg" alt="New York" class="d-block w-100">
						    </div> -->
							<%
								}
							%>
						</div>
						<!-- Left and right controls/icons -->
						<button class="carousel-control-prev" type="button" data-bs-target="#trend" data-bs-slide="prev" style="background-color: black">
							<span class="carousel-control-prev-icon"></span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#trend" data-bs-slide="next" style="background-color: black">
							<span class="carousel-control-next-icon"></span>
						</button>
					</div>
				</div>

				<%-- <% 
					/* List<TrendVO> imageVOList = new ArrayList<>();
			        imageVOList.add(new ImageVO("1"));
			        imageVOList.add(new ImageVO("2"));
			        imageVOList.add(new ImageVO("3")); */
			        
			        // TrendVO trendVO = new TrendVO;
				
					String imagePath = application.getRealPath("/WEB-INF/images");
			        File imageDir = new File(imagePath);
			        File[] files = imageDir.listFiles();
			        List<String> imageFiles = new ArrayList<>();
					
			        if (files != null) {
			        	// String tnum = vo.getTnum();
			            for (File file : files) {
			                if (file.isFile() && file.getName().startsWith("2")) {
			                	// out.println(vo.tnum);
			                    imageFiles.add(file.getName());
			                }
			            }
			            /* 이미지 파일 정렬 */
			            Collections.sort(imageFiles, new Comparator<String>() {
			                @Override
			                public int compare(String o1, String o2) {
			                    return Collator.getInstance().compare(o1, o2);
			                }
			            });
			        } else {
			            out.println("<p>No files found in the directory.</p>");
			        }
				%>
				<%
		            for (String fileName : imageFiles) {
		        %>
	             	   <img src="image?name=<%= fileName %>" alt="<%= fileName %>" style="width:80%;"/><br/>
		        <%
		            }
		        %>  --%>
				<!-- <img src="./images/1.png" alt="trend" style="width: 80%"/> -->

				<br /><br /><p>${vo.maintext}</p><br /><br />
				<p class="d-flex justify-content-end">작성일: ${tdate}</p>
				<p class="d-flex justify-content-end">작성자: ${vo.writer}</p>
				<br />
			</div>
			<!-- 좋아요, 스크랩, 공유, 목록보기 -->
			<div class="container px-2 d-flex justify-content-center" style="background-color: cyan; font-size: 30px;">
				<p>
					<button class="btn" type="button" onclick="location.href='tlike?tnum=${vo.tnum}&lnum=${vo.lnum}'">
						<i class="bi bi-heart" style="color: red;"></i>&nbsp;${vo.lnum}
					</button>
					&nbsp;&nbsp;&nbsp;
					<button class="btn" type="button" onclick="location.href='scrap?tnum=${vo.tnum}'">
						<i class="bi bi-bookmark" style="color: blue;"></i>
					</button>
					&nbsp;&nbsp;&nbsp;
					<!-- <button class="btn" type="button" onclick="clip(); return false;"><i class="bi bi-share-fill"></i>(링크복사)</button> -->
					<button class="btn" type="button" value="링크복사" onclick="clip(); return false;">
						<i class="bi bi-share-fill"></i>&nbsp;(링크복사)
					</button>
				</p>
			</div>
			<form class="container px-2 d-flex justify-content-end" method="post" style="background-color: purple;">
				<input type="hidden" name="list" value="list" />
				<button class="btn btn-outline-warning" type="button" onclick="location.href='list'">목록보기</button>
			</form>
			<!-- 댓글 -->
			<div class="container px-2" style="background-color: orange">
				<br /><br /><h2 class="d-flex justify-content-start">댓글</h2><br />
				<!-- 댓글 입력 -->
				<form action="insertcommentOK" method="post" name="commentForm">
					<%
						/* 세션에서 현재 로그인된 닉네임 가져오기 */
						String nickname = (String) session.getAttribute("nickname");
					%>

					<!-- 로그인 되어있지 않은 경우 -->
					<c:if test="<%=nickname == null %>">
					<div class="container px-lg-2 d-flex justify-content-center" style="background-color: peachpuff;">
						<textarea rows="2" cols="8" placeholder="댓글을 작성하려면 로그인 해주세요." style="width: 60%; border-radius: 6px;" disabled></textarea>
						&nbsp;&nbsp;<button class="btn btn-outline-success" disabled>등록</button>
					</div><br/>
					</c:if>

					<c:if test="<%=nickname != null %>">
					<!-- 로그인 되어있는 경우 -->
					<div class="container px-lg-2 d-flex justify-content-center" style="background-color: peachpuff;">
						<textarea rows="3" cols="8" name="memo" style="width: 60%; border-radius: 6px; resize: none;"></textarea> &nbsp;&nbsp;
						<button class="btn btn-outline-success" type="submit" name="commentForm" style="width: 7%">등록</button>
					</div><br />
					</c:if>
					<!-- 테스트 후 화면에 보이지 않게 한다. -->
					<div style="display: none">
						<!-- 입력할 댓글의 트렌드번호 -->
						tnum: <input type="text" name="tnum" value="${vo.tnum}" />
						<!-- 수정 삭제 시 댓글번호 -->
						<%-- cnum: <input type="text" name="cnum" value="${co.cnum}"/ --%>
						<!-- 닉네임 -->
						<!-- nickname: <input type="text" name="nickname" value="{ao.nickname}"/> -->
					</div>
				</form>

				<!-- 댓글 출력 -->
				<c:set var="comment" value="${commentList.list}" />
				<!-- 후기가 없는 경우 -->
				<div class="container px-lg-1" style="background-color: yellow;">
					<div class="row">
						<c:if test="${comment.size() == 0}">
							<div class="col-md-9" style="background-color: tomato;">
								<li class="list-group-item" style="background-color: lightgoldenrodyellow;">
									<h4>첫 번째 후기를 남겨주세요!</h4>
								</li>
							</div>
							<div class="col-md-3" style="background-color: lavender">
								<br /><h3>${vo.writer}가 작성한 다른 글</h3>
								<ul class="list-group list-group-flush">
									<li class="list-group-item"><a href="#">제목제목제목제목제목제목제목</a></li>
									<li class="list-group-item"><a href="#">제목2</a></li>
									<li class="list-group-item"><a href="#">제목3</a></li>
									<li class="list-group-item"><a href="#">제목4</a></li>
									<li class="list-group-item"><a href="#">제목5</a></li>
								</ul><br /> 
								<a href="#"><img src="./images/1-1.png" style="width: 80%" /></a> <a href="#"><h3>게임하러 가기</h3></a><br />
							</div>
						</c:if>
					</div>
				</div>
				<!-- 후기가 있는 경우 -->
				<div class="container px-lg-1" style="background-color: yellow;">
					<div class="row">
						<c:if test="${comment.size() != 0}">
							<div class="col-md-9" style="background-color: tomato;">
								<ul class="list-group">
									<c:forEach var="co" items="${comment}">
										<c:set var="nickname" value="${fn:replace(co.nickname, '<', '&lt;')}" />
										<c:set var="nickname" value="${fn:replace(nickname, '>', '&gt;')}" />
										<fmt:formatDate var="cdate" value="${co.cdate}" pattern="yy.MM.dd HH:mm:ss" />
										<li class="list-group-item" style="background-color: lightgoldenrodyellow;">
											<div class="row mt-3">
												<span class="col-sm-4 d-flex justify-content-first">
													<%-- ${comment} --%> 
													<span>${co.nickname}</span>&nbsp;&nbsp;
													<span>${cdate}</span> <%-- <span><fmt:formatDate value="${co.cdate}" pattern="yy.MM.dd"/></span> --%>
												</span> 
												<span class="col-sm-8 d-flex justify-content-end">
													<button class="btn" type="button" onclick="location.href='clike?cnum=${co.cnum}&lcnum=${co.lcnum}'">
														<i class="bi bi-heart" style="color: red;"></i>&nbsp;${co.lcnum}
													</button> 
													<input type="hidden" id="rnum" name="rnum" value="${co.rnum}" />
													<input type="hidden" id="cnum" name="cnum" value="${co.cnum}" />
													<button class="btn" type="button" name="rep" onclick="reportbtn();" style="color: red; font-weight: bold;">신고</button>
													<%-- <button class="btn" type="button" onclick="location.href='report?rnum=${co.rnum}&cnum=${co.cnum}'" style="color: red; font-weight: bold;">신고</button> --%>
												</span>
											</div> 
											<c:set var="memo" value="${fn:replace(co.memo, '<', '&lt;')}" /> 
											<c:set var="memo" value="${fn:replace(memo, '>', '&gt;')}" /> 
											<c:set var="memo" value="${fn:replace(memo, enter, '<br/>')}" />
											<p class="d-flex justify-content-first">${memo}</p>
												<p class="d-flex justify-content-end">
													<c:set var="sessionNick" value="<%=nickname%>"/>
													<c:if test="${co.nickname == sessionNick}">
														<span>
															<input type="hidden" id="cnum" name="cnum" value="${co.cnum}"/>
															<%-- <input type="hidden" id="cdate" name="cdate" value="${co.cdate}"/> --%>
															<button class="btn btn-outline-warning" onclick="window.open('update?cnum=' + ${co.cnum}, 'update', 'width = 500, height = 400, top = 100, left = 200, location = no')">수정</button>
															<script type="text/javascript">
																window.name = 'trend'
															</script>
															<%-- <button class="btn btn-outline-warning" onclick="location.href='update?nickname=${co.nickname}'")>수정</button> --%>
														</span>
														<span>
															<button class="btn btn-outline-danger" onclick="location.href='deletecommentOK?cnum=${co.cnum}&size=${comment.size()}'">삭제</button>
														</span>
													</c:if>
												</p>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div class="col-md-3" style="background-color: lavender">
								<br /><h3>${vo.writer}가 작성한 다른 글</h3>
								<ul class="list-group list-group-flush">
									<li class="list-group-item"><a href="#">제목제목제목제목제목제목제목</a></li>
									<li class="list-group-item"><a href="#">제목2</a></li>
									<li class="list-group-item"><a href="#">제목3</a></li>
									<li class="list-group-item"><a href="#">제목4</a></li>
									<li class="list-group-item"><a href="#">제목5</a></li>
								</ul><br /> 
								<a href="#"><img src="./images/1-1.png" style="width: 80%" /></a> 
								<a href="#"><h3>게임하러 가기</h3></a><br />
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div><br />
	</main>

	<footer id="footer" class="container bg-dark">
		<br /><br />
		<!-- 카피라이트 -->
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; TJoeun
				Academy Team Project: TAG 2024</p>
		</div>
		<!-- 만든이 / 연락처 -->
		<br /><br />
	</footer>
</body>
</html>