
<%@ page import="com.webweak.dao.ConnectionDB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.webweak.vo.UserVO" %>
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

<div class="card align-middle" style="width:20rem; border-radius:20px; margin-top: 50%;margin-bottom: 50%; margin-left: 45%;">
    <div class="card-title" style="margin-top:30px;">
        <h2 class="card-title text-center" style="color:#113366;">로그인</h2>
    </div>
    <div class="card-body">
        <form class="form-signin" action="../../jsp/action/member/loginNormal.jsp" method="POST">
            <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
            <label class="sr-only">Your ID</label>
            <input type="text" id="uid" class="form-control" name="userId" placeholder="Your ID" required autofocus><BR>
            <label class="sr-only">Password</label>
            <input type="password" id="upw" class="form-control" name="userPw" placeholder="Password" required><br>
            <div class="checkbox">

            </div>
            <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button>
        </form>

    </div>
</div>


</body>


</html>
