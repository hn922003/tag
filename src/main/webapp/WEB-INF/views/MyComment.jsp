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
    <style>
        table, th, td {border: 1px solid black;}
    </style>
    <link rel="stylesheet" href="./css/mypage.css" />
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
<!-- 헤더 -->
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
</div>

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
</div>

<div style="display: flex">
    <div style="width: 15%;"></div>
    <div style="width: 70%; height: 100vh; background-color: lightgray;">
        <div id="maincont">
            <table style="width: 850px">
                <h2 style="margin-left: 5%"><%=nickname%>님의 댓글 목록</h2>
                <hr>
                <tr style="text-align: center">
                    <td style="width: 5%">No</td>
                    <td style="width: 9%">트렌드번호</td>
                    <td style="width: 10%">작성자</td>
                    <td style="width: 25%">트랜드제목</td>
                    <td style="width: 25%">내용</td>
                    <td style="width: 10%">작성일자</td>
                    <td style="width: 5%">좋아요</td>
                </tr>
                <c:forEach var="comment" items="${co}" varStatus="status">
                    <tr style="text-align: center">
                        <td>${status.count}</td>
                        <td>${comment.tnum}</td>
                        <td>${comment.writer}</td>
                        <td><a id="tredlink" href="./selectByTnum?tnum=${comment.tnum}">${comment.title}</a></td>
                        <td>${comment.memo}</td>
                        <td><fmt:formatDate value="${comment.cdate}" pattern="yyyy-MM-dd"/></td>
                        <td>${comment.lcnum}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div style="width: 15%;"></div>
</div>

</body>
</html>
