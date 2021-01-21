<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.webweak.dao.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="com.webweak.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.webweak.vo.BoardOptionsVO" %>
<%@include file="/tab.jsp"%>


<!DOCTYPE html>

<html>


<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- 뷰포트 -->

    <meta name="viewport" content="width=device-width" initial-scale="1">

    <!-- 스타일시트 참조  -->
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>

    <title>jsp 게시판 웹사이트</title>

</head>

<style>

    #body-list tr{
        width: 100%; height: 30px; text-align: center; border: 1px solid #1C1C1C; background: #FFFFFF ;
    }


    #body-list tr td{
        border-right: 1px solid #1C1C1C;
    }



</style>



<body width="100%" height="100%" align="center">

<%
    // 3개월 전
    SimpleDateFormat startDate = new SimpleDateFormat("yyyy-MM-dd");
    Calendar calStart = Calendar.getInstance();
    calStart.add(Calendar.MONTH ,-3);


    // 핸재 날짜
    SimpleDateFormat endtDate = new SimpleDateFormat("yyyy-MM-dd");
    Calendar calEnd = Calendar.getInstance();




    System.out.println();



    String startDe = startDate.format(calStart.getTime());
    String endDe = endtDate.format(calEnd.getTime());

%>

<!-- 게시판 -->
<%
    String reverse = "BD_NO"; // 역순할 컬럼 reverse
    String type = "asc"; // 역순 선택 type

    if (request.getParameter("reverse") != null){
        reverse = request.getParameter("reverse"); // reverse 값 저장;
    }

    if (request.getParameter("type") != null){
        type = request.getParameter("type"); // reverse 값 저장;
    }


    if (request.getParameter("startDe") != null){
        startDe = request.getParameter("startDe"); // reverse 값 저장;
    }

    if (request.getParameter("endDe") != null){
        endDe = request.getParameter("endDe"); // reverse 값 저장;
    }

//    -------------------------------------------------


    String searchTypes = "BD_NO,''";
    String searchText = "";

    if (request.getParameter("sTypes")!= null){
        searchTypes = request.getParameter("sTypes");

    }


    if (request.getParameter("sText")!=null){
        searchText = request.getParameter("sText");
    }




%>


<%
    final int ROWSIZE = 10;  // 한페이지에 보일 게시물 수
    final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

    int total = new Board().romSize();
    int pg = 1; //기본 페이지값




    if(request.getParameter("pg")!=null) { //받아온 pg값이 있을때, 다른페이지일때
        pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장
    }


    int start = (pg*ROWSIZE) - (ROWSIZE-1); // 해당페이지에서 시작번호(step2)
    int end = (pg*ROWSIZE); // 해당페이지에서 끝번호(step2)

    int allPage = 0; // 전체 페이지수

    int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
    int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)

    allPage = (int)Math.ceil(total/(double)ROWSIZE);

    if(endPage > allPage) {
        endPage = allPage;
    }





%>


<%
    // 글 정렬 기능
    String icon = "▼";

    if (type.equals("asc")){


        type = "desc";
        icon = "▼";

    }else if (type.equals("desc")){

        type = "asc";
        icon = "▲";



    }



%>

<%
    // 리스트 데이터 불러
    BoardOptionsVO optionsVO = new BoardOptionsVO();
    optionsVO.setStart(start);
    optionsVO.setEnd(end);
    optionsVO.setReverse(reverse);
    optionsVO.setType(type);
    optionsVO.setStartDate(startDe);
    optionsVO.setEndDate(endDe);
    optionsVO.setSearchType(searchTypes);
    optionsVO.setSearchText(searchText);


    List<BoardVO> list = new Board().list(optionsVO);
%>



