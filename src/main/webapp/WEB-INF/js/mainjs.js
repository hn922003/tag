function categorySearch(){
	let category = document.getElementById('category').options[document.getElementById('category').selectedIndex].value
	
	document.getElementsByName('searchVal')[0].value = category
	document.getElementById('search').submit()
}

function showsearchbox(){
	if (document.getElementById('searchbox').style.display == 'none')
	{
		document.getElementById('searchbox').style.display = 'block'
	}
	else if (document.getElementById('searchbox').style.display == 'block')
	{
		document.getElementById('searchbox').style.display = 'none'
	}
}

function showloginbox(){
	if (document.getElementById('loginbox').style.display == 'none')
	{
		document.getElementById('loginbox').style.display = 'block'
	}
	else if (document.getElementById('loginbox').style.display == 'block')
	{
		document.getElementById('loginbox').style.display = 'none'
	}
}


function pills_login()
{
	if (document.getElementById('pills-register').style.display == 'block'){
		document.getElementById('pills-register').style.display = 'none'
	}

	if (document.getElementById('pills-login').style.display == 'none'){
		document.getElementById('pills-login').style.display = 'block'
	}
}

function pills_register(){
	if (document.getElementById('pills-login').style.display == 'block'){
		document.getElementById('pills-login').style.display = 'none'
	}
	if (document.getElementById('pills-register').style.display == 'none'){
		document.getElementById('pills-register').style.display = 'block'
	}
}

function pills_mypage()
{
	if (document.getElementById('pills-mypage').style.display == 'none')
	{
		document.getElementById('pills-mypage').style.display = 'block'
	}
}

function pills_close(){
	if (document.getElementById('loginbox').style.display == 'block'){
		document.getElementById('loginbox').style.display = 'none'
	}
}

$(() => { 
   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
   var tooltipList = tooltipTriggerList.map(tooltipTriggerEl => {
     return new bootstrap.Tooltip(tooltipTriggerEl)
   })
})

function goodCHK(tnum,lnum,nick)
{
	console.log(tnum,lnum,nick);
	if (nick === null)
	{
		alert("로그인 후 이용 가능합니다.")
	}
	else
	{
		return window.location.href = `tlike?$tnum=${tnum}&lnum=${lnum}`;
	}
}