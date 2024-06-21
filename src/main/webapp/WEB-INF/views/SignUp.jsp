<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/Account.js"/>"></script>
	<link rel="stylesheet" href="./css/SignUp.css"/>
</head>
<body>
<!--  html 전체 영역 -->
<div id="container">

    <!--  회원가입 AccountForm -->
    <div id="loginBox">

        <!-- 제목 -->
        <div id="Title">Tag 회원가입</div>
        <div id="inputBox">

            <form action="<c:url value="/SignUp"/>" method="post">

                <div class="input-form-box">
                    <span>닉네임</span>
                    <input type="text" style="width: 170px" id='nickname' name="nickname" class="form-control">
                    <button class="btn btn-sm btn-success" type="button" id="NickCheckBtn" name="NickCheckBtn" onclick="NickCheck()" style="margin-left:3%">중복확인</button>
                </div>


                <div class="input-form-box">
                    <span>이메일</span>
                    <input type="text" style="width: 150px"  id="email" name="email" class="form-control">
                </div>


                <div class="input-form-box">
                    <span>아이디</span>
                    <input type="text" style="width: 170px" id="userid" name="userid" class="form-control">
                    <button class="btn btn-sm btn-success" type="button" id="IdCheckBtn" name="IdCheckBtn" onclick="IdCheck()" style="margin-left:3%">중복확인</button>
                </div>


                <div class="input-form-box">
                    <span>비밀번호</span>
                    <input type="password" style="width: 170px" id='pw' name="pw" class="form-control">
                </div>


                <div class="input-form-box">
                    <span>비밀번호 확인</span>
                    <input type="password" style="width: 170px; margin-left: 2%" id='pwCheck' name="pwCheck" class="form-control">
                    <span id="pwCheckText"></span>
                </div>


                <br>
                <div class="button-login-box">
                    <button type="button" id="SignUpBtn" disabled="disabled" class="btn btn-primary btn-xs" onclick="SignUpOK()" style="width:100%; margin-right:5px">회원가입</button>
                    <button type="button" class="btn btn-secondary btn-xs" onclick="location.href='/'" style="width:100%">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
