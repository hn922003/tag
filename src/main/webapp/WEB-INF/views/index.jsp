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
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet" />
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
	
	.container-fluid {
		width: 100%;
		height: 40rem;
	}
	
	.cont {
		-webkit-backdrop-filter: contrast(300%);
  		backdrop-filter: contrast(300%);
		padding: 10px;
		margin: 5px;
		width: 90%;
		height: 90%;
		border-radius: 0.5rem;
		border: 1px solid #5A5A5A66;
    	box-shadow: 0px 0px 0px white, 0.625rem 0.625rem rgba(0,0,0,0.3);
    	word-wrap: break-word;
    	overflow: auto;
    	transition: 0.25s;
	}
	
	.cont:hover {
		transform: scale(105%, 110%);
		box-shadow: 0px 0px 1rem white, 0.625rem 0.625rem rgba(0,0,0,0.3);
	}
	
	.cont:active {
		transform: scale(90%, 95%);
	}
	
	.title {
		font-family: "Anton", sans-serif;
	 	font-weight: 400;
	 	font-style: normal;
	 	font-size: 1.5rem;
	 	-webkit-text-stroke: 0.5px black;
		color: white;
		text-shadow: 2px 2px 5px #000000;
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
<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
</head>
<body>

<div class="header" style="display: flex; align-items: center; justify-content: space-around; border: 1px solid silver; width: 100%; height: 10rem;">
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

<div id="loginbox"
	 style="position: absolute;
			top: 5rem; 
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
	      <!-- Email input -->
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="email" id="loginName" class="form-control" placeholder="Username"/>
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
	      <button type="submit" style="width: 100%;" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-block mb-4">Login</button>
		  
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
	
	      <!-- Name input -->
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" id="registerName" class="form-control" placeholder="Name"/>
	      </div>
	
	      <!-- Username input -->
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="text" id="registerUsername" class="form-control" placeholder="Username"/>
	      </div>
	
	      <!-- Email input -->
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="email" id="registerEmail" class="form-control" placeholder="Email"/>
	      </div>
	
	      <!-- Password input -->
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="password" id="registerPassword" class="form-control" placeholder="Password"/>
	      </div>
	
	      <!-- Repeat Password input -->
	      <div data-mdb-input-init class="form-outline mb-4">
	        <input type="password" id="registerRepeatPassword" class="form-control" placeholder="Repeat Password"/>
	      </div>
	
	      <!-- Checkbox -->
	      <div class="form-check d-flex justify-content-center mb-4">
	        <input class="form-check-input me-2" type="checkbox" value="" id="registerCheck" checked
	          aria-describedby="registerCheckHelpText"/>
	        <label class="form-check-label" for="registerCheck">
	          I have read and agree to the terms
	        </label>
	      </div>
	
	      <!-- Submit button -->
	      <button type="submit" style="width: 100%;" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-block mb-3">Sign in</button>
	    </form>
	  </div>
	  <div id="pills-mypage" style="width: 20rem; display: none;">
	  	<div data-mdb-input-init class="form-outline mb-4">
	  		<div class="d-flex align-items-center justify-content-center"
				style="width: 100%; height: 100%; max-height: 5rem; border-radius: 0.5rem; background-color: #eae2e2;">
	               <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
	                 alt="No images"
	                 style="width: 80px; padding: 5px; border-radius: 10px;">
				<span class="loginInfo"><strong>Username</strong></span><br/>
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

<div class="container-fluid" style="display: flex; justify-content: center;">
	<c:set var="trendlist" value="${trendList.list}"/>

	<div style="display: grid;
				grid-template-columns: 100%; 
				grid-template-rows: repeat(4, 25%); 
				width: 25%;
				border: 1px solid silver;">
		<c:forEach var="trend" items="${trendlist}" begin="0" end="2">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont left" style="width: 95%; background-color: <%=colorcode %>" onclick="location.href='content?tnum=${trend.tnum}'">
				<span class="title">${trend.title}</span>
			</div>
		</c:forEach>
	</div>
	
	
	
	<div style="display: grid;
				grid-template-columns: 50% 50%; 
				grid-template-rows: repeat(4, 25%); 
				width: 25%;
				border: 1px solid silver;">
		<c:forEach var="trend" items="${trendlist}" begin="3" end="10">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont mid" style="background-color: <%=colorcode %>; float: left;" onclick="location.href='content?tnum=${trend.tnum}'">
				<span class="title">${trend.title}</span>
			</div>
		</c:forEach>
	</div>
		
	<div style="display: grid;
				grid-template-columns: 100%; 
				grid-template-rows: repeat(4, 25%);  
				width: 12.5%;
				border: 1px solid silver;">
		<c:forEach var="trend" items="${trendlist}" begin="11" end="14">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont mid" style="background-color: <%=colorcode %>;" onclick="location.href='content?tnum=${trend.tnum}'">
				<span class="title">${trend.title}</span>
			</div>
		</c:forEach>
	</div>
	
	<div style="display: grid;
				grid-template-columns: repeat(3, 33.333%); 
				grid-template-rows: repeat(4, 25%);
				grid-auto-flow: row dense;
				grid-auto-flow: column dense;
				width: 37.5%;
				border: 1px solid silver;">
		<c:forEach var="trend" items="${trendlist}" begin="15" end="15">
			<% 
				String letters = "0123456789ABCDEF";
				String colorcode = "#";
				for (int i = 0; i < 6; i++){
					colorcode += letters.charAt((int)Math.floor(Math.random() * 16));
				}
				colorcode += "A8";
			%>
			<div class="cont right" style="width: 95%; height: 95%; grid-column: 1 / 3; grid-row: 1 / 3; background-color: <%=colorcode %>;" onclick="location.href='content?tnum=${trend.tnum}'">
				<span class="title">${trend.title}</span>
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
			<div class="cont right2" style="width: 95%; grid-column: 1 / 3; grid-row: 3 / 4; background-color: <%=colorcode %>;" onclick="location.href='content?tnum=${trend.tnum}'">
				<span class="title">${trend.title}</span>
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
			<div class="cont mid4" style="grid-column: 3 / 4; grid-row: 3 / 4; background-color: <%=colorcode %>;" onclick="location.href='content?tnum=${trend.tnum}'">
				<span class="title">${trend.title}</span>
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
			<div class="cont mid4" style="grid-column: 1 / 2; grid-row: 4 / 5; background-color: <%=colorcode %>;" onclick="location.href='content?tnum=${trend.tnum}'">
				<span class="title">${trend.title}</span>
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
			<div class="cont mid4" style="width: 95%; grid-column: 2 / 4; grid-row: 4 / 5; background-color: <%=colorcode %>;" onclick="location.href='content?tnum=${trend.tnum}'">
				<span class="title">${trend.title}</span>
			</div>
		</c:forEach>
		
	</div>

</div>

</body>
</html>