

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.webweak.dao.Board" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: leedonghun
  Date: 9/20/20
  Time: 12:13 오전
  To change this template use File | Settings | File Templates.
--%>

<jsp:useBean id="boardVO" class="com.webweak.vo.BoardVO" />
<%


//    ----------------------------------------

    String encType = "UTF-8";
    // 파일 서버 절대 경로
    String path = application.getRealPath("/upload");
    // 파일 크기 지정
    int maxSize = 1024*1024*10;
    // 서버 저장 파일 이름
    String file = "";
    // 원본 파일 이름
    String ogFile = "";
    try{
        MultipartRequest multi = new MultipartRequest(request, path, maxSize,encType,new DefaultFileRenamePolicy());

        // form 태그 태그 값
        Enumeration files = multi.getFileNames();
        // form 태그 String 형변환
        String str = (String) files.nextElement();


//        file = multi.getFilesystemName(str);
        ogFile = multi.getOriginalFileName(str);



        String title = (String)multi.getParameter("bdTitle");
        String content = (String)multi.getParameter("bdContent");
        String fileName = new Board().fileUpload(path,ogFile);


        boardVO.setBdUserId((String) session.getAttribute("id"));
        boardVO.setBdTitle(title);
        boardVO.setBdContent(content);
        boardVO.setBdFileName(fileName);


//  ---------------------------
        int rs = new Board().write(boardVO);

        PrintWriter script = response.getWriter();

        script.println("<script>");
        if (rs == 1){

            script.print("location.href = '../view/board.jsp';");

        }else {
            script.println("alert('서버쿼리 문제')");
            script.println("history.back();");
        }
        script.println("</script>");
    }catch (Exception e){
        System.out.println("MultipartRequest : "+e.getMessage());
    }

%>
