/* 한글 정규식 */
const kor = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;

/* 특수문자 정규식 */
//const specialChar = /[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]/g;
const specialChar = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;

/* 닉네임 중복 체크 */
function NickCheck()
{
    let nickname = document.getElementById('nickname').value;
    $.ajax({
        type:"get",
        url:"./NickCheck",
        data:{nickname:nickname},
        success:function (data)
        {
            /* 닉네임을 입력하지 않았을 때 */
            if (nickname === "")
            {
                $("#nickname").css("background-color", "white");
                document.getElementById('NickCheckMsg').innerHTML = "";
                sessionStorage.setItem("nicksts","0");
            }
            /* 닉네임이 중복되지 않았을 때 */
            else if(nickname !== "" && data === 0)
            {
                if (specialChar.test(nickname) === true)
                {
                    $("#nickname").css("background-color", "salmon");
                    document.getElementById('NickCheckMsg').innerHTML = "닉네임에는 특수문자 사용이 불가능합니다.";
                    $("#NickCheckMsg").css("color","red");
                    sessionStorage.setItem("nicksts","0");
                }
                else
                {
                    $("#nickname").css("background-color", "lightgreen");
                    document.getElementById('NickCheckMsg').innerHTML = "사용 가능한 닉네임입니다.";
                    $("#NickCheckMsg").css("color","green");
                    sessionStorage.setItem("nicksts","1");
                }
            }
            /* 닉네임이 중복되었을 때(가입 불가) */
            else if(nickname !== "" && data === 1)
            {
                $("#nickname").css("background-color", "salmon");
                document.getElementById('NickCheckMsg').innerHTML = "이미 사용중인 닉네임입니다.";
                $("#NickCheckMsg").css("color","red");
                sessionStorage.setItem("nicksts","0");

            }
        },
        error:function (request, status, error)
        {
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            //alert("Error")
        }
    });
}

function IdCheck()
{
    let userid = document.getElementById('userid').value;
    $.ajax({
        type:"get",
        url:"./IdCheck",
        data:{userid:userid},
        success:function (data)
        {
            /* ID를 입력하지 않았을 때 */
            if (userid === "")
            {
                $(".SignUpBtn").prop("disabled", true).css("background-color", "#aaaaaa");
                $("#userid").css("background-color", "white");
                document.getElementById('IdCheckMsg').innerHTML = "";
                sessionStorage.setItem("idsts","0");

            }

            /* ID가 중복되지 않았을 때*/
            else if((userid !== "") && (data === 0))
            {
                if(kor.test(userid) === true)
                {
                    $("#userid").css("background-color", "salmon");
                    document.getElementById('IdCheckMsg').innerHTML = "ID에는 한글 사용이 불가능합니다.";
                    $("#IdCheckMsg").css("color","red");
                    sessionStorage.setItem("idsts","0");
                }
                else if(userid.length < 4)
                {
                    $("#userid").css("background-color", "salmon");
                    document.getElementById('IdCheckMsg').innerHTML = "ID는 4글자 이상이어야 합니다.";
                    $("#IdCheckMsg").css("color","red");
                    sessionStorage.setItem("idsts","0");
                }
                else
                {
                    $(".SignUpBtn").prop("disabled", false).css("background-color", "#aaaaaa");
                    $("#userid").css("background-color", "lightgreen");
                    document.getElementById('IdCheckMsg').innerHTML = "사용 가능한 ID입니다.";
                    $("#IdCheckMsg").css("color","green");
                    sessionStorage.setItem("idsts","1");
                }
            }

            /* ID가 중복되었을 때(가입 불가) */
            else if(userid !== "" && data === 1)
            {
                $(".SignUpBtn").prop("disabled", true).css("background-color", "#aaaaaa");
                $("#userid").css("background-color", "salmon");
                document.getElementById('IdCheckMsg').innerHTML = "이미 사용중인 ID입니다.";
                $("#IdCheckMsg").css("color","red");
                sessionStorage.setItem("idsts","0");
            }
        },
        error:function ()
        {
            alert("Error")
        }
    });
}

