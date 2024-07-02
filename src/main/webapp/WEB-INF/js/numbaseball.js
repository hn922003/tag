document.addEventListener("DOMContentLoaded", function () {
	const levelInput = document.getElementById("levelInput");
    const levelBtn = document.getElementById("levelBtn");
    const gameContainer = document.getElementById("gameContainer");
	const userInput = document.getElementById("userInput");
	const guessBtn = document.getElementById("guessBtn");
	const result = document.getElementById("result");
	const history = document.getElementById("history");
	const retryBtn = document.getElementById("retryBtn");
	 
	let answer = generateRandomNumber();
	//result.innerText = `정답: ${answer}`;
	let attempts = [];
	const maxAttempts = 10;
	
	levelBtn.addEventListener("click", function () {
	    const level = parseInt(levelInput.value);
		console.log(level);
        if (isNaN(level) || level <= 2 || level >= 10) {
            alert("3 ~ 9 사이의 올바른 레벨을 입력하세요.");
            return;
        }

        answer = generateRandomNumber(level);
        userInput.placeholder = `${level} 자리 숫자를 입력하세요`;
        userInput.maxLength = level;
        gameContainer.style.display = "block"; // 게임 요소를 표시
        levelBtn.disabled = true; // 레벨 버튼을 비활성화
        levelInput.disabled = true; // 레벨 입력 필드를 비활성화
        //result.innerText = `정답: ${answer}`;  // 정답을 화면에 표시
    });
	
	// 경고 메시지
	guessBtn.addEventListener("click", function () {
	    const level = parseInt(levelInput.value);
		if (attempts.length >= maxAttempts) {
            alert("기회가 모두 소진되었습니다. 게임을 새로 시작하세요.");
            return;
       	}
       	
       	const guess = userInput.value;
        if (guess.length !== level || isNaN(guess)) {
            alert(level +"자리 숫자를 입력하세요.");
            return;
        }
        
        if (hasDuplicateDigits(guess)) {
            alert("중복되지 않는 " + level + "자리 숫자를 입력하세요.");
            return;
        }
        
        if (isDuplicateGuess(guess)) {
            alert("이미 입력한 숫자입니다. 다른 숫자를 입력하세요.");
            return;
        }
        
        const feedback = getFeedback(guess, answer);
        attempts.push({ guess, feedback });
        displayHistory();
        
        if (feedback.strikes === level) {
            result.innerText = "축하합니다! " +  attempts.length + "번 만에 맞추셨습니다!";
            guessBtn.disabled = true;
            retryBtn.style.display = "inline-block";
        } else if (attempts.length >= maxAttempts && feedback.strikes !== level) {
        	result.innerText = "기회가 모두 소진되었습니다. 정답은 " + answer + "였습니다.";
        	guessBtn.disabled = true;
            retryBtn.style.display = "inline-block";
        }

        // if (attempts.length >= maxAttempts && feedback.strikes !== level) {
            // alert("기회가 모두 소진되었습니다. 정답은 " + answer + "였습니다.");
            // guessBtn.disabled = true;
            // retryBtn.style.display = "inline-block";
        // }

        userInput.value = '';
	});
	 
	retryBtn.addEventListener("click", function () {
        // 게임 초기화
        levelInput.disabled = false;
        levelBtn.disabled = false;
        userInput.value = '';
        result.innerText = '';
        history.innerHTML = '';
        guessBtn.disabled = false;
        retryBtn.style.display = "none";
        gameContainer.style.display = "none";
        attempts = [];
    });
	 
	// 컴퓨터 숫자 지정
	function generateRandomNumber() {
	    const level = parseInt(levelInput.value);
	    let digits = new Set();
	    while (digits.size < level) {
	        digits.add(Math.floor(Math.random() * 10));
	    }
	    return Array.from(digits).join('');
    }
     
    // 숫자 내 중복 검사
    function hasDuplicateDigits(number) {
        const digits = new Set();
        for (let digit of number) {
            if (digits.has(digit)) {
                return true;
            }
            digits.add(digit);
        }
        return false;
    }
    
    // 이미 입력한 숫자 검사
    function isDuplicateGuess(guess) {
        return attempts.some(attempt => attempt.guess === guess);
    }
    
    // 스트라이크, 볼
    function getFeedback(guess, answer) {
        let strikes = 0;
        let balls = 0;

        for (let i = 0; i < guess.length; i++) {
            if (guess[i] === answer[i]) {
                strikes++;
            } else if (answer.includes(guess[i])) {
                balls++;
            }
        }

        return { strikes, balls };
    }
    
    // 결과 넣기
    function displayHistory() {
        history.innerHTML = attempts.map(attempt => {
            return `<p>${attempt.guess}: ${attempt.feedback.strikes} strike, ${attempt.feedback.balls} ball</p>`;
        }).join('');
    }
})

























