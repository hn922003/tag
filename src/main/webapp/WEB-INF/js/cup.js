let tryScore = 0
let points = 0
let pp = 0
let wins = 0
let winsrec = 0

$(() => {

})


function select(num) {
	let corr = Math.floor(Math.random() * 4) + 1
	let winsalt = document.getElementsByClassName('winsalt')
	if (corr === num){
		wins += 1
		if (wins === 1) pp = Math.floor(Math.random() * 21) + 20
		else if (wins === 2) pp = Math.floor(Math.random() * 41) + 50
		else if (wins === 3) pp = Math.floor(Math.random() * 41) + 100
		else pp = 50 * wins
		
		for (let i = 1; i <= 5; i++){
			winsalt[i-1].style.background = '#CDCDCD';
			if (wins >= 4) winsalt[3].style.background = 'yellow';
			else if (wins === i) winsalt[i-1].style.background = 'yellow';
		}
		
		if (winsrec < wins) {
			winsrec = wins
			$('#winsrec').text(winsrec)
		}
		
		points += pp
		pp = '+' + pp
		
	} else {
		wins = 0
		pp = -(Math.floor(Math.random() * 30) + 1)
		
		for (let i = 1; i <= 5; i++) winsalt[i-1].style.background = '#CDCDCD'
		winsalt[4].style.background = 'yellow'
		
		points += pp
	}
	
	let res = ""
	for (let i = 1; i <= 4; i++) {
		if (i == corr) res += "<img class='cup' alt='Answer↓' src='./images/ball.png'>"
		else res += "<img class='cup' alt='cup' src='./images/cup.jpeg'>"
	}
	document.getElementById('result').innerHTML = res
	
	tryScore += 1
	$('#wins').text(wins)
	$('#pp').text(pp)
	$('#point').text(points)
	$('#history').prepend(tryScore + '. Choice : ' + num + ', Answer : ' + corr + '<br/>')
}