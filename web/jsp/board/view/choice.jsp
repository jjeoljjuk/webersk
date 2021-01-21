<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.webweak.dao.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="com.webweak.vo.*" %>
<%@include file="/tab.jsp"%>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>jsp 게시판 웹사이트</title>
</head>

<%
    String bdNo = request.getParameter("bdNo");

    int pg = 1;
    if (request.getParameter("pg") != null){
        pg = Integer.parseInt(request.getParameter("pg"));
    }


    BoardVO vo = new Board().choice(bdNo);
    int cmSize = new Board().commentSize(bdNo);

%>

<% if (sId.equals(vo.getBdUserId())){%>
<button><a href="../view/update.jsp?bdNo=<%=bdNo%>">수정</a></button>
<button onclick="box()">삭제</button>
<%}%>

<!-- 게시판 -->
<div class="container">
    <div style="text-align: center; border: 1px solid #dddddd">
                <tr>
                    <h3 style="background-color: #eeeeee; text-align: center;width: 100%; height: 30px;">게시글</h3>
                </tr>

                <tr>
                    <th style="text-align: left; border: 1px solid #1C1C1C; border: 1px solid #1C1C1C; text-align: center; height: 30px; background-color:#FFFFFF;" >방번호 : (<%= bdNo %>) 글제목 :<%=vo.getBdTitle()%></th>
                    <hr>
                    <th style="text-align: left;  height: 30px; background-color:#FFFFFF;" >이름 : <%=vo.getBdUserId()%></th>
                </tr>

                <tr>


                    <td style="vertical-align: top">
                        <p style="height: 350px; width: 100%; text-align: left;margin: 5px;background-color: #FFFFFF; border: 1px solid #000000;" >
                                <%=vo.getBdContent()%>
                        </p>

                    </td>
                    <%String fileUrl ="";%>
                    <%--        로컬            --%>
                    <%fileUrl ="http://127.0.0.1:8080/upload/"+vo.getBdFileName();%>
                    <%--        실서버            --%>
<%--                    <% fileUrl = "http://192.168.56.102:8080/upload/"+vo.getBdFileName();%>--%>
                    <% if (vo.getBdFileName() != null){%>
                    <td><img src="<%=fileUrl%>"/></td>
<%--                    <td><a href="<%=fileUrl%>"download><%=vo.getBdFileName()%></a></td>--%>
<%--                    <td><a href="../action/fileDownload.jsp?file" download><%=vo.getBdFileName()%></a></td>--%>
                    <td><a href="../action/fileDownload.jsp?fileName=<%=vo.getBdFileName()%>"><%=vo.getBdFileName()%></a></td>
                    <%}%>
                </tr>


    </div>

    <div style="background-color: #eeeeee;">
        <h2>댓글 <%=cmSize%></h2>
        <%
            PagingActionVO pgVO= new Board().paging(new PagingVO(5,5,cmSize,pg));
            List<CommentVO> list = new Board().comment(bdNo,pgVO.getPageStart(),pgVO.getPageEnd());
        %>

        <%--  댓글      --%>
        <%--        <% for(CommentVO cmVO: list){ %>--%>
        <% for(int i =0;i<list.size();i++){%>
        <hr>
        <ul style="height: 10%" >
            <li><%=list.get(i).getCmUserId()%></li>
            <li><%=list.get(i).getCmContent()%></li>
            <li><%=list.get(i).getCmFirstDate()%></li>
            <% if (list.get(i).getCmUserId().equals(sId)){ %>
            <li style="text-align: left;">
                <a onclick="location.reload()" href="../action/commentDeleteAction.jsp?bdNo=<%=bdNo%>&cmNo=<%=list.get(i).getCmNO()%>&sId=<%=sId%>">삭제</a>
            <% } %>
                <%--    답글 글쓰기 View    1:view 화면타입,2:리스트[i]     --%>
                <button onclick="replyViewBtn('inherit',<%=i%>)">답글쓰기</button>
            </li>
        </ul>

        <%--   답글 쓰기 view     --%>

        <h4 style="margin-left: 0px">답글</h4>
        <ul style="display: none; margin-left: 30px;" class="reply-body">
            <li><%=sId%></li>
            <li><input type="text" name="reply-content"></li>
            <li>
                <button onclick="replyViewBtn('none',<%=i%>)">취소</button>
                <%--    답글 글쓰기 View    1:리스트[i] 화면타입,2:bdNo,3:cmNo     --%>
                <button onclick="replyWrite(<%=i%>,<%=bdNo%>,<%=list.get(i).getCmNO()%>)">등록</button>
            </li>
        </ul>

        <%--   답글     --%>
        <% List<ReplyVO> rlList = new Board().replyList(bdNo,list.get(i).getCmNO());%>

            <% for (int j = 0; j < rlList.size();j++){%>
        <hr>
        <ul style="margin-left: 30px">
            <li><%=rlList.get(j).getRlUserId()%></li>
            <li><%=rlList.get(j).getRlContent()%></li>
            <li><%=rlList.get(j).getRlFirstDate()%></li>
        </ul>
            <%}%>
        <%--   답글     --%>

        <%}%>
    </div>
    <div>
        <ul style="border: 1px solid #1C1C1C">
            <li><%=sId%></li>
            <li><input type="text" id="cm_content"></li>
            <li><button onclick="commentBtn()">등록</button></li>
        </ul>
        <ul style="text-align: center;">
            <li>
                <% for (int i = pgVO.getPageBlock(); i<=pgVO.getPageTotal();i++){%>
                    <a href="?bdNo=<%=bdNo%>&pg=<%=i%>">[<%=i%>]</a>
                <%}%>
            </li>
        </ul>
    </div>



    <div style="height: 100px;"></div>

</div>
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>

    //삭제 버튼
    function box(){
        let bdNo = [];
        bdNo.push(<%=bdNo%>);

        $.ajax({
            url: "../action/deleteAction.jsp",
            type: "POST",
            data:{bdNo:bdNo},
            success:function(data){
                if (data == 1){
                    alert("삭제 성공");
                }else {
                    alert("삭제 실패");
                }
                location.href = '../view/board.jsp';
            },
            error:function (error) {
                console.log(error);
            }
        });
    }

    // 댓글 작성
    function commentBtn(){
        let content = document.getElementById('cm_content').value;

        $.ajax({
           url: "../action/commentWriteAction.jsp",
           type:"GET",
           data:{
               bdNo:'<%=bdNo%>',
               cmUserId:'<%=sId%>',
               cmContent:content,
           },
           success: function (data) {
               if (data == 1){
                   location.reload();
               }else {
                   alert('등록 실패');
               }
            },
           error: function (error) {
                console.log(error);
            }
        });
    }

    // 답글 쓰기 view버튼
    function replyViewBtn(type,idx){

        let replyBody = document.getElementsByClassName('reply-body')[idx];

        replyBody.style.display = type;
        console.log(idx);


        // replyBody.style.

    }
    function replyWrite(idx,bdNo,cmNo){
        let replyContent = document.getElementsByName('reply-content')[idx].value;

        console.log(bdNo);
        console.log(cmNo);
        console.log(replyContent);
        $.ajax({
           type:'GET',
           url:'../action/replyWriteAction.jsp',
           data:{
               bdNo:bdNo,
               cmNo:cmNo,
               rlUserId:'<%=sId%>',
               rlContent:replyContent
           },
           success:function (data) {
               if (data == 1){
                   location.reload();
               }else {
                   alert('등록 실패');
               }
           },
           error:function (error) {

           }
        });
    }

</script>

</html>


