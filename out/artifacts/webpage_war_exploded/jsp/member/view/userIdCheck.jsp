<%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 9/24/20
  Time: 3:01 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


<head>
    <title>아이디 찾기</title>

</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<body>
<div class="card-body">
    <h5 class="form-signin-heading">아이디</h5>
    <label class="sr-only">Your ID</label>
    <input type="text" id="uid" class="form-control" placeholder="Your ID" >
    <button id="btn-check" class="btn btn-lg btn-primary btn-block" onclick="idLikeCheck()">아이디 찾기</button>
    <samp id="idCheckBox"></samp><br><br>
</div>
</body>
<script src="/jsp/js/httpCode.js"></script>
<script>
    function idLikeCheck(){
        let uid = document.getElementById('uid').value;
        console.log(uid);
        $.ajax({
            type:"POST",
            url:"../action/userIdCheck.jsp",
            data:{uid:uid},
            success:function(data){
                console.log(data);
                if (data == success){
                    alert('아이디 중복 되었습니다.');
                }else if (data == failure){
                    alert('아이디 사용 가능합니다.');
                }else if (data == error){
                    alert('아이디 검사 에러')
                }
            },
            error:function(error){

            }

        });
    }
</script>
</html>
