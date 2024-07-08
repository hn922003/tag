<%@page import="javax.swing.filechooser.FileNameExtensionFilter"%>
<%@page import="com.tjoeun.tag.vo.TrendVO"%>
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
	
	.aside {
		position: sticky;
		top: 100px;
		right: 100px;
	}
	
</style>
<title>Trend</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" href="./images/logo.jpg" type="image/x-icon">
<script type="text/javascript" src="./js/link.js" defer="defer"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
<script type="text/javascript" src="./js/Account.js" defer="defer"></script>
</head>
<!-- 위로 아래로 버튼 -->
<a id="toTop" class="position-fixed bottom-0 end-0 m-5" href="#" style="display: none;">
	<i class="bi bi-arrow-up-circle-fill text-success" style="color: white; font-size: 230%"></i>
</a>
<a id="toDown" class="position-fixed bottom-0 end-0 m-5" href="#footer" style="display: none;">
	<i class="bi bi-arrow-down-circle-fill text-success" style="color: white; font-size: 230%;"></i>
</a>

<body>

	<!-- 콘텐츠 헤더 부분 -->
	<div class="header" style="display: flex; align-items: center; justify-content: space-around; width: 100%;">
		<img class="logo" alt="logo" src="./images/tag_logo1.png" onclick="location.href='index'" style="max-height: 80px;">
		<div style="display: flex; justify-content: center; flex-grow: 1;">
			<button type="button" class="btn btn-outline-dark" style="width: 25%;" onclick="location.href='index'"><i class="bi bi-house">Index</i></button>
			<button type="button" class="btn btn-outline-dark" style="width: 25%;" onclick="location.href='list'"><i class="bi bi-list">Trend</i></button>
			<button type="button" class="btn btn-outline-dark" style="width: 25%;" onclick="location.href='list2'"><i class="bi bi-joystick">Games</i></button>
		</div>
		
		<div id="searchbox" style="display: none;">
			<form id="search" action="search" method="post">
				<div style="display: flex;">
					<input type="text" class="form-control" style="width: 10rem;" name="searchval" maxlength="10" placeholder="Search">
					<button type="submit"
						style="-webkit-backdrop-filter: invert(100%);
						backdrop-filter: invert(100%);"
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
	
	<c:if test="${searchNum == 0}">
		<div style="width: 100%; text-align: center;">
			<span class="title">검색 결과가 없습니다</span>
		</div>
	</c:if>

	<!-- 콘텐츠 바디 부분 -->
	<main class="container text-center pt-1">
		<div class="container px-4 px-lg-5">
			<div class="container px-2">
				<fmt:formatDate var="tdate" value="${vo.tdate}" pattern="yy.MM.dd HH:mm:ss" />
				<br /><h2>${vo.title}</h2><br />
				<p>${vo.tag}</p><br/>
				<!-- 이미지 -->
				<!-- 이미지 저장할 때 맨 처음에 나오는 이미지는 '-'없이 숫자만 저장, 그 이후 이미지들은 '-' 붙여서 저장해야 잘 구현됨 -->
				<%
					String imagePath = application.getRealPath("/WEB-INF/images");
					File imageDir = new File(imagePath);
					File[] files = imageDir.listFiles();
					List<String> imageFiles = new ArrayList<>();
					TrendVO vo = (TrendVO) request.getAttribute("vo");
					int tnum = vo.getTnum();
					/* out.println("<p>tnum: " + tnum + "</p>"); */
					if (files != null) {
						for (File file : files) {
							if (file.isFile() && file.getName().startsWith(tnum + "-")) {
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
				<!-- 슬라이드 -->
				<div class="container text-center" style="width: 100%; height: 500px;">
					<div id="trend" class="mx-3 carousel slide" data-bs-ride="carousel" style="width: 97%">
						<div class="carousel-indicators">
				  	  		<button type="button" data-bs-target="#trend" data-bs-slide-to="0" class="active" style="background-color: black;"></button>
						  	<c:forEach var="i" begin="1" end="<%=imageFiles.size()%>">
							  	<button type="button" data-bs-target="#trend" data-bs-slide-to="${i}" style="background-color: black;"></button>
						  	</c:forEach>
					  	</div>
						<div class="carousel-inner text-center align-middle">
							<div class="carousel-item active">
								<img src="./images/<%= tnum %>.png" alt="<%= tnum %>" class="container px-2 d-flex justify-content-center d-block w-60" style="width: 70%; height: 480px;" />
							</div>
							<%
								for (String fileName : imageFiles) {
									/* out.println("<p>filename: " + fileName + "</p>"); */
							%>
									<div class="carousel-item">
										<img src="image?name=<%= fileName %>" alt="<%= fileName %>"  class="container px-2 d-flex justify-content-center d-block w-60" style="width: 70%; height: 500px;"/><br/>
									</div>
							<%
								}
							%>
						</div>
						<!-- 오른쪽/왼쪽 버튼 -->
						<button class="carousel-control-prev" type="button" data-bs-target="#trend" data-bs-slide="prev" style="height: 500px;">
							<span><i class="bi bi-chevron-left" style="color: black; font-size: 300%;"></i></span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#trend" data-bs-slide="next" style="height: 500px;">
							<span><i class="bi bi-chevron-right" style="color: black; font-size: 300%;"></i></span>
						</button>
					</div>
				</div>
				<!-- 블로그 방식 -->
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

				<%-- <br /><br /><p>${vo.maintext}</p><br /><br /> --%>
				<br/>
				<p class="d-flex justify-content-end">작성일: ${tdate}</p>
				<p class="d-flex justify-content-end">작성자: ${vo.writer}</p>
			</div>
			
			<!-- 좋아요, 스크랩, 공유, 목록보기 -->
			<div class="container px-2 d-flex justify-content-center" style="font-size: 120%;">
				<p>
					<!-- 로그인 되어있지 않은 경우 -->
					<c:if test="<%=nickname == null %>">
						<button class="btn" type="button" onclick="like();">
							<i class="bi bi-heart" style="color: red;"></i>&nbsp;${vo.lnum}
						</button>
					</c:if>
					<!-- 로그인 되어있는 경우 -->
					<c:if test="<%=nickname != null %>">
						<%
							int usernum = (int) session.getAttribute("usernum");
						%>
						<button class="btn" type="button" onclick="location.href='tlike?tnum=${vo.tnum}&lnum=${vo.lnum}&usernum=${usernum}'">
							<i class="bi bi-heart" style="color: red;"></i>&nbsp;${vo.lnum}
						</button>
					</c:if>
					&nbsp;&nbsp;&nbsp;
					<!-- 로그인 되어있지 않은 경우 -->
					<c:if test="<%=nickname == null %>">
						<button class="btn" type="button" onclick="like();">
							<i class="bi bi-bookmark" style="color: blue;"></i>
						</button>
					</c:if>
					<!-- 로그인 되어있는 경우 -->
					<c:if test="<%=nickname != null %>">
						<%
							int usernum = (int) session.getAttribute("usernum");
						%>
						<button class="btn" type="button" onclick="location.href='scrap?tnum=${vo.tnum}&title=${vo.title}&writer=${vo.writer}&lnum=${vo.lnum}&usernum=${usernum}'">
							<i class="bi bi-bookmark" style="color: blue;"></i>
						</button>
					</c:if>
					&nbsp;&nbsp;&nbsp;
					<button class="btn" type="button" value="링크복사" onclick="clip(); return false;">
						<i class="bi bi-share-fill"></i>&nbsp;(링크복사)
					</button>
				</p>
			</div>
			<form class="container px-2 d-flex justify-content-end" method="post">
				<input type="hidden" name="list" value="list" />
				<button class="btn" type="button" onclick="location.href='list'">목록보기</button>
			</form><hr/>
			<!-- 댓글 -->
			<div class="container px-2">
				<br /><h2 class="d-flex justify-content-start">댓글(${commentList.totalComment})</h2><br />
				<!-- 댓글 입력 -->
				<form action="insertcommentOK" method="post" name="commentForm">
					
					<!-- 로그인 되어있지 않은 경우 -->
					<c:if test="<%=nickname == null %>">
					<div class="container px-lg-2 d-flex justify-content-center">
						<textarea rows="2" cols="8" placeholder="댓글을 작성하려면 로그인 해주세요." style="width: 60%; border-radius: 6px;" disabled></textarea>
						&nbsp;&nbsp;<button class="btn btn-outline-success" disabled>등록</button>
					</div><br/>
					</c:if>

					<!-- 로그인 되어있는 경우 -->
					<c:if test="<%=nickname != null %>">
					<div class="container px-lg-2 d-flex justify-content-center">
						<textarea rows="3" cols="8" name="memo" style="width: 60%; border-radius: 6px; resize: none;"></textarea> &nbsp;&nbsp;
						<button class="btn btn-outline-success" type="submit" name="commentForm" style="width: 7%">등록</button>
					</div><br />
					</c:if>

					<!-- 테스트 후 화면에 보이지 않게 한다. -->
					<div style="display: none">
						<!-- 입력할 댓글의 트렌드번호 -->
						tnum: <input type="text" name="tnum" value="${vo.tnum}" />
					</div>
				</form>

				<!-- 댓글 출력 -->
				<c:set var="comment" value="${commentList.list}" />
				<!-- 후기가 없는 경우 -->
				<div class="container px-lg-1">
					<div class="row">
						<c:if test="${comment.size() == 0}">
							<div class="col-md-9">
								<h4>첫 번째 후기를 남겨주세요!</h4>
							</div>
							<div class="col-md-3 align-items-center">
								<div class="aside text-center align-middle">
								<br /><h4>${vo.writer}가 작성한 다른 글 <i class="bi bi-tags-fill" style="color: #3CB371;"></i></h4>
								<ul class="list-group list-group-flush" style="border-radius: 6px; box-shadow: 0px 0px 0px white, 10px 10px rgba(0,0,0,0.3);">
									<c:forEach var="trendList" items="${trendList.list}">
										<li class="list-group-item" style="background-color: #f3f9ef">
											<a href="selectByTnum?tnum=${trendList.tnum}" style="color: black; text-decoration: none;"><i class="bi bi-cursor-fill" style="color: #4682B4"></i> ${trendList.title}</a>
										</li>
									</c:forEach>
								</ul><br /><br />
								<a href="list2" style="color: black; text-decoration: none;">
									<i class="bi bi-joystick" style="font-size: 500%;"></i>
									<h4>게임하러 가기</h4>
								</a><br />
								</div>
							</div>
						</c:if>
					</div>
				</div>
				<!-- 후기가 있는 경우 -->
				<div class="container px-lg-1">
					<div class="row">
						<c:if test="${comment.size() != 0}">
							<div class="col-md-9">
								<ul class="list-group">
									<c:forEach var="co" items="${comment}" varStatus="view">
										<c:set var="nickname" value="${fn:replace(co.nickname, '<', '&lt;')}" />
										<c:set var="nickname" value="${fn:replace(nickname, '>', '&gt;')}" />
										<fmt:formatDate var="cdate" value="${co.cdate}" pattern="yy.MM.dd HH:mm:ss" />
										<c:if test="${view.index < 5}">
											<!-- 신고 10 이상이면 안보이게 -->
											<c:if test="${co.rnum > 10}">
												<li class="list-group-item" style="background-color: #e7f6e5; border-radius: 6px;">
													<br/><p>신고에 의해 삭제된 댓글입니다.</p>
												</li>
											</c:if>
											<c:if test="${co.rnum < 11}">
												<li class="list-group-item" style="background-color: #e7f6e5; border-radius: 6px;">
													<c:set var="sessionNick" value="<%=nickname%>"/>
													<div class="row mt-3">
														<span class="col-sm-4 d-flex justify-content-first">
															<span>${co.nickname}</span>&nbsp;&nbsp;
															<span>${cdate}</span> 
														</span> 
														<span class="col-sm-8 d-flex justify-content-end">
															<!-- 로그인 되어있지 않을 경우 좋아요 -->
															<c:if test="<%=nickname == null %>">
																<button class="btn" type="button" onclick="like();">
																	<i class="bi bi-heart" style="color: red;"></i>&nbsp;${co.lcnum}
																</button>
															</c:if>
															<!-- 로그인 되어있을 경우 좋아요 -->
															<c:if test="<%=nickname != null %>">
																<%
																	int usernum = (int) session.getAttribute("usernum");
																%>
																<button class="btn" type="button" onclick="location.href='clike?cnum=${co.cnum}&lcnum=${co.lcnum}&usernum=${usernum}&tnum=${vo.tnum}'">
																	<i class="bi bi-heart" style="color: red;"></i>&nbsp;${co.lcnum}
																</button>
															</c:if>
															<!-- 로그인 되어있는 경우에만 신고-->
															<c:if test="<%=nickname != null %>">
																<%
																	int usernum = (int) session.getAttribute("usernum");
																%>
																<button class="btn" type="button" onclick="location.href='report?cnum=${co.cnum}&rnum=${co.rnum}&tnum=${vo.tnum}&usernum=<%=usernum %>'" style="color: red; font-weight: bold;">신고</button>
															</c:if>
														</span>
														<c:set var="memo" value="${fn:replace(co.memo, '<', '&lt;')}" /> 
														<c:set var="memo" value="${fn:replace(memo, '>', '&gt;')}" /> 
														<c:set var="memo" value="${fn:replace(memo, enter, '<br/>')}" />
														<p class="d-flex justify-content-first">${memo}</p>
														<!-- 닉네임 일치시에만 댓글 수정 / 삭제 -->
														<c:if test="${co.nickname == sessionNick}">
															<p class="d-flex justify-content-end">
																<span>
																	<button class="btn btn-outline-warning" onclick="window.open('update?cnum=' + ${co.cnum} + '&tnum=' + ${vo.tnum}, 'update', 'width = 500, height = 400, top = 100, left = 200, location = no')">수정</button>
																	<script type="text/javascript">
																		window.name = 'trend'
																	</script>
																</span>
																<span>
																	<button class="btn btn-outline-danger" onclick="location.href='deletecommentOK?cnum=${co.cnum}&size=${comment.size()}&tnum=${vo.tnum}'">삭제</button>
																</span>
															</p>
														</c:if>
													</div> 
												</li>
											</c:if>
										</c:if>
										<c:if test="${view.index >= 5}">
											<!-- 신고 10 이상이면 안보이게 -->
											<c:if test="${co.rnum > 10}">
												<li class="trc list-group-item" style="display: none; background-color: #e7f6e5; border-radius: 6px;">
													<br/><p>신고에 의해 삭제된 댓글입니다.</p>
												</li>
											</c:if>
											<c:if test="${co.rnum < 11}">
												<li class="trc list-group-item" style="display: none; background-color: #e7f6e5; border-radius: 6px;">
													<c:set var="sessionNick" value="<%=nickname%>"/>
													<div class="row mt-3">
														<span class="col-sm-4 d-flex justify-content-first">
															<span>${co.nickname}</span>&nbsp;&nbsp;
															<span>${cdate}</span> 
														</span> 
														<span class="col-sm-8 d-flex justify-content-end">
															<!-- 로그인 되어있지 않을 경우 좋아요 -->
															<c:if test="<%=nickname == null %>">
																<button class="btn" type="button" onclick="like();">
																	<i class="bi bi-heart" style="color: red;"></i>&nbsp;${co.lcnum}
																</button>
															</c:if>
															<!-- 로그인 되어있을 경우 좋아요 -->
															<c:if test="<%=nickname != null %>">
																<%
																	int usernum = (int) session.getAttribute("usernum");
																%>
																<button class="btn" type="button" onclick="location.href='clike?cnum=${co.cnum}&lcnum=${co.lcnum}&usernum=${usernum}&tnum=${vo.tnum}'">
																	<i class="bi bi-heart" style="color: red;"></i>&nbsp;${co.lcnum}
																</button>
															</c:if>
															<!-- 로그인 되어있는 경우에만 신고-->
															<c:if test="<%=nickname != null %>">
																<%
																	int usernum = (int) session.getAttribute("usernum");
																%>
																<button class="btn" type="button" onclick="location.href='report?cnum=${co.cnum}&rnum=${co.rnum}&tnum=${vo.tnum}&usernum=<%=usernum %>'" style="color: red; font-weight: bold;">신고</button>
															</c:if>
														</span>
														<c:set var="memo" value="${fn:replace(co.memo, '<', '&lt;')}" /> 
														<c:set var="memo" value="${fn:replace(memo, '>', '&gt;')}" /> 
														<c:set var="memo" value="${fn:replace(memo, enter, '<br/>')}" />
														<p class="d-flex justify-content-first">${memo}</p>
														
														<!-- 닉네임 일치시에만 댓글 수정 / 삭제 -->
														<c:set var="sessionNick" value="<%=nickname%>"/>
														<c:if test="${co.nickname == sessionNick}">
															<p class="d-flex justify-content-end">
																<span>
																	<button class="btn btn-outline-warning" onclick="window.open('update?cnum=' + ${co.cnum} + '&tnum=' + ${vo.tnum}, 'update', 'width = 500, height = 400, top = 100, left = 200, location = no')">수정</button>
																	<script type="text/javascript">
																		window.name = 'trend'
																	</script>
																</span>
																<span>
																	<button class="btn btn-outline-danger" onclick="location.href='deletecommentOK?cnum=${co.cnum}&size=${comment.size()}&tnum=${vo.tnum}'">삭제</button>
																</span>
															</p>
														</c:if>
													</div> 
												</li>
											</c:if>
										</c:if>
									</c:forEach>
								</ul>
							</div>
							<div class="col-md-3 align-items-center">
								<div class="aside text-center align-middle">
								<br /><h4>${vo.writer}가 작성한 다른 글 <i class="bi bi-tags-fill" style="color: #3CB371;"></i></h4>
								<ul class="list-group list-group-flush" style="border-radius: 6px; box-shadow: 0px 0px 0px white, 10px 10px rgba(0,0,0,0.3);">
									<c:forEach var="trendList" items="${trendList.list}">
										<li class="list-group-item" style="background-color: #f3f9ef">
											<a href="selectByTnum?tnum=${trendList.tnum}" style="color: black; text-decoration: none;"><i class="bi bi-cursor-fill" style="color: #4682B4"></i> ${trendList.title}</a>
										</li>
									</c:forEach>
								</ul><br /><br />
								<a href="list2" style="color: black; text-decoration: none;">
									<i class="bi bi-joystick" style="font-size: 500%;"></i>
									<h4>게임하러 가기</h4>
								</a><br />
								</div>
							</div>
							<!-- 더보기 버튼 -->
							<div id="morediv" class="col-md-9">
								<c:if test="${commentList.totalComment > 5}">
									<button id="morebtn" class="btn" type="button" onclick="morebtn()">더보기<i class="bi bi-caret-down-fill"></i></button>
								</c:if>
								<input id="morecount" value=0 type="hidden"/>
								<input id="last" value="${commentList.totalComment}" type="hidden"/>
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