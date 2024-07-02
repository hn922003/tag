<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BaskinRobbins31</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script type="text/javascript" src="./baskinrobbins31.js" defer="defer"></script>
</head>
<body>

	<div class="mt-5 container text-center">
		<h3>BaskinRobbins31</h3><br/>
		<p>차례대로 숫자를 부르다가 31을 부르면 Game Over!</p>
		<p>한 번에 1 ~ 3개의 숫자를 부를 수 있습니다</p>
		<p>시작버튼을 누르면 컴퓨터부터 시작합니다!</p>
		<div>
			<button id="startBtn" class="btn btn-success">시작</button>
		</div>
		<div class="gameContainer align-middle" style="display: block;">
			<br/><input type="text" id="user" placeholder="1 ~ 3 사이의 숫자를 입력하세요" style="width: 23%;">
			<button id="userBtn" class="btn btn-primary btn-sm">입력</button>
		</div>
		<div id="result"></div>
		<div id="history"></div>
		<button id="retryBtn" class="btn btn-dark btn-sm" style="display:none;">다시하기</button>
	</div><br/>
	
</body>
</html>