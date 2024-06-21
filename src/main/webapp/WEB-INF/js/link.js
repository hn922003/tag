function clip() {
	var url = ''
	var textarea = document.createElement('textarea')
	document.body.appendChild(textarea)
	url = document.location.href
	console.log(url)
	textarea.value = url
	textarea.select()
	document.execCommand('copy')
	document.body.removeChild(textarea)
	alert('URL이 복사되었습니다.')
}

function reportbtn() {
	var rnum = document.getElementById("rnum").value
	var cnum = document.getElementById("cnum").value
	if (confirm('신고하시겠습니까?')) {
		alert('신고접수완료')
		location.href = 'report?rnum=' + rnum + '&cnum=' + cnum
	} else {
		alert('신고접수취소')
	}
}
