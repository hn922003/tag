document.addEventListener("DOMContentLoaded", function () {
	const startBtn = document.getElementById("startBtn");
	const user = document.getElementById("user");
	const cpu = document.getElementById("cpu");
	const result = document.getElementById("result");
	const history = document.getElementById("history");
	const retryBtn = document.getElementById("retryBtn");

	let cpu = generateRandomNumber();
	console.log(cpu);
	let attempts = [];
	
	startBtn.addEventListner("click", function () {
		history.innerHTML = `<p>${cpu}</p>`;
		gameContainer.style.display = "block";
		startBtn.disabled = true;
	})
	
	// 컴퓨터 숫자 지정
	function generateRandomNumber() {
	    let digits = new Set();
	    while (digits.size < 3) {
	        digits.add(Math.floor(Math.random() * 10 + 1));
	    }
	    return Array.from(digits).join('');
    }
    
    // 경고 메시지
    userBtn.addEventListener("click", function () {
    	const user = parseInt(user.value);
    	if (user > 3 || user < 0 || isNaN(user)) {
    		alert("1 ~ 3 사이의 숫자를 입력하세요.");
    		return;
    	}
    	
    	user.value = '';
    })
	
})