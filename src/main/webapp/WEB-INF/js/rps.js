let tryScore = 0
let myScore = 0
let comScore = 0
let wins = 0
let winsrec = 0

$(() => {

})


function select(num) {
	
	let me = num
	let com = Math.floor(Math.random() * 3)
	
	if (me === '가위') me = 2;
	else if (me === '바위') me = 0;
	else if (me === '보') me = 1;
	
	if(com === 0){
		$('#com').html(`
			<button class="btn" style="opacity: 0.1">가위<img class="card" alt="가위" src="./images/scissors.jpeg"></button>
			<button class="btn" style="border: 1px solid red;">바위<img class="card" alt="바위" src="./images/rock.jpeg"></button>
			<button class="btn" style="opacity: 0.1">보<img class="card" alt="보" src="./images/paper.jpeg"></button>
		`)
	} else if(com === 1){
		$('#com').html(`
			<button class="btn" style="opacity: 0.1">가위<img class="card" alt="가위" src="./images/scissors.jpeg"></button>
			<button class="btn" style="opacity: 0.1">바위<img class="card" alt="바위" src="./images/rock.jpeg"></button>
			<button class="btn" style="border: 1px solid red;">보<img class="card" alt="보" src="./images/paper.jpeg"></button>
		`)
	} else if(com === 2){
		$('#com').html(`
			<button class="btn" style="border: 1px solid red;">가위<img class="card" alt="가위" src="./images/scissors.jpeg"></button>
			<button class="btn" style="opacity: 0.1">바위<img class="card" alt="바위" src="./images/rock.jpeg"></button>
			<button class="btn" style="opacity: 0.1">보<img class="card" alt="보" src="./images/paper.jpeg"></button>
		`)
	}
	
	tryScore += 1
	$('#tryScore').text(tryScore)
	if(me === com){
		let result = 'Draw'
		
		$('#res').text(result)
		$('#result').prepend(tryScore + '. ' + num + ' ' + result + ' ' + num + '<br/>')
	} else if((me === 2 && com === 1) || (me === 1 && com === 0) || (me === 0 && com === 2)){
		let result = 'Win'
		myScore += 1
		
		if (com === 0) com = '바위'
		else if (com === 1) com = '보'
		else if (com === 2) com = '가위'
		
		wins += 1
		$('#wins').text(wins)
		if (winsrec < wins) {
			winsrec = wins
			$('#winsrec').text(winsrec)
		}
		
		$('#res').text(result)
		$('#result').prepend(tryScore + '. ' + num + ' ' + result + ' ' + com + '<br/>')
		$('#myScore').text(myScore)
	} else {
		let result = 'Lose'
		comScore += 1
		wins = 0
		
		if (com === 0) com = '바위'
		else if (com === 1) com = '보'
		else if (com === 2) com = '가위'
		
		$('#wins').text(wins)
		$('#res').text(result)
		$('#result').prepend(tryScore + '. ' + num + ' ' + result + ' ' + com + '<br/>')
		$('#comScore').text(comScore)
	}
	
	$('#point').text((myScore - comScore) * winsrec)
}