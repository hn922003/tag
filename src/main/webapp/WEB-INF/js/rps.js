let tryScore = 0
let myScore = 0
let comScore = 0

$(() => {
	$('.btn_me').click(() => {
		$(this).css('color', 'red')
		console.log($(this))
	})
})


function select(num) {
	
	
	let me = num
	let com = Math.floor(Math.random() * 3)
	
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
		$('#result').append(result + '<br/>')
	} else if((me === 2 && com === 1) || (me === 1 && com === 0) || (me === 0 && com === 2)){
		let result = 'Win'
		myScore += 1
		$('#result').append(result + '<br/>')
		$('#myScore').text(myScore)
	} else {
		let result = 'Lose'
		comScore += 1
		$('#result').append(result + '<br/>')
		$('#comScore').text(comScore)
	}
	
}