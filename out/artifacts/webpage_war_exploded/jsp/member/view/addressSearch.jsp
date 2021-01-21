

<%@ page import="com.webweak.dao.Address" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.webweak.live.FileAddress" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/09/05
  Time: 9:14 오후
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
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


    <title>주소 조회</title>
</head>
<body>
<div class="card align-middle" style="width:100%;">
    <div class="card-title" style="margin-top:30px;">
        <h2 class="card-title text-center" style="color:#113366;">주소 검색</h2>
    </div>
    <div class="card-body">


        <%
            Address ar = new Address();
            ArrayList<String> list = (ArrayList<String>) ar.addressList();
        %>








        <form class="form-signin" id="address-search" action="IdeaProjects/webapp/webpage/web/jsp/jsp/member/test.jsp" method="get" onsubmit="return false;">

            <h5 class="form-signin-heading">시도</h5>
            <select class="form-control" id="job" name="job">
                <option>::선택::</option>

                <% for (int i =0;i<list.size();i++){  %>
                    <%  out.println("<option value="+list.get(i)+">"+list.get(i)+"</option>");  %>
                <% } %>

            </select><br>

            <h5 class="form-signin-heading">시군구</h5>
            <select class="form-control" id="interest">
                <option>::선택::</option>

            </select><br>

            <h5 class="form-signin-heading">읍면동</h5>
            <input type="text" id="dong" class="form-control" name="dong" placeholder="읍면동" required><br>


            <h5 class="form-signin-heading">번지</h5>
            <input type="text" id="bun1"/>
            <samp>-</samp>
            <input type="text" id="bun2"/>

            <h5 class="form-signin-heading"></h5><br>

            <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" onclick="search()">검색</button>
        </form>
        <div id="search-list">

        </div>


    </div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/jsp/js/httpCode.js"></script>
<script src="/jsp/js/inputLengthCheck.js"></script>
<script src="/jsp/js/memberJoin.js"></script>



<script>

    let line1 = "";
    let line2 = "";
    let line3 = "";
    let line4 = 0;
    let line5 = 0 ;



    (function(){
        job();

        find_G();



    }())

    // 시도 데이터
    function job(){
        let select = document.getElementById('job');
        select.onchange = function () {
            if (select.value != "::선택::"){

                line1 = this.value;
                startSearch(this.value);

            }
        }
    }

    // 시도 검색 했을때 나오는 데이터
    function startSearch(value){
        $.ajax({
            type:"POST",
            url:"../action/addressFind_D.jsp",
            data:{choice:value},
            success:function(data){
                let list =data.split(',');

                // 시군구 리스트
                for (let i = 0;i<list.length;i++){
                    optionAdd(list[i])
                }

            },
            error:function(error){
                console.log("실패")
            }
        });
    }

    // 시군구 리스트 add
    function optionAdd(value){
        let select = document.getElementById('interest');
        select.innerHTML += "<option>"+value+"</option>"
    }

    // 시군구 데이터
    function find_G(){
        let find_G = document.getElementById('interest');
        find_G.onchange = function () {
            if (find_G.value != "::선택::") {
                line2 = this.value;
            }
        }
    }

    // 조회Btn
    function search() {
        // 읍면동
        line3 = document.getElementById('dong').value
        // 번지
        line4 = document.getElementById('bun1').value;
        line5 = document.getElementById('bun2').value;

        let searchListView = document.getElementById('search-list');



        $.ajax({
            type:"POST",
            url:"../action/addressSearch.jsp",

            data:{
                findD:line1,
                findG:line2,
                findDG:line3,
                findN1:line4,
                findN2:line5,
            },
            success:function(data){
                searchListView.innerHTML = data;
            },
            error:function(error){
                console.log("실패")
            }
        });

    }

    // 주소 결과
    function searchResult(value){
        opener.document.getElementById("uar").value = value;
        // 팝업창 닫기
        window.close();
    }

</script>
</html>
