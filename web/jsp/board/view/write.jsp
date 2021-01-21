<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.PrintWriter"%>
<%@include file="/tab.jsp"%>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>jsp 게시판 웹사이트</title>
</head>



<!-- 게시판 -->

<div class="container">

    <div class="row">

        <form method="post" action="../action/writeAction.jsp" class="table table-striped"  enctype="multipart/form-data" style="text-align:center; border:1px solid #dddddd" accept-charset="UTF-8">
            <br>
            <br>
            <table class="table table-striped"

                   style="text-align: center; border: 1px solid #dddddd">

                <thead>

                <tr>
                    <th style="background-color: #eeeeee; text-align: center; width: 15%;height: 100%;">게시판 글쓰기</th>
                </tr>

                </thead>

                <tbody>

                <tr>
                    <td><input type="text" class="form-control" placeholder="글 제목" name="bdTitle" maxlength="50" style="width: 100%; height: 15%;"/></td>
                </tr>
                <tr>
                    <td><input type="file" class="form-control" placeholder="파일 이름" name="file" maxlength="50" style="width: 100%; height: 15%;"/></td>
                </tr>
                <tr>
                    <td><textarea class="form-control" placeholder="글 내용" name="bdContent" maxlength="2048" style="height: 350px; width: 100%";></textarea></td>
                </tr>

                </tbody>

            </table>

            <input type="submit" class="btn btn-primary" style="width: 100%" value="글쓰기" />

        </form>

    </div>

</div>









<!-- 애니매이션 담당 JQUERY -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


</body>

</html>


