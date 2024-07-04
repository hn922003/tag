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

<h2>내 정보</h2><br/>
<%-- 세션 정보 받아오기 --%>
<%
    session = request.getSession();
    String nickname = (String) session.getAttribute("nickname");
    String point = String.valueOf(session.getAttribute("point"));
%>

<div id="loginbox"
     style="position: absolute;
			top: 6.5rem;
			right: 2rem;
			padding: 1rem;
			display: none;
			border: 1px solid silver;
			background-color: white;
			z-index: 1;">
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
                <button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;">
                    스크랩
                </button>
            </div>

            <div data-mdb-input-init class="form-outline mb-4">
                <button type="button" class="btn btn-outline-dark btn-floating mx-1" style="width: 100%;">
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
</div>

<div>
    닉네임: ${uo.nickname}<br>
    이메일: ${uo.email}<br>
    포인트: ${uo.point}<br>
    가입일자: ${uo.jdate}<br>
    내 댓글: ${commentCnt}개<br>
    내 스크랩: ${scrapCnt}<br>
</div>

</body>
</html>