<br>
<br>
<br>
    <div style="text-align: center;">

        <table class="table table-striped" style="text-align:center; border:1px solid #dddddd;width: 100%;">

            <thead style="text-align: center; " >
            <tr>

                <th style="background-color: #eeeeee; text-align: center; width: 5%">
                    체크
                </td>

                <th style="background-color: #eeeeee; text-align: center; width: 5%">
                    <a href="board.jsp?pg=<%=pg%>&reverse=BD_NO&type=<%=type%>">번호<%=icon%></a>
                </th>

                <th style="background-color: #eeeeee; text-align: center;">
                    <a href="board.jsp?pg=<%=pg%>&reverse=BD_TITLE&type=<%=type%>">제목<%=icon%></a>
                </th>

                <th style="background-color: #eeeeee; text-align: center;" width="10%">
                    <a href="board.jsp?pg=<%=pg%>&reverse=BD_ID&type=<%=type%>">작성자<%=icon%></a>
                </th>

                <th style="background-color: #eeeeee; text-align: center;" width="10%">
                    <a href="board.jsp?pg=<%=pg%>&reverse=BD_FIRS_DATE&type=<%=type%>">작성일<%=icon%></a>
                </th>

                <th style="background-color: #eeeeee; text-align: center;" width="5%">
                    <a href="board.jsp?pg=<%=pg%>&reverse=BD_COUNT&type=<%=type%>">조회수<%=icon%></a>
                </th>

            </tr>

            </thead>

            <div style="width: 100%; text-align: left">
                <button onclick="box()">다중 삭제 버튼</button>
            </div>

            <div>
                <p id="key-word">검색 키워드 : <%=searchText%></p>
            </div>


            <tbody id="body-list">

            <%


//                int reverse = total - ((pg-1)*ROWSIZE);

            //    * 핵심 : 현재 게시판 레코드의 토탈 갯수 - ((현재 페이지-1) * 한 화면에 보여질 레코드의 갯수)



                for (BoardVO vo : list){
                int cmSize = new Board().commentSize(vo.getBdNo());
            %>
            <tr>


                <%--        다중 삭제 기능        --%>
                <% if (sId.equals(vo.getBdUserId())){%>
                <td><input  type="checkbox" name="romBox" value="<%=vo.getBdNo()%>"/></td>
                <%}else {%>
                <td><p style="height: 20px"></p></td>
                <%}%>
                <%--        다중 삭제 기능        --%>

                <td><%=vo.getBdNo()%></td>
                <td style="text-align: left;">
                    <a onclick="location.reload()" href="./choice.jsp?bdNo=<%=vo.getBdNo()%>">
                        <%=vo.getBdTitle()%> [<%=cmSize%>]

                        <% if (vo.getBdFileName() != null){ %>
                                <%="■"%>
                            <%}else {%>

                            <%}%>

                    </a>

                </td>
                <td><%=vo.getBdUserId()%></td>
                <td><%=vo.getBdFirstDate()%></td>
                <td><%=vo.getBdCount()%></td>
            </tr>
            <%}%>

            </tbody>

        </table>

        <a href = "write.jsp" class="btn btn-primary pull-right" style="width: 100%">글쓰기</a>


        <div style="width: 100%; text-align: center;">
        <select id="keywordDate">
            <option value="<%=startDe%>">전체기간</option>
            <option value="<%=new Board().searchDate(1)%>">1일</option>
            <option value="<%=new Board().searchDate(7)%>">1주일</option>
            <option value="<%=new Board().searchDate(30)%>">1달</option>
        </select>

        <select id="keyword">
            <option value="0">선택</option>
            <option value="BD_NO">번호</option>
            <option value="BD_CONTENT">제목+내용</option>
            <option value="BD_TITLE">제목</option>
            <option value="BD_ID">작성자</option>
        </select>


        <input id="keywordText" type="text">
        <button onclick="keywordSearch()">검색</button>

        </div>

    </div>


</div>