/* 비밀번호 일치 여부 체크 */
function PwCheck()
{
    let pw = document.getElementById('pw').value;
    let pwCheck = document.getElementById('pwCheck').value;

    /* 비밀번호와 재입력 결과가 일치할 경우 => 통과 */
    if ((pw === pwCheck) && (pw !== ""))
    {
        $(".SignUpBtn").prop("disabled", true).css("background-color", "#aaaaaa");
        $("#pw").css("background-color", "lightgreen");
        $("#pwCheck").css("background-color", "lightgreen");
        document.getElementById('PwCheckMsg').innerHTML = "";
        sessionStorage.setItem("pwsts","1");

    }

    /* 비밀번호와 재입력 결과가 불일치할 경우 => 다시 입력 */
    else if((pw !== pwCheck) && (pw !== ""))
    {
        $(".SignUpBtn").prop("disabled", true).css("background-color", "#aaaaaa");
        $("#pw").css("background-color", "salmon");
        $("#pwCheck").css("background-color", "salmon");
        document.getElementById('PwCheckMsg').innerHTML = "비밀번호가 일치하지 않습니다.";
        $("#PwCheckMsg").css("color","red");
        sessionStorage.setItem("pwsts","0");
    }

    /* 기타 상황일 경우 normal 상태 유지 */
    else
    {
        $(".SignUpBtn").prop("disabled", true).css("background-color", "white");
        $("#pw").css("background-color", "white");
        $("#pwCheck").css("background-color", "white");
        document.getElementById('PwCheckMsg').innerHTML = "";
        sessionStorage.setItem("idsts","0");
    }
}


function SignUpOK()
{
    let nickname = document.getElementById('nickname').value;
    let userid = document.getElementById('userid').value;
    let pw = document.getElementById('pw').value;
    let email = document.getElementById('email').value;
    let pwCheck = document.getElementById('pwCheck').value;
    let birth = document.getElementById('birth').value;

     let nicksts = sessionStorage.getItem("nicksts");
     let idsts = sessionStorage.getItem("idsts");
     //let emailsts = sessionStorage.getItem("emailsts");
     let pwsts = sessionStorage.getItem("pwsts");

    if ((nickname === "") || (userid === "") || (email === "") || (pw === "") || (pwCheck === ""))
    {
        alert("누락된 항목이 있습니다.");
        return false;
    }

    if ((nicksts === "1") && (idsts === "1") && (pwsts === "1"))
    {
        if (confirm('가입 하시겠습니까?') === true)
        {
            $.ajax({
                type:"POST",
                url:"./SignUpOk",
                data:{nickname:nickname, userid:userid, pw:pw, email:email, birth:birth},
                success:function ()
                {
                    alert(nickname + "님 가입 완료되었습니다.");
                    sessionStorage.clear();
                    window.location.href = "/tag/";
                },
                error:function (request, error)
                {
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    //alert("회원가입 오류, 관리자에게 문의 바랍니다.");
                    window.location.href="/tag/";
                }
            });
        }
        else
        {
            return false;
        }
    }
    else
    {
        alert("정보를 확인해주세요");
    }

}

function SignInOk()
{
    let userid = document.getElementById('loginId').value;
    let pw = document.getElementById('loginPassword').value;

    if((userid === "") || (pw === ""))
    {
        alert("아이디와 비밀번호를 확인하세요");
    }
    else
    {
        $.ajax({
            type:"POST",
            url:"./SignInOk",
            data:{userid:userid, pw:pw},
            success:function (data)
            {
                if(data === "1")
                {
                    alert("비밀번호를 확인하세요.");
                }
                else if(data === "0")
                {
                    alert("계정 정보가 존재하지 않습니다.");
                }
                else
                {
                    alert("로그인 되었습니다.");
                    window.location.href="/tag/"
                }
            },
            error:function (request,status,error)
            {
                //alert("로그인 중 문제가 발생하였습니다. 관리자에게 문의 바랍니다.");
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                history.back();
            }
        });
    }
}

