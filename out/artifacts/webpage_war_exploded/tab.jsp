<%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 9/20/20
  Time: 9:19 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tapestry by TEMPLATED</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="/js/skel.min.js"></script>
    <script src="/js/skel-panels.min.js"></script>
    <script src="/js/init.js"></script>
    <noscript>
        <link rel="stylesheet" href="/css/skel-noscript.css" />
        <link rel="stylesheet" href="/css/style.css" />
        <link rel="stylesheet" href="/css/style-desktop.css" />
    </noscript>
</head>
<body>
    <div id="header-wrapper">
        <div class="container">
            <div id="header">
                <div id="logo">
                    <h1><a href="/index.jsp">Tapestry</a></h1>
                    <span>by TEMPLATED</span>
                </div>
                <% String sId = (String) session.getAttribute("id");  %>
                <nav id="nav">
                    <ul>
                        <li class="current_page_item"><a href="/index.jsp">홈</a></li>
                        <% if (sId == null){%>
                        <li><a href="/jsp/member/view/login.jsp">로그인</a></li>
                        <% }else { %>
                        <li><a href="/jsp/board/view/board.jsp">게시판</a></li>
<%--                        <li><a href="/jsp/board/view/test.jsp">자료실</a></li>--%>
                        <li><a href="/index.jsp" onclick="logOut()")>로그아웃</a></li>
                        <h1><%=sId%>환영합니다.</h1>
                        <%} %>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
<script>

    (function(){

    }())

    function logOut(){
    $.ajax({
       url:'/jsp/member/action/logOut.jsp',
        method:'POST',
        success:function () {
            alert('로그이아웃');
        },
        error:function (error) {
            alert(error);
        }
    });

    }






</script>
</html>
