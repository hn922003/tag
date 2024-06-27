<%@page import="com.tjoeun.tag.vo.TrendVO"%>
<%@page import="java.text.Collator"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tjoeun.tag.vo.CommentList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내정보</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
    <script type="text/javascript" src="./js/list.js" defer="defer"></script>
    <%--<link rel="stylesheet" href="./css/list.css" />--%>
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
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
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                         alt="No images"
                         style="width: 80px; padding: 5px; border-radius: 10px;">
                    <span class="loginInfo">
					<%-- 수정 - 닉네임 부분을 세션으로 변경 --%>
					<%
                        session = request.getSession();
                        out.println(session.getAttribute("nickname"));
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
                <button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;">
                    Logout
                </button>
            </div>
        </div>
    </div>
</div>

<div>
    닉네임: ${uo.nickname}<br>
    이메일: ${uo.email}<br>
    포인트: ${uo.point}<br>
    가입일자: ${uo.jdate}<br>
    내 댓글: <br>
    내 스크랩: <br>
</div>

</body>
</html>
