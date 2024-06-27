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
	var tnum = document.getElementById("tnum").value
	if (confirm('신고하시겠습니까?')) {
		alert('신고접수완료')
		location.href = 'report?rnum=' + rnum + '&cnum=' + cnum + '&tnum=' + tnum
	} else {
		alert('신고접수취소')
	}
}

function morebtn() {
	let last = $('#last').val()
	last = parseInt(last)
	console.log(last)
	let morecount = $('#morecount').val()
	morecount = parseInt(morecount)
	console.log(morecount)
	for (i=morecount; i<morecount+5; i++) {
		$('.trc').eq(i).css('display', 'block');
		console.log(i)
		if (i >= last - 6) {
			$('#morediv').css('display', 'none');
		}
	}
	
	morecount = parseInt(morecount) + 5
	$('#morecount').val(morecount)
}

$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 700) {
            $('#toTop').fadeIn();            
        } else {
            $('#toTop').fadeOut();
        }
    });
    
    $("#toTop").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 100);
        return false;
    });
    
    $(window).scroll(function() {
        if ($(this).scrollTop() < 700) {
            $('#toDown').fadeIn();            
        } else {
            $('#toDown').fadeOut();
        }
    });
    
    $("#toDown").click(function() {
        $('html, body').animate({
            scrollTop : document.body.scrollHeight
        }, 100);
        return false;
    });
});