<div>
    <p>날짜 검색</p>
    <input type="text" id="startDate" value="<%=startDate.format(calStart.getTime())%>">
    <input type="text" id="endtDate" value="<%=endtDate.format(calEnd.getTime())%>">
    <button onclick="dateSecarch()">설정</button>
</div>

<div style="width: 100%; text-align: center;">
    <tr>

        <%--        <%--%>
        <%--            if(pg>BLOCK) {--%>
        <%--        %>--%>
        <%--        <a href="list.jsp?pg=1">◀◀</a>--%>
        <%--        <a href="list.jsp?pg=<%=startPage-1%>">◀</a>--%>
        <%--        <%--%>
        <%--            }--%>
        <%--        %>--%>

        <% for(int i = startPage;i<=endPage;i++){%>
        <td>
            <a href="board.jsp?pg=<%=i%>&reverse=<%=reverse%>&type=asc">[<%=i%>]</a>
        </td>
        <%}%>

        <%--<%
            if(endPage<allPage){
        %>
        <a href="list.jsp?pg=<%=endPage+1%>">▶</a>
        <a href="list.jsp?pg=<%=allPage%>">▶▶</a>
        <%
            }
        %>--%>

    </tr>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>

    (function(){
       onkeyup = x ;
    }())

    // ex: 2020-09-02 ~ 2020-10-02 까지 검색
    function dateSecarch(){
        let startDate = document.getElementById('startDate').value;
        let endDate = document.getElementById('endtDate').value;


        location.href = './board.jsp?pg=<%=pg%>&reverse=<%=reverse%>&type=asc&startDe='+startDate+'&endDe='+endDate;
    }

    // 날짜 0000-00-00 만드는 코드
    function x() {

        let startDate = document.getElementById('startDate').value;
        let endDate = document.getElementById('endtDate').value;

        document.getElementById('startDate').value = dateTextChange(startDate);
        document.getElementById('endtDate').value = dateTextChange(endDate);

    }

    // 체크 박스 삭제 버튼
    function box(){
        let idx = [];
        let box = document.getElementsByName('romBox');
        for (let i = 0;i<box.length;i++){
            if (box[i].checked){
                idx.push(box[i].value);
            }
        }


        $.ajax({
            url: "../action/deleteAction.jsp",
            type: "POST",
            data:{idx:idx},
            success:function(data){
                if (data == 1){
                    alert("삭제 성공");
                }else {
                    alert("삭제 실패");
                }
                location.reload();
            },
            error:function (error) {
                console.log(error);
            }
        });
    }

    // 기간 검색 : 1,7,30 일 검색
    function keywordSearch() {

        let date = document.getElementById('keywordDate').value;
        let key = document.getElementById('keyword').value;
        let text = document.getElementById('keywordText').value;



        let searchList = [];




    // alert(key);

        if (text == ''){
            alert('검색어를 입력해주세요.');
        }else if (key == 0){
            alert('검색어를 목록선택 해주세요.');
        }else {

        if (key == "BD_CONTENT"){
            searchList.push("BD_TITLE");
            searchList.push(key);
        }else {
            searchList.push(key)
            searchList.push("''");
        }
        location.href = './board.jsp?pg=<%=pg%>&reverse=<%=reverse%>&type=asc&startDe='+date+'&endDe=<%=endDe%>&sTypes='+searchList+'&sText='+text;
        }

    }


    // 날짜 input 계산 0000-00-00
    function dateTextChange (str){
        let tmp = '';
        if (str.length < 4){
            return str;
        }else if (str.length < 5) {
            tmp += str.substr(0, 4);
            tmp += '-';
            return tmp;
        }else if (str.length < 7) {
            tmp += str.substr(0, 4);
            tmp += '-';
            tmp += str.substr(5, 2);
            return tmp;
        }else{
            tmp += str.substr(0, 4);
            tmp += '-';
            tmp += str.substr(5, 2);
            tmp += '-';
            tmp += str.substr(8, 2);
            return tmp;
        }
    }
</script>
</html>



