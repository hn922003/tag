<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rock-paper-scissor</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
	
	body {
		background-image: url('./images/background006.png');
		background-repeat: no-repeat;
		background-attachment: fixed;
  		background-size: 100% 100%;
	}
	
	.card {
		width: 256px;
		border-radius: 10px;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/rps.js" defer="defer"></script>
</head>

<body>
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


	<div id="com" style="display: flex; justify-content: center; background-color: #FAC8B5">
		<button class="btn" style="opacity: 0.1">가위<img class="card" alt="가위" src="./images/scissors.jpeg"></button>
		<button class="btn" style="opacity: 0.1">바위<img class="card" alt="바위" src="./images/rock.jpeg"></button>
		<button class="btn" style="opacity: 0.1">보<img class="card" alt="보" src="./images/paper.jpeg"></button>
	</div>
	
	<div id="res" style="text-align: center; vertical-align: middle; width: 100%; height: 2em; background-color: #FD7979;">CPU <span id="comScore">0</span></div>
	<div id="res" style="display: flex; justify-content: center; width: 100%; height: 4em; background-color: #CDCDCD;">
		<div style="width: 10em;"><span id="tryScore">0</span>번째 결과</div>
		<div style="width: 5em;"><span id="result"></span><br/></div>
	</div>
	<div id="res" style="text-align: center; vertical-align: middle; width: 100%; height: 2em; background-color: #7979FD;">YOU <span id="myScore">0</span></div>
	
	<div class="me" style="display: flex; justify-content: center; background-color: #B5C8FA;">
		<button class="btn btn_me" onclick="select(2)">가위<img class="card" alt="가위" src="./images/scissors.jpeg"></button>
		<button class="btn btn_me" onclick="select(0)">바위<img class="card" alt="바위" src="./images/rock.jpeg"></button>
		<button class="btn btn_me" onclick="select(1)">보<img class="card" alt="보" src="./images/paper.jpeg"></button>
	</div>
	
</body>
</html>