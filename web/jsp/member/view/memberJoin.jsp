
<%@ page import="com.webweak.dao.ConnectionDB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.webweak.vo.UserVO" %>
<%@ page import="com.webweak.dao.Member" %>
<%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/08/18
  Time: 12:35 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">




    <title>로그인</title>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

<div class="card align-middle" style="width:30rem; border-radius:30px; margin-top: 50%;margin-bottom: 50%; margin-left: 40%;">
    <div class="card-title" style="margin-top:30px;">
        <h2 class="card-title text-center" style="color:#113366;">회원가입</h2>
    </div>
    <div class="card-body">
        <form class="form-signin" id="form-memberJoin" action="../action/memberJoin.jsp" method="POST" onsubmit="return false;">

            <h5 class="form-signin-heading">아이디</h5>
            <label class="sr-only">Your ID</label>
            <input type="text" id="uid" class="form-control" name="userId" placeholder="Your ID" >
            <button id="btn-check" class="btn btn-lg btn-primary btn-block" onclick="idCheck()">증복확인</button>
            <samp id="idCheckBox"></samp><br><br>

            <h5 class="form-signin-heading">비밀번호</h5>
            <label class="sr-only">Password</label>
            <input type="password" id="upw1" class="form-control" name="userPw" placeholder="Password">
            <samp id="pwCheckBox1"></samp><br><br>

            <h5 class="form-signin-heading">비밀번호 재확인</h5>
            <label class="sr-only">PasswordCheck</label>
            <input type="password" id="upw2" class="form-control" name="" placeholder="Password Check">
            <samp id="pwCheckBox2"></samp><br><br>

            <h5 class="form-signin-heading">이름</h5>
            <label class="sr-only">이름</label>
            <input type="text" id="uname" class="form-control" name="userName" placeholder="Name">
            <samp id="nameCheckBox"></samp><br><br>

            <h5 class="form-signin-heading">생년월일</h5>
            <label class="sr-only">생년월일</label>
            <input type="date" id="udate" class="form-control" name="dateJoin" placeholder="Password">
            <samp id="dataCheckBox"></samp><br><br>

            <h5 class="form-signin-heading">성별</h5>
            <label class="sr-only">성별</label>
            <div>
                <input type="radio" id="male"   name="gender" value="M">남성&nbsp;&nbsp;
                <input type="radio" id="female" name="gender" value="F">여성&nbsp;&nbsp;
                <input type="radio" id="gender" name="gender" value="U">선택 안함
                <br>
                <samp id="genderCheckBox"/>
            </div>
            <br>

            <h5 class="form-signin-heading">본인 확인 이메일</h5>
            <label class="sr-only">이메일</label>
            <input type="email" id="uemail" class="form-control" name="email" placeholder="Eamil">
            <samp id="emailCheckBox"></samp><br><br>


            <h5 class="form-signin-heading">주소</h5>
            <label class="sr-only">Password</label>
            <input type="text" id="uar" class="form-control" name="address" placeholder="Address">
            <button id="btn-address" class="btn btn-lg btn-primary btn-block" onclick="addressSearch()">주소 조회</button>
            <samp id="addressCheck"></samp><br><br>

            <h5 class="form-signin-heading">휴대전화</h5>
            <label class="sr-only">Password</label>
            <input type="tel" id="uphone" class="form-control" name="phone" placeholder="Pon" maxlength="13">
            <samp id="ponCheck"></samp><br><br>

            <div class="checkbox">

            </div>
            <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" onclick="joinBtn()">가입하기</button>
        </form>

    </div>
</div>


</body>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/jsp/js/httpCode.js"></script>
<script src="/jsp/js/inputLengthCheck.js"></script>
<script src="/jsp/js/memberJoin.js"></script>

<script>

    // 즉시 실행 함수 !!
    (function () {
        onkeyup = main;
        onclick = main;
    }());

    // 팝업장 없에도 됨 기능 ß만듬 심심해서
    // function uIdCheck(){
    //     let url = './addressSearch.jsp';
    //     window.open(url, "151012","width=462,height=275, left=200,top=110,scrollbars=no");
    //
    // }


    function main() {


        idCheck();
        pwCheck();
        nameCheck();
        dataCheck();
        genderCheck();
        emailCheck();
        addressCheck();
        ponCheck();


        // console.log("idCheck :" + idCheck());
        // console.log("pwCheck :" + pwCheck());
        // console.log("nameCheck :" + nameCheck());
        // console.log("dataCheck :" + dataCheck());
        // console.log("genderCheck :" + genderCheck());
        // console.log("emailCheck :" + emailCheck());
        // console.log("addressCheck :" + addressCheck());
        // console.log("ponCheck :" + ponCheck());


    }



</script>


</html>
