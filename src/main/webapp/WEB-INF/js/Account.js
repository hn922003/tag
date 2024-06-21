function NickCheck()
{
    let nickname = document.getElementById('nickname').value;
    if (nickname === "")
    {
        alert("닉네임을 입력해주세요");
    }
    else
    {
        $.ajax({
            type:"get",
            url:"/NickCheck",
            data:{nickname:nickname},
            success:function (data)
            {
                if (data === 1)
                {
                    alert("이미 존재하는 닉네임입니다.");
                }
                else
                {
                    /* 닉네임 중복체크 버튼 비활성화(체크 완료) */
                    alert(nickname+"은(는) 사용 가능한 닉네임입니다.");
                    document.getElementById('NickCheckBtn').disabled = true;
                    document.getElementById('NickCheckBtn').innerText = "체크완료";
                    document.getElementById('nickname').readOnly = true;

                    /* 닉네임과 아이디 모두 중복체크 완료 시 회원가입 버튼 활성화 */
                    if ((document.getElementById('NickCheckBtn').disabled === true) && (document.getElementById('IdCheckBtn').disabled === true))
                    {
                        document.getElementById('SignUpBtn').disabled = false;
                    }
                }
            },
            error:function ()
            {
                alert("Error")
            }
        });
    }
}

function IdCheck()
{
    let userid = document.getElementById('userid').value;
    if (userid === "")
    {
        alert("ID를 입력해주세요");
    }
    else
    {
        $.ajax({
            type:"get",
            url:"/IdCheck",
            data:{userid:userid},
            success:function (data)
            {
                if (data === 1)
                {
                    alert("이미 존재하는 아이디입니다.");
                }
                else
                {
                    /* 아이디 중복체크 버튼 비활성화(체크 완료) */
                    alert(userid+"은(는) 사용 가능한 아이디입니다.");
                    document.getElementById('IdCheckBtn').disabled = true;
                    document.getElementById('IdCheckBtn').innerText = "체크완료";
                    document.getElementById('userid').readOnly = true;

                    /* 닉네임과 아이디 모두 중복체크 완료 시 회원가입 버튼 활성화 */
                    if ((document.getElementById('NickCheckBtn').disabled === true) && (document.getElementById('IdCheckBtn').disabled === true))
                    {
                        document.getElementById('SignUpBtn').disabled = false;
                    }
                }
            },
            error:function ()
            {
                alert("Error")
            }
        });
    }

}


function SignUpOK()
{
    let nickname = document.getElementById('nickname').value;
    let userid = document.getElementById('userid').value;
    let pw = document.getElementById('pw').value;
    let email = document.getElementById('email').value;
    let pwCheck = document.getElementById('pwCheck').value;

    if (confirm('가입 하시겠습니까?') === true)
    {
        if ((pw === "") || (pwCheck === ""))
        {
            alert("누락된 정보가 있습니다");
        }
        else
        {
            $.ajax({
                type:"POST",
                url:"/SignUpOk",
                data:{nickname:nickname, userid:userid, pw:pw, email:email},
                success:function ()
                {
                    alert(nickname + "님 가입 완료되었습니다.");
                    window.location.href = "/";
                },
                error:function ()
                {
                    alert("Error");
                }
            });
        }
    }
    else
    {
        return false;
    }
}

function SignInOk()
{
    let userid = document.getElementById('userid').value;
    let pw = document.getElementById('pw').value;

    if((userid === "") || (pw === ""))
    {
        alert("아이디와 비밀번호를 확인하세요");
    }
    else
    {
        $.ajax({
            type:"POST",
            url:"/SignInOk",
            data:{userid:userid, pw:pw},
            success:function (data)
            {
                if (data === 1)
                {
                    alert("로그인 성공");
                }
            },
            error:function ()
            {
                alert("Error");
            }
        });
    }
}
