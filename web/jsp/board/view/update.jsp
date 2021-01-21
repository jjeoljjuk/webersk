<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.webweak.vo.BoardVO" %>

<%@ page import="com.webweak.dao.Board" %>
<%@include file="/tab.jsp"%>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>jsp 게시판 웹사이트</title>
</head>

<%
    String bdNo = request.getParameter("bdNo");

    BoardVO vo = new Board().choice(bdNo);

%>

<!-- 게시판 -->

<div class="container">

    <div class="row">

        <form method="post" action="../action/updateAction.jsp?bdNo=<%=bdNo%>" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
            <input type="text" name="bdUserId" value="<%= session.getAttribute("id")%>" style="width: 40px"/>
            <table class="table table-striped"

                   style="text-align: center; border: 1px solid #dddddd">

                <thead>

                <tr>
                    <th style="background-color: #eeeeee; text-align: center; width: 15%;height: 100%;">게시판 글쓰기</th>
                </tr>

                </thead>

                <tbody>

                <tr>

                    <td><input type="text" class="form-control" value="<%=vo.getBdTitle()%>" name="bdTitle" maxlength="50" style="width: 100%; height: 15%;"/></td>

                </tr>

                <tr>

                    <td><textarea class="form-control" name="bdContent" maxlength="2048" style="height: 350px; width: 100%";><%=vo.getBdContent()%></textarea></td>

                </tr>

                </tbody>

            </table>

            <input type="submit" class="btn btn-primary" style="width: 100%" value="수정" />

        </form>

    </div>

</div>









<!-- 애니매이션 담당 JQUERY -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


</body>

</html>


